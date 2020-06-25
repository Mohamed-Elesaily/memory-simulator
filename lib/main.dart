import 'package:flutter/material.dart';
import 'package:memory_simulator/algorithm/memory/memory.dart';
import 'package:memory_simulator/algorithm/process/processbuilder.dart';
import 'package:memory_simulator/algorithm/segmentTable/segmentTable.dart';
import 'package:memory_simulator/widget/drawer.dart';
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
  var _tempscall = 1;

  int processindex = 0;
  int segmentindex = 0;
  ListOfSegment show = new ListOfSegment();
  List<Positioned> hole = new List<Positioned>();
  List<Positioned> part = new List<Positioned>();

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
                    for (int processindex = 0;
                        processindex < SegmentTable.segmentTable.length;
                        processindex++) {
                      for (int segmentindex = 0;
                          segmentindex <
                              SegmentTable.segmentTable[processindex]
                                  .eachProcess.length;
                          segmentindex++) {
                        show.segments.add(
                          new ShowSegment(
                              SegmentTable
                                  .segmentTable[processindex].proceesName,
                              SegmentTable.segmentTable[processindex]
                                  .eachProcess[segmentindex].name,
                              SegmentTable.segmentTable[processindex]
                                  .eachProcess[segmentindex].base,
                              SegmentTable.segmentTable[processindex]
                                  .eachProcess[segmentindex].limit,
                              Colors.blue),
                        );
                      }
                    }
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
                SizedBox(width: 10),

                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _process.clearAll();
                        _segmentTable.clearAll();
                        _partition.clearAll();
                        show.segments.clear();
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
                                  onPressed: () {
                                    setState(() {
                                     show.segments.clear();
                                      _segmentTable.bestFit();
                                    });
                                  },
                                ),
                                RaisedButton(
                                  child: Text("first fit"),
                                  onPressed: () {
                                    setState(() {
                                        show.segments.clear();
                                      _segmentTable.firstFit();
                                    });
                                  },
                                ),
                                
                              ],
                            ),
                            SizedBox(height: 60),
                            Tooltip(
                              message: 'height scalling',
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _scalling += 1;
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(
                                        Icons.minimize,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (_scalling != 1) {
                                            _scalling -= 1;
                                          }
                                        });
                                      })
                                ],
                              ),
                            ),
                            Tooltip(
                              message: 'Position scalling',
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _tempscall += 1;
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(
                                        Icons.minimize,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (_tempscall != 1) {
                                            _tempscall -= 1;
                                          }
                                        });
                                      })
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 300),
                Container(
                    width: 400,
                    child: ListView(
                      children: [
                        Container(
                          height: Memory.maxsize / 1 + _scalling,
                          child: Stack(children: [
                            Positioned(
                              child: Text("0"),
                              top: (1.0 + _scalling),
                            ),
                            Positioned(
                              child: Text("${Memory.maxsize}"),
                              bottom: 0 / 1 + _scalling,
                            ),
                            for (var i in Memory.partition)
                              item("", "", i.start, i.size, Colors.green),
                            for (var j in show.segments)
                              item(j.processName, j.segmentName, j.base,
                                  j.limit, Colors.blue),
                          ]),
                        ),
                      ],
                    ))
              ],
            )));
  }

  Positioned item(
      String process, String segment, int base, int limit, Color color) {
    return Positioned(
      height: ((limit / 1.0) + _scalling),
      // height: 100,
      width: 400,
      child: Tooltip(
              message: 'deallocate $process',
              child: InkWell(
                child: Container(
            color: color,
            child: Stack(
              children: [
                Align(alignment: Alignment.topLeft, child: Text('$base')),
                Center(
                  child: Wrap(
                      direction: Axis.vertical,
                      children: [Text("$process "), Text(segment)]),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('${(base + limit)}')),
              ],
            ),
          ),
          
          onTap: (){
              print('object');
              setState(() {
                show.delete(process);
               
              });
          },
    
        ),
      ),
      top: (base / 1) + _tempscall + 20,
    );
  }
}

class ShowSegment {
  String processName;
  String segmentName;
  int base;
  int limit;
  Color color;
  ShowSegment(
      this.processName, this.segmentName, this.base, this.limit, this.color);
}

class ListOfSegment {
  List<ShowSegment> segments = new List<ShowSegment>();
  void delete(String  name){
    segments.removeWhere((element) => element.processName == name);
  }
}
