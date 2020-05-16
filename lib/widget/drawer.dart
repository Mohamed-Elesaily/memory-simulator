import 'package:flutter/material.dart';
import 'package:memory_simulator/algorithm/memory/memory.dart';
import 'package:memory_simulator/algorithm/process/processbuilder.dart';
import 'package:memory_simulator/widget/inputfield.dart';

class Configureation extends StatefulWidget {
  @override
  _ConfigureationState createState() => _ConfigureationState();
}

class _ConfigureationState extends State<Configureation> {
    TextEditingController _segment = new TextEditingController();
  TextEditingController _sizeSegment = new TextEditingController();
  TextEditingController _partition = new TextEditingController();
  TextEditingController _sizePartition = new TextEditingController();
   TextEditingController _memorySize = new TextEditingController();
      TextEditingController _maxSize = new TextEditingController();
  var _process = ProcessBuilder();
  var _memory = Memory();
  @override
  Widget build(BuildContext context) {
    return  Drawer(
              
              child:ListView(
                children: [
                  Card(
                      child: Container(
                      height:200,
                      child: Column(
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('process'),
                              IconButton(
                                tooltip: 'add process',
                                icon: Icon(Icons.add),
                                 onPressed: (){
                                   setState(() {
                                     _process.addProcess();
                                     ProcessBuilder.num++;
                                   });
                                   
                              }),
                          
                            ],),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('segment'),
                              Input(_segment),
                              Input(_sizeSegment),
                               IconButton(
                                tooltip: 'add process',
                                icon: Icon(Icons.add),
                                 onPressed: (){
                                   setState(() {
                                     ProcessBuilder.process[ProcessBuilder.num-1].addSegment(_segment.text,
                                               int.parse(_sizeSegment.text));
                                      
                                      _segment.clear();
                                      _sizeSegment.clear();         
                                   });
                              }),
                            ],
                          ),
                           SizedBox(height: 10,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Memory')
                            ],),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('partition'),
                              Input(_partition),
                              Input(_sizePartition),
                               IconButton(
                                tooltip: 'add process',
                                icon: Icon(Icons.add),
                                 onPressed: (){
                                   setState(() {
                                     _memory.addPartition(int.parse(_partition.text),
                                               int.parse(_sizePartition.text));
                                      
                                      _partition.clear();
                                      _sizePartition.clear();
                                               
                                   });
                              }),
                            ],
                          )
                        ]
                      ),
                    ),
                  ),
                  Text('process table'),
                  SizedBox(height:20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('name'),
                      Text('size'),
                    ],),
                   processTable(),
                   Text('partition table'),
                   SizedBox(height:20),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('start'),
                      Text('size'),
                    ],),
                   memoryTable(),
                   SizedBox(height:20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("max size")
                        ],),
                      Input(_maxSize),
                     IconButton(
                     icon: Icon(Icons.directions_run), 
                     onPressed: (){
                       Memory.maxsize = int.parse(_maxSize.text);
                     }
                     ),
                ],

              ),
            );

  }
  Card processTable(){
  return Card(
              child: Container(
              height:200,
              child: Stack(
                children:[
                  Center(child: VerticalDivider()),
                    Container(
                    height:200,
                    child: ListView.builder(
                      itemCount: ProcessBuilder.num,
                      itemBuilder: (context,index){
                        return Container(
                          child: Column(
                            children:[
                              Divider(
                                  thickness:4
                                ),
                              Row(
                                
                                children: [
                                  SizedBox(width: 20,),
                                  Text('P${index}')],
                                
                                ),
                                Divider(
                                  thickness:4
                                ),
                              Container(
                                height: 75,
                                child: ListView.builder(
                                  itemCount: ProcessBuilder.process[index].segment.length,
                                  itemBuilder: (context,indexSeg){
                                    return Container(
                                      height: 30,
                                      child: 
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                                Text('${ProcessBuilder.process[index].segment[indexSeg].name}'),
                                                Text('${ProcessBuilder.process[index].segment[indexSeg].size}'),

                                            ],)
                                      
                                    );
                                  }
                                  ),
                              )
                            ]
                          ),
                        );
                      }
                      
                      ),
                    )
                ]
              ),
            ),
          );
}
Card memoryTable(){
  return Card(
              child: Container(
              height:200,
              child: Stack(
                children:[
                  Center(child: VerticalDivider()),
                    Container(
                    height:200,
                    child:Stack(
                      children: [
                        ListView.builder(
                          itemCount: Memory.partition.length,
                          itemBuilder: (context,index){
                            return Column(
                              children: [
                                Divider(thickness:4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children:[
                                      Text('${Memory.partition[index].start}'),
                                      Text('${Memory.partition[index].size}'),
                                    
                                  ]
                                ),
                              ],
                            );
                          }
                          ),
                      ],
                    )
                    )
                ]
              ),
            ),
          );
}

}