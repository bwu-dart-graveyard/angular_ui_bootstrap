library angular_ui_bootstrap.elements.dropdown_toggle;

import 'dart:html' as dom;
import 'dart:async' show StreamSubscription;
import 'package:angular/angular.dart' as ng;

/*
 * dropdownToggle - Provides dropdown menu functionality in place of bootstrap js
 * @restrict class or attribute
 * @example:
   <li class="dropdown">
     <a class="dropdown-toggle">My Dropdown Menu</a>
     <ul class="dropdown-menu">
       <li ng-repeat="choice in dropChoices">
         <a ng-href="{{choice.href}}">{{choice.text}}</a>
       </li>
     </ul>
   </li>
 */
@ng.NgController(
    selector: '[ng-controller=dropdown-ctrl]',
    publishAs: 'ctrl')
class DropdownToggleController {

  dom.Element openElement;
  dom.Element closeElement;

  ng.Scope _scope;
  dom.Element _element;
  ng.NgRoutingHelper _location;

  StreamSubscription documentClickSubscription;

  DropdownToggleController(this._scope, this._element)
  {
    print('DropdownToggleController');
    _scope.$watch(() => dom.window.location, () => closeMenu(null));
    _element.parent.onClick.listen(closeMenu);
    _element.onClick.listen(clickHandler);
  }

  void closeMenu(dom.Event evt) {
    if(evt != null) {
      //evt.preventDefault();
      evt.stopPropagation();
    }

    if(documentClickSubscription != null) {
      documentClickSubscription.cancel();
    }

    _element.parent.classes.remove('open');
    openElement = null;
  }

  void clickHandler(dom.Event evt) {
    bool elementWasOpen = (_element == openElement);
    evt.preventDefault();
    evt.stopPropagation();

    if(openElement != null) {
      closeMenu(null);
    }

    if(!elementWasOpen && !_element.classes.contains('disabled') && !_element.attributes.containsKey('disabled')) {
      _element.parent.classes.add('open');
      openElement = _element;

      documentClickSubscription = dom.document.onClick.listen(closeMenu);
    }
  }
}
