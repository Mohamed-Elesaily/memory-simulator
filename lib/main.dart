import 'package:flutter/material.dart';
import 'package:memory_simulator/algorithm/memory/memory.dart';
import 'package:memory_simulator/algorithm/process/processbuilder.dart';
import 'package:memory_simulator/algorithm/segmentTable/elementTable.dart';
import 'package:memory_simulator/algorithm/segmentTable/segmentTable.dart';
import 'package:memory_simulator/widget/drawer.dart';
import 'package:memory_simulator/widget/inputfield.dart';
import 'package:memory_simulator/widget/segmentTableWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _process = ProcessBuilder();
  var _segmentTable = SegmentTable();
  var _partition = Memory();
  var _scalling = 1;
  var _segmentTab =new List<ElementTable>.from(SegmentTable.segmentTable);
  static List<Positioned> hole = new List<Positioned>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.play_arrow), 
                onPressed: () {
                    setState(() {
                    
                     parti();

                    });


                }),
            appBar: AppBar(
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.memory),
                    Text('Memory Simulator')
                  ]),
              actions: [
                
                // Center(child: Text('Memory size')),
                SizedBox(width:10),
                
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _process.clearAll();
                        _segmentTable.clearAll();
                        _partition.clearAll();

                      });
                    }),
                  
              ], 
              
            
            ),
            drawer: Configureation(),
            body: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  children: [
                    SegmentTableWidget(),
                    Card(
                        child: Container(
                          height: 200,
                          width: 400,
                          child: ListView(
                          children: [
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                
                                 
                                 RaisedButton(
                                   child: Text("Best fit"),
                                   onPressed: (){
                                     setState(() {
                                     _segmentTable.bestFit();
                                     });
                                       

                                 },),

                             RaisedButton(
                                   child: Text("first fit"),
                                   onPressed: (){
                                   
                                      setState(() {
                                           _segmentTable.firstFit();
                                      });

                                 },),
                              IconButton(
                                  icon: Icon(Icons.arrow_forward,size: 50,),
                                   onPressed: (){

                                   }),
                              
                              ],),
                              SizedBox(height:60),
                              Tooltip(
                                message:'Scalling' ,
                                child:Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround, 
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add,size:30,),
                                  onPressed: (){
                                      setState(() {
                                        if(_scalling!=1){
                                          _scalling -= 1;
                                        }
                                      });
                                   }
                                   ),
                                   IconButton(
                                  icon: Icon(Icons.minimize,size: 30,),
                                  onPressed: (){
                                      setState(() {
                                        _scalling +=1;
                                
                                      });
                                   })
                             
                              ],), 
                                ),
                              
                          ],
                      ),
                        ),
                    )
                  ],
                ),
                SizedBox(width:300),
                Container(
                  width:400,
                  color:Colors.blue,
                  child:
                          Stack(
                            children:[
                              Text("0"),
                              Positioned
                              (child: Text("${Memory.maxsize}"),
                              bottom: 10.0*_scalling,
                              
                              ),
                              // Positioned(
                              //     height:300/_scalling,
                              //     width:400,
                              //     child: Container(
                              //       height:50,
                              //       color:Colors.green
                              //     ),
                              //     top: 200/_scalling,
                              //     ),
                            // item("procees", "segment", 300, 400),
                             
                             for(Positioned i in hole) i,
                             
                            
                                
                            ]
                          )
                      

                  
                )
              ],
            )
            
            )
            );
  }
  Positioned item(String process,String segment,int base,int limit){
    return  Positioned(
              height:limit/_scalling,
              width:400,
              child: Container(
                
                color:Colors.green,
                child: Stack(
                  children: [
                   Align(
                      alignment:Alignment.topLeft,
                      child:Text('$base')
                    ),
                    Center(
                      child:Wrap(
                        direction: Axis.vertical,
                        children:[
                          Text("$process "),
                          Text(segment)
                        ]
                      ),
                    ),
                    Align(
                      alignment:Alignment.bottomLeft,
                      child:Text('${(base+limit)}')
                    )
                    
                  ],
                ),
              ),
              top:base/_scalling,
              );
  }


void parti(){
 
  for(int i=0;i<Memory.partition.length;i++){
      hole.add(item("","",Memory.partition[i].start,Memory.partition[i].size));
  }
}

}

