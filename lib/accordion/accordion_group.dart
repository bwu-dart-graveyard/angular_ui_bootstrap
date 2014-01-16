part of angular_ui_bootstrap.elements.accordion;

@ng.NgComponent(
    selector: 'accordion-group',
    publishAs: 'ctrl',
    visibility: ng.NgDirective.CHILDREN_VISIBILITY,
    templateUrl: 'packages/angular_ui_bootstrap/accordion/accordion_group.html',
    cssUrls: const ['assets/css/default_component.css'],
    applyAuthorStyles: true
)
class AccordionGroupComponent {
  @ng.NgTwoWay('is-open') bool isOpen = false;
  @ng.NgAttr('heading') String heading;
  ng.Scope scope;

  AccordionGroupComponent(this.scope, AccordionComponent accordion) {

    print('AccordionGroupComponent');
    accordion.addGroup(this);

    scope.$watch(() => isOpen, (value) {
      //print('watch: $value');

      if(value != null && value == true) {
        accordion.closeOthers(this);
      }
    });
  }
}

/*
 * Use accordion-heading below an accordion-group to provide a heading containing HTML
 * <accordion-group>
 *   <accordion-heading>Heading containing HTML - <img src="..."></accordion-heading>
 * </accordion-group>
 */
@ng.NgComponent(
    selector: 'accordion-heading',
    publishAs: 'ctrl',
    template: '<content></content>',
    cssUrls: const ['assets/css/default_component.css'],
    applyAuthorStyles: true
)
class AccordionHeadingComponent {
  ng.Scope _scope;
  AccordionHeadingComponent(this._scope, AccordionGroupComponent accordionGroup) {
    print('AccordionHeadingComponent');
  }
}
