/**
 * @ngdoc overview
 * @name ui.bootstrap.tabs
 *
 * @description
 * AngularJS version of the tabs directive.
 */
library bootstrap_angular.elements.tabs;

import 'package:angular/angular.dart' as ng;



class TabsModule extends ng.Module {
  TabsModule() {
//    type(AccordionGroupComponent);
//    value(AccordionConfig, new AccordionConfig());
  }
}


@ng.NgComponent(
    selector: 'tabset',
    publishAs: 'ctrl',
    //visibility: ng.NgDirective.CHILDREN_VISIBILITY,
    templateUrl: 'packages/bootstrap_angular/tabs/tabset.html',
    cssUrls: const ['assets/css/default_component.css'],
    applyAuthorStyles: true
    //cssUrl: '//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css'
)
class TabsetComponent /*implements ng.NgAttachAware */ {
  //@ng.NgTwoWay('close-others') bool isCloseOthers;

  //final ng.Scope scope;
  //final AccordionConfig _config;

  TabsetComponent() {
    print('TabsetComponent');
  }
}
