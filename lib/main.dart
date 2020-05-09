import 'package:flutter/material.dart';
import 'package:memory_simulator/algorithm/process/processbuilder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
              IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _process.clearAll();
                    });
                  })
            ],
          ),
          body: Container()
        ));
  }
}
