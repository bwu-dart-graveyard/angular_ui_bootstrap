library angular_ui_bootstrap.demo.tabs;

import 'dart:async' show Timer;
import 'dart:html' as dom;
//import 'package:observe/observe.dart' show reflectable;
import 'package:angular/angular.dart' as ng;


@ng.NgController(
    selector: '[ng-controller=tabs-demo-ctrl]',
    publishAs: 'ctrl')
class TabsDemoController {

  List<Map<String,String>> tabs = [
    { 'title': "Dynamic Title 1", 'content': "Dynamic content 1" },
    { 'title': "Dynamic Title 2", 'content': "Dynamic content 2", 'disabled': true }
  ];

  TabsDemoController() {
    print('TabsDemoController');
  }

  void alertMe () {
    Timer.run(() {
      dom.window.alert("You've selected the alert tab!");
    });
  }
}