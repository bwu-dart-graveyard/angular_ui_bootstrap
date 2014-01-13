library bootstrap_angular.elements.accordion;

import 'package:angular/angular.dart' as ng;

part 'accordion_group.dart';


class AccordionModule extends ng.Module {
  AccordionModule() {
    type(AccordionComponent);
    type(AccordionHeadingComponent);
    type(AccordionGroupComponent);
    value(AccordionConfig, new AccordionConfig());
  }
}

class AccordionConfig {
  bool closeOthers = true;
}

@ng.NgComponent(
    selector: 'accordion',
    publishAs: 'ctrl',
    visibility: ng.NgDirective.CHILDREN_VISIBILITY,
    templateUrl: 'packages/bootstrap_angular/accordion/accordion.html',
    cssUrls: const ['assets/css/default_component.css'],
    applyAuthorStyles: true
    //cssUrl: '//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css'
)
class AccordionComponent implements ng.NgAttachAware {
  @ng.NgTwoWay('close-others') bool isCloseOthers;

  final ng.Scope scope;
  final AccordionConfig _config;

  /*
   * This array keeps track of the accordion groups
   */
  List<AccordionGroupComponent> _groups = [];

  AccordionComponent(this.scope, this._config)
  {
    print('AccordionComponent');
  }

  /*
   * Ensure that all the groups in this accordion are closed, unless close-others explicitly says not to
   */
  void closeOthers(AccordionGroupComponent openGroup) {
    isCloseOthers = isCloseOthers != null ? isCloseOthers : _config.closeOthers;
    if(isCloseOthers) {
      _groups.forEach((e) {

        if(e != openGroup && e.isOpen != null && e.isOpen) {
          e.isOpen = false;
        }
      });
    }
  }

  /*
   * This is called from the accordion-group directive to add itself to the accordion
   */
  void addGroup(AccordionGroupComponent groupScope) {
    _groups.add(groupScope);

    groupScope.scope.$on('destroy', (e) => removeGroup(groupScope)); // TODO type annotation e
  }

  /*
   *  This is called from the accordion-group directive when to remove itself
   */
  ng.Scope removeGroup(AccordionGroupComponent groupScope) {
    _groups.remove(groupScope);
  }

  void attach() {
    //print('close-others: $isCloseOthers');
  }
}
