part of angular_ui_bootstrap.demo;

@ng.NgController(
    selector: '[ng-controller=head-ctrl]',
    publishAs: 'ctrl'
)
class HeadController {
  ModulesList _modules;
  HeadController(this._modules) {
    print('HeadController');
  }
  String someValue = 'HEAD';

  String get allModules => _modules.map((e) => e.name).join(', ');
}