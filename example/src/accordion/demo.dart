library bootstrap_angular.demo.accordion;

//import 'package:angular/angular.dart';

//@NgController(
//    selector: '[recipe-book]',
//    publishAs: 'ctrl')
class AccordionDemoCtrl {
  AccordionDemoCtrl() {
    print('AccordionDemoCtrl');
  }
  
  final bool oneAtATime = true;
  
  final List<Map<String, String>> groups = [
      {
        'title': "Dynamic Group Header - 1",
        'content': "Dynamic Group Body - 1"
      },
      {
        'title': "Dynamic Group Header - 2",
        'content': "Dynamic Group Body - 2"
      }];
  
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  
  void addItem() {
    var newItemNo = items.length + 1;
    items.add('Item ${newItemNo}');
  }
}