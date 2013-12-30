library bootstrap_angular.elements.modal;

import 'dart:html' as dom;
import 'package:angular/angular.dart' as ng;

part 'modal_backdrop_component.dart';
part 'modal_stack.dart';
part 'modal_window_component.dart';
part 'stacked_map.dart';

class Modal extends ng.Module {
  Modal() {
    type(ModalComponent);
    type(ModalBackdropComponent);
    type(ModalStack);
    type(ModalWindowComponent);
    type(StackedMap);
  }
}


class ModalComponent {

}