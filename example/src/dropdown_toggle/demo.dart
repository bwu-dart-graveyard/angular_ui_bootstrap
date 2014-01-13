library bootstrap_angular.demo.dropdown_toggle;

import 'package:angular/angular.dart' as ng;

@ng.NgController(
    selector: '[ng-controller=dropdown-toggle-demo-ctrl]',
    publishAs: 'ctrl')
class DropdownToggleDemoController {
  List<String> items = [
                        "The first choice!",
                        "And another choice for you.",
                        "but wait! A third!"
                        ];
  DropdownToggleController() {
    print('DropdownToggleDemoController');
  }
}