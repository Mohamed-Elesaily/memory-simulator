import 'package:memory_simulator/algorithm/memory/partition.dart';

class Memory{
  static Memory _memory = Memory._internal();
   factory Memory(){
     return _memory;
   }
  static int maxsize; 
  static List<Partition> partition = new List<Partition>();
  static List<Partition> memoryMap = new List<Partition>();
  void addPartition(int start,int size){
    partition.add(new Partition(start,size));
  }
  void makeMemory(){

    for(int i=0;i<partition.length;i++){
      
    }
  }
  void clearAll(){
    partition.clear();  
  }
  Memory._internal();
 }
