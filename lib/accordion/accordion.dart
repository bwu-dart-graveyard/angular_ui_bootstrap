library bootstrap_angular.elements.accordion;

import 'package:angular/angular.dart' as ng;

part 'accordion_group.dart';


class AccordionModule extends ng.Module {
  AccordionModule() {
    type(AccordionComponent);
    type(AccordionHeading);
    type(AccordionTransclude);
    type(AccordionGroup);
    value(AccordionConfig, new AccordionConfig());
  }
}

class AccordionConfig {
  bool closeOthers = true;
}

@ng.NgComponent(
    selector: 'accordion',
    publishAs: 'ctrl',
    templateUrl: 'packages/bootstrap_angular/accordion/accordion.html')
class AccordionComponent {
  final ng.Scope _scope;
  final ng.NodeAttrs _attrs;
  final AccordionConfig _config;
  List<ng.Scope> _groups = [];

  AccordionComponent(this._scope, this._attrs, this._config) //; // TODO accordionConfig (closeOthers)
  {
    print('AccordionComponent');
  }

  void closeOthers(ng.Scope openGroup) {
    var closeOthers = _attrs['closeOthers'] != null ? _scope.$eval(_attrs['closeOthers']) : _config.closeOthers;

    if(closeOthers) {
      _groups.forEach((e) {
        if(e != openGroup) {
          e['isOpen'] = false;
        }
      });
    }
  }

  void addGroup(ng.Scope groupScope) {
    _groups.add(groupScope);

    groupScope.$on('destroy', (e) => removeGroup(groupScope)); // TODO type annotation e
  }

  ng.Scope removeGroup(ng.Scope groupScope) {
    _groups.remove(groupScope);
  }
}

class AccordionHeading {

}

class AccordionTransclude {

}