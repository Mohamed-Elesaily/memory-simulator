import 'package:memory_simulator/algorithm/process/segment.dart';


class Process{
  String name;
  List<Segment> segment = new List<Segment>();
  Process(this.name);
  void addSegment(String name,int size){
    segment.add(new Segment(name, size));
  }

}
