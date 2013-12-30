//part of bootstrap_angular.demo;
//
//@NgDirective(
//  selector: '[ng-bind-html-source]',
//  map: const {'ngBindHtml': '=>value'})
//class NgBindHtmlSourceDirective {
//  // The default HTML sanitizer.  Eventually, we'll make this configurable or
//  // use an optionally loaded `$sanitize` service.
//  static final dom.NodeValidator validator = new dom.NodeValidatorBuilder.common();
//
//  dom.Element element;
//
//  NgBindHtmlSourceDirective(dom.Element this.element) {
//  //  validator.allowCustomElement(tagName)
//    ///  .allowCustomElement('accordion');
//  }
//
//  /**
//   * Parsed expression from the `ng-bind-html` attribute.  The result of this
//   * expression is innerHTML'd according to the rules specified in this class'
//   * documention.
//   */
//  set value(value) => element.setInnerHtml((value == null ? '' : value.toString()),
//                                           validator: validator) ;
//}