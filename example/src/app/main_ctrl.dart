part of bootstrap_angular.demo;

@ng.NgController(
    selector: '[ng-controller=main-ctrl]',
    publishAs: 'ctrl')
class MainController {
  ng.Scope _scope;
  final ng.Http _http;
  final dom.HtmlDocument _document;
  final ModalComponent _modal;
  final ng.OrderByFilter _orderByFilter;
  var _url = "http://50.116.42.77:3001";
  final ModulesList _modules;
  final Package _package;
  bool isCollapsed = true; // TODO why did the page throw an exception if this property is missing.

  MainController(this._scope, this._http, this._document, this._modal, this._orderByFilter,
      this._modules, this._package) {
    print('MainController');
  }

  String get allModules => _modules.map((e) => e.name).join(', ');

  Package get package => _package;

  //String someValue = 'BODY';

  List<BootstrapModule> get modules => _modules;

//  double i = 5.0;
  final String ngVersion = '0.9.1';
  final String bsVersion = '2.3.1';
  final String pkgVersion = '0.0.1';
  final String favVersion = '3.2.1';

  void showBuildModal() {
    //var modalInstance =
  }
}