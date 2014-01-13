library bootstrap_angular.demo.collapse;

import 'package:angular/angular.dart' as ng;

@ng.NgController(
    selector: '[ng-controller=collapse-demo-ctrl]',
    publishAs: 'ctrl')
class CollapseDemoController {
  CollapseDemoController() {
    print('CollapseDemoController');
  }

  bool isCollapsed = false;
}