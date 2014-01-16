library angular_ui_bootstrap.elements.modal;

import 'dart:html' as dom;
import 'package:angular/angular.dart' as ng;
import 'package:angular_ui_bootstrap/injectable_service.dart';

part 'modal_backdrop_component.dart';
part 'modal_stack.dart';
part 'modal_window_component.dart';
part 'stacked_map.dart';

class ModalModule extends ng.Module {
  ModalModule() {
    type(ModalComponent);
    type(ModalBackdropComponent);
    type(ModalStack);
    type(ModalWindowComponent);
    type(StackedMap);
  }
}


@ng.NgComponent(
    selector: 'modal-xxx',
    publishAs: 'ctrl',
    templateUrl: 'packages/angular_ui_bootstrap/modal/modal.html')
class ModalComponent {

  ModalComponent() {
    print(ModalComponent);
  }
}