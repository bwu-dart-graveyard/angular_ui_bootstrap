part of angular_ui_bootstrap.elements.modal;

@InjectableService()
class ModalStack {
  final dom.HtmlDocument _document;
  final ng.Scope _scope;
  final StackedMap _stackedMap;
  static const String OPENED_MODAL_CLASS = 'modal-open';

  ModalStack(this._document,  $compile, this._scope, this._stackedMap);
      //Injector injector, Scope scope, $q, Http http, BlockCache templateCache, /*Controller controller,*/ StackedMap _stackedMap) {
}

//class ModalStack {
//  void get(dom.HtmlDocument document, ng.Compile compile, ng.Scope scope, StackedMap stackedMap) {
//    rootScope.$root
//  }
//}