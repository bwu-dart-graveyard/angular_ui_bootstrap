library angular_ui_bootstrap.elements.collapse;

import 'dart:html' as dom;
import 'dart:async';
import 'package:angular/angular.dart' as ng;
import 'package:angular_ui_bootstrap/transition/transition.dart';

/**
 * The collapsible directive indicates a block of html that will expand and collapse
 */
@ng.NgDirective(
    selector: '[collapse]',
    publishAs: 'collapse'
)
class CollapseDirective implements ng.NgAttachAware{
  var _initialAnimSkip = true;
  Transition _currentTransition = null;
  final dom.Element _element;
  final ng.NodeAttrs _attrs;
  Transition _transition;
  //@ng.NgTwoWay('timeout') var timeout;
  Transition _newTransition;
  final ng.Scope _scope;
  ng.Injector _injector;

  CollapseDirective(this._injector, this._element, this._attrs, this._scope, this._transition) {
    print('CollapseDirective ${_element.localName}');
  }

  Future doTransition(Map change) {
    //print('doTransition, $change');
    _newTransition = new Transition(); //_injector.get(Transition);
    //newTransition = _transition(_element, change);
    if (_currentTransition != null) {
      _currentTransition.cancel();
    }
    _currentTransition = _newTransition;
    return _newTransition(_element, change).then((dom.Element element) {
      // print('newTransition');
      // Make sure it's this transition, otherwise, leave it alone.
      if (_currentTransition == _newTransition) {
        _currentTransition = null;
      }

      return element;
    });
  }

  void expand() {
    // print('expand');
    if (_initialAnimSkip) {
      _initialAnimSkip = false;
      expandDone();
    } else {
      _element
        ..classes.remove('collapse')
        ..classes.add('collapsing');
      //print('expand: ${_element.children[0].scrollHeight}px');
      doTransition({ 'height': '${_element.children[0].scrollHeight}px' }).then((element) => expandDone(), onError: (e) => expandDone());
    }
  }

  void expandDone() {
    // print('expandDone');
    _element
    ..classes.remove('collapsing')
    ..classes.add('in')
    ..classes.add('collapse')
    ..style.height = 'auto';
  }

  void collapse() {
    if (_initialAnimSkip) {
      _initialAnimSkip = false;
      collapseDone();
      _element.style.height = "0";
    } else {
      // CSS transitions don't work with height: auto, so we have to manually change the height to a specific value
      _element.style.height = '${_element.children[0].scrollHeight}px';
      //trigger reflow so a browser realizes that height was updated from auto to a specific value
      var x = _element.children[0].offsetWidth;
      //print('collapse');
      _element.classes
        ..remove('collapse')
        ..remove('in')
        ..add('collapsing');

      doTransition({ 'height': 0 }).then((element) => collapseDone(), onError: (e) => collapseDone());
    }
  }

  collapseDone() {
    // print('collapseDone');
    _element.classes
      ..remove('collapsing')
      ..add('collapse');
  }

  void attach() {
    _scope.$watch(_attrs['collapse'], (bool shouldCollapse) {
      if (shouldCollapse) {
        collapse();
      } else {
        expand();
      }
    });
  }
}