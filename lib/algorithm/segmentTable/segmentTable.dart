import 'package:memory_simulator/algorithm/memory/memory.dart';
import 'package:memory_simulator/algorithm/memory/partition.dart';
import 'package:memory_simulator/algorithm/process/processbuilder.dart';
import 'elementTable.dart';



class SegmentTable{
  // singleton object
 static SegmentTable _table = SegmentTable._internal();
  factory SegmentTable(){
    return _table;
  }

  //////////////////////////////////////////////
  String type;
  static List<ElementTable> segmentTable = new List<ElementTable>();
  static int num =0;
  
  ////////////////////////////////////////
  //__________EXTENSIONS___________//
  List<Partition> temp = new List<Partition>();
  var _process = new ProcessBuilder();
  
  
  //////////////////////////////////////
  
  
  //_________________________methods__________________//
    void _addTable(){
    segmentTable.add(new ElementTable("p$num"));

  }
  void addElement(int base,int limit,String name){
  segmentTable[num].addElement(name,base, limit);
  }
  void finish(){
  num++;
    }
   void clearAll(){
    segmentTable.clear();
    num = 0;
  }
  
  // to make copy of partition's start
void _writeTemp(){
  temp.clear();
  for(int i=0;i<Memory.partition.length;i++){
    temp.add(new Partition(Memory.partition[i].start, Memory.partition[i].size));

  }
     
  
  // print(temp.length);

}
///////////////////////////////////
// algorithm
void _prepare(){
  for(int i=0;i<ProcessBuilder.process.length;i++){
    print(ProcessBuilder.process.length);
    _addTable();
    for(int j=0;j<_process.getSegmentlength(i);j++){
      addElement(null, _process.getSegmentsize(i, j),ProcessBuilder.process[i].segment[j].name);
    }
    finish();
  }
 
}
void _partitionSort(){
  Partition t = new Partition(null, null);
  for(int i=0;i<temp.length;i++){
    for(int j=i+1;j<temp.length;j++){
      if(temp[i].size>temp[j].size){
          t = temp[i];
          temp[i] = temp[j];
          temp[j] = t;
      }
    }
   
  }
  finish();
}
void firstFit(){
  clearAll();
  _prepare();
  _writeTemp();
  for(int i=0;i<segmentTable.length;i++){
   
    for(int j=0;j<segmentTable[i].eachProcess.length;j++){
      for(int h=0;h<temp.length;h++){
     
        if(segmentTable[i].eachProcess[j].limit <= temp[h].size){
          segmentTable[i].eachProcess[j].base = temp[h].start;
          temp.removeAt(h);
          break;
        }
      }

    }
  }
   print(segmentTable.length);
}

void bestFit(){
   clearAll();
  _prepare();
  _writeTemp();
  _partitionSort();
  for(int i=0;i<segmentTable.length;i++){
  
    for(int j=0;j<segmentTable[i].eachProcess.length;j++){
      for(int h=0;h<temp.length;h++){
     
        if(segmentTable[i].eachProcess[j].limit <= temp[h].size){
          segmentTable[i].eachProcess[j].base = temp[h].start;
          temp.removeAt(h);
          break;
        }
      }

    }
  }
   print(segmentTable.length);
}



SegmentTable._internal();
}
