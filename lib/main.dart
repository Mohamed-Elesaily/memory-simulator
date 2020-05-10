import 'package:flutter/material.dart';
import 'package:memory_simulator/algorithm/process/processbuilder.dart';
import 'package:memory_simulator/widget/inputfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _segment = new TextEditingController();
  TextEditingController _sizeSegment = new TextEditingController();
  TextEditingController _partition = new TextEditingController();
  TextEditingController _sizePartition = new TextEditingController();
   TextEditingController _memorySize = new TextEditingController();
  var _process = ProcessBuilder();
  @override
  Widget build(BuildContext context) {
    var center = Center(
        child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.vertical,
      children: [
        IconButton(
            icon: Icon(Icons.add),
            tooltip: 'add process',
            onPressed: () {
              setState(() {
                ProcessBuilder.num++;
              });
            }),
        IconButton(
            icon: Icon(Icons.add),
            tooltip: 'add process',
            onPressed: () {
              setState(() {
                ProcessBuilder.num++;
              });
            }),
      ],
    ));
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.play_arrow), onPressed: () {}),
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
                      });
                    }),
                  
              ],
              
            
            ),

            body:ListView(
              children:[
                inputs(),

              ]
            )
             
            
            ));
  }
  Card inputs(){
    return  Card(
          child: Container(
                  height: 150,
                  width: 500,
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    direction: Axis.vertical,
                    children: [
                      Wrap(
                        spacing: 20,
                        alignment: WrapAlignment.spaceAround,
                        direction: Axis.horizontal,
                        children: [
                        
                            Text('segment'),
                        
                          Input(_segment),
                          Text('size'),
                          Input(_sizeSegment),
                          IconButton(
                            icon: Icon(Icons.add), 
                            onPressed: (){
                              _process.addSegments(_segment.text, int.parse(_sizeSegment.text));
                              _segment.clear();
                              _sizeSegment.clear();
                            },
                            tooltip: 'add segment',
                            ),
                        ],
                      ),
                      Wrap(
                        spacing: 20,
                        alignment: WrapAlignment.spaceAround,
                        direction: Axis.horizontal,
                        children: [
                          Text('partition'),
                          Input(_partition),
                          Text('size'),
                          Input(_sizePartition),
                          IconButton(
                            icon: Icon(Icons.add), 
                            onPressed: (){
                              _process.addSegments(_segment.text, int.parse(_sizeSegment.text));
                             
                            },
                            tooltip: 'add partition',
                            ),
                        ],
                      ),
                    Wrap(
                       spacing: 20,
                        alignment: WrapAlignment.spaceAround,
                        direction: Axis.horizontal,
                        children:[
                               Text('memory'),
 IconButton(  
                            icon: Icon(Icons.add), 
                            onPressed: (){
                              _process.addSegments(_segment.text, int.parse(_sizeSegment.text));
                              _segment.clear();
                              _sizeSegment.clear();
                            },
                            tooltip: 'Memory size',
                            ),
                  Input(_memorySize),
                  Text('add process'),
                  IconButton(
                            icon: Icon(Icons.add), 
                            onPressed: (){
                             _process.addProcess();
                            },
                            tooltip: 'add Process',
                            ),
                        ]
                      )

                    ],
                  )),
    );
  }
}
