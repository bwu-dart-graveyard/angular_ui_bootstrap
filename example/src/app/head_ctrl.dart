part of bootstrap_angular.demo;

@NgController(
    selector: '[ng-controller=head-ctrl]',
    publishAs: 'ctrl'
//    ,map: const {
//      'allModules': '<=allModules'
//    }
    )
class HeadController {
  ModulesList _modules;
  HeadController(this._modules) {
    print('HeadController');
  }
  String someValue = 'HEAD';

  String get allModules => _modules.map((e) => e.name).join(', ');
}