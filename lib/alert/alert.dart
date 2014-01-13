library bootstrap_angular.elements.alert;

//import 'dart:html' as dom;
//import 'dart:async';
import 'package:angular/angular.dart' as ng;

@ng.NgComponent(
    selector: 'alert',
    publishAs: 'ctrl',
    visibility: ng.NgDirective.CHILDREN_VISIBILITY,
    templateUrl: 'packages/bootstrap_angular/alert/alert.html',
    cssUrls: const ['assets/css/default_component.css'],
    applyAuthorStyles: true
)
class AlertComponent implements ng.NgAttachAware {

  @ng.NgCallback('close') CloseFunc close;
  @ng.NgTwoWay('type') String type;
  bool closeable;
  ng.Scope _scope;

  AlertComponent(this._scope)
  {
    print('AlertComponent');
  }

  void attach() {
    _scope.$watch(() => close, (e) => closeable == (close != null), "closeable");
  }

  String ngClass() {
    return "alert-" + (type != null ? type : "warning");
  }
}

typedef CloseFunc(int);