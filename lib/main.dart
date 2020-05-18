import 'package:flutter/material.dart';
import 'package:memory_simulator/algorithm/memory/memory.dart';
import 'package:memory_simulator/algorithm/process/processbuilder.dart';
import 'package:memory_simulator/algorithm/segmentTable/elementTable.dart';
import 'package:memory_simulator/algorithm/segmentTable/segmentTable.dart';
import 'package:memory_simulator/widget/drawer.dart';
import 'package:memory_simulator/widget/inputfield.dart';
import 'package:memory_simulator/widget/segmentTableWidget.dart';
import 'package:memory_simulator/algorithm/segmentTable/element.dart' as element;
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
  var _tempscall =1;

  var _segmentTab =new List<ElementTable>();
  int processindex=0;
  int segmentindex=0;
  
  List<Positioned> hole = new List<Positioned>();
  
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
                    
                    //  _partition.makeMemory();

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
                Wrap(
                  direction: Axis.vertical,
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
                                     ElementTable temp;
                                     element.Element t;
                                     if(processindex < SegmentTable.segmentTable.length){
                                       if(segmentindex<SegmentTable.segmentTable[processindex].eachProcess.length){
                                        //  temp.proceesName = SegmentTable.segmentTable[processindex].proceesName;
                                        //  t.base=SegmentTable.segmentTable[processindex].eachProcess[segmentindex].base;
                                        //  t.limit=SegmentTable.segmentTable[processindex].eachProcess[segmentindex].limit;
                                        //  t.name =SegmentTable.segmentTable[processindex].eachProcess[segmentindex].name;
                                        //   temp.eachProcess.add(t);
                                          // temp = List<ElementTable>.from(temp);
                                          setState(() {
                                             hole.add(item(SegmentTable.segmentTable[processindex].proceesName,
                                        SegmentTable.segmentTable[processindex].eachProcess[segmentindex].name,
                                          SegmentTable.segmentTable[processindex].eachProcess[segmentindex].base,
                                          SegmentTable.segmentTable[processindex].eachProcess[segmentindex].limit,Colors.blue),
                                          );
                                          });
                                     
                                         segmentindex++;
                                      
                                       }else{
                                         segmentindex = 0;
                                          processindex++;
                                       }
                                     }else{
                                      
                                     }
                                   }),
                              
                              ],),
                              SizedBox(height:60),
                               Tooltip(
                                message:'height scalling' ,
                                child:Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround, 
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add,size:30,),
                                  onPressed: (){
                                      setState(() {
                                        
                                          _scalling += 1;
                                         
                                         
                                        
                                      
                                      });
                                   }
                                   ),
                                   IconButton(
                                  icon: Icon(Icons.minimize,size: 30,),
                                  onPressed: (){
                                      setState(() {
                                        if(_scalling!=1){
                                        _scalling -=1;
                                        }
                                      });
                                   })
                             
                              ],), 
                                ),
                                 Tooltip(
                                message:'Position scalling' ,  
                                child:Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround, 
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add,size:30,),
                                  onPressed: (){
                                      setState(() {
                                        
                                          _tempscall  += 1;
                                         
                                         
                                        
                                      
                                      });
                                   }
                                   ),
                                   IconButton(
                                  icon: Icon(Icons.minimize,size: 30,),
                                  onPressed: (){
                                      setState(() {
                                        if(_tempscall!=1){
                                        _tempscall  -=1;
                                        }
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
                
                  child:
                         ListView(
                            children: [
                              Container(
                                height: Memory.maxsize/_scalling,
                                child: Stack(
                                  children:[
                                    
                                      Positioned
                                    (child: Text("0"),
                                    top: (10.0*_scalling),
                                    
                                    ),
                                    Positioned
                                    (child: Text("${Memory.maxsize}"),
                                    bottom: (10.0*_scalling),
                                    
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
                                        
                                  for(var i in Memory.partition) item("","",i.start,i.size,Colors.green),
                             
                                  for(var i in hole) i,
                                  
                                  // Container(
                                  //   height: 600,
                                  //   width: 100,
                                  //   child: ListView.builder(
                                  //     itemCount: Memory.memoryMap.length,
                                  //     itemBuilder: (context,index){
                                  //       return Column(
                                  //         children: [
                                  //           SizedBox(height:20),
                                  //           item("","",Memory.partition[index].start,Memory.partition[index].size),
                                  //           SizedBox(height:80),
                                  //         ],
                                  //       );
                                  //     }
                                  //     )
                                  // )
                                      
                                  ]
                                ),
                              ),
                            ],
                          )
                      

                  
                )
              ],
            )
            
            )
            );
  }
  Positioned item(String process,String segment,int base,int limit,Color color){
    return  Positioned(
              height:((limit/1.0)*_scalling),
                // height: 100,
              width:400,
              child: Container(
                
                color:color,
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
              top:(base/1)*_tempscall,
              );
  }

}

