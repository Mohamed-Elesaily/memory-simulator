import 'package:memory_simulator/algorithm/memory/partition.dart';

class Memory{
  static Memory _memory = Memory._internal();
   factory Memory(){
     return _memory;
   }
  static int maxsize=1; 
  static List<Partition> partition = new List<Partition>();
  static List<Partition> memoryMap = new List<Partition>();
  void addPartition(int start,int size){
    partition.add(new Partition(start,size));
  }
  void makeMemory(){
    int start = 0;
    Partition temp = new Partition(null,null);
    for(int i=0;i<partition.length;i++){
       if(start < partition[i].start){
         temp.start = start;
         temp.size = partition[i].size -start;
         memoryMap.add(temp);
         memoryMap.add(partition[i]);
         start = partition[i].start + partition[i].size;
       }
    }
    if(start < maxsize) {
      temp.start = start;
      temp.size = maxsize;
      memoryMap.add(temp);
    }
  }
  void clearAll(){
    partition.clear();  
  }
  Memory._internal();
 }
