import 'package:flutter/material.dart';
import 'package:memory_simulator/algorithm/segmentTable/segmentTable.dart';

class SegmentTableWidget extends StatefulWidget {

  @override
  _SegmentTableWidgetState createState() => _SegmentTableWidgetState();
}

class _SegmentTableWidgetState extends State<SegmentTableWidget> {
 
  @override
  Widget build(BuildContext context) {
    return Card(
                child: Container(
                height: 400,
                width: 500,
                child: ListView.builder(
                  itemCount:SegmentTable.segmentTable.length,
                  itemBuilder: (context,index){
                    return Card(
                        child: Container(
                        color: Colors.green,
                       
                        child:  Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                VerticalDivider(thickness: 4,),
                                 VerticalDivider(thickness: 4,),
                                
                              ],
                            ),
                            Column(
                              children: [
                                Text("${SegmentTable.segmentTable[index].proceesName} segment table"),
                                Divider(thickness: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                                  children:[
                                    Text("name"),
                                    Text("limit"),
                                    Text("base"),
                                  ]
                                ),
                                Divider(thickness: 4,),
                                 Container(
                                height: 120,
                               child: ListView.builder(
                                 itemCount: SegmentTable.segmentTable[index].eachProcess.length,
                                 itemBuilder: (context,i){
                                    return Column(
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children:[
                                            Text("${SegmentTable.segmentTable[index].eachProcess[i].name}"),
                                            Text("${SegmentTable.segmentTable[index].eachProcess[i].limit}"),
                                            Text("${SegmentTable.segmentTable[index].eachProcess[i].base}")

                                          ]
                                        ),
                                      ],
                                    ); 

                                 })
                              )
                              ],
                            ),
                         
                          ],
                        )
                      ),
                    );
                  }
                  ),
              ),
            );
          
  }
}