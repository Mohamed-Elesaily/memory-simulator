import 'package:memory_simulator/algorithm/segmentTable/element.dart';

class ElementTable{
  String proceesName;
  ElementTable(this.proceesName);
  List<Element> eachProcess=new List<Element>(); 
  void addElement(String name,int base,int limit){
    eachProcess.add(new Element.add(base, limit,name));
  }

}