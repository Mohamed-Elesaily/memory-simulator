
import 'package:memory_simulator/algorithm/process/process.dart';
import 'package:memory_simulator/algorithm/process/segment.dart';
class ProcessBuilder{
  static ProcessBuilder _processBuilder = ProcessBuilder._internal();
   factory ProcessBuilder(){
     return _processBuilder;
   }
  static List<Process> process = new List<Process>();
  static int num =0;
  void addProcess(){
    process.add(new Process("p$num"));
   
  }
  void addSegments(String name,int size){
  process[num].addSegment(name, size);
  }
  void finish(){
    num++;
  }
  void clearAll(){
    process.clear();
    num = 0;
  }

  int getSegmentlength(int index){
    return ProcessBuilder.process[index].segment.length;
  }

  Segment getSegment(int index, int segmentindex){
   return ProcessBuilder.process[index].segment[segmentindex];
  }
  int getSegmentsize(int index, int segmentindex){
   return ProcessBuilder.process[index].segment[segmentindex].size;
  }
  ProcessBuilder._internal();
 }
