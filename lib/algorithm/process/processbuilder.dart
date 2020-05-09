
import 'package:memory_simulator/algorithm/process/process.dart';
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
  ProcessBuilder._internal();
 }
