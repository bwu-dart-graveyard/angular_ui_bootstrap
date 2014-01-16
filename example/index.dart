library angular_ui_bootstrap.demo;

import 'dart:async' show Completer, Future, Future;
import 'dart:html' as dom;
import 'dart:math' show Random;
import 'package:angular/angular.dart' as ng;
import 'package:markdown/markdown.dart' as markdown;

import 'package:angular_ui_bootstrap/elements.dart';
import 'package:angular_ui_bootstrap/injectable_service.dart';

//import 'package:di/di.dart';
// import 'package:perf_api/perf_api.dart';

import 'src/accordion/demo.dart';
import 'src/alert/demo.dart';
import 'src/collapse/demo.dart';
import 'src/dropdown_toggle/demo.dart';
import 'src/modal/demo.dart';
import 'src/rating/demo.dart';
import 'src/tabs/demo.dart';

// During development it's easier to use dynamic parser and injector, so use
// initializer-dev.dart instead. Before using initializer-prod.dart make sure
// you run: dart -c bin/generator.dart
//import 'initializer_prod.dart' as init; // Use in prod/test.
//import 'initializer_dev.dart' as init; // Use in dev.

// Used by dart2js to indicate which targets are being reflected on, to allow
// tree-shaking.
@MirrorsUsed(
    targets: const [
        'angular',
        'angular.core',
        'angular.core.dom',
        'angular.core.parser',
        'angular.core.parser.dynamic_parser',
        'angular.routing',
        dom.NodeTreeSanitizer,
        'angular.filter',
        'angular.perf',
        'perf_api',
        'angular.directive',
        'angular_ui_bootstrap.demo',
        'angular_ui_bootstrap.demo.accordion',
        'angular_ui_bootstrap.demo.alert',
        'angular_ui_bootstrap.demo.collapse',
        'angular_ui_bootstrap.demo.dropdown_toggle',
        'angular_ui_bootstrap.demo.modal',
        'angular_ui_bootstrap.demo.rating',
        'angular_ui_bootstrap.demo.tabs',
        'angular_ui_bootstrap.demo.app_initializer.prod',
        'angular_ui_bootstrap.demo.app_initializer.dev'
    ],
    metaTargets: const [
        ng.NgInjectableService,
        ng.NgComponent,
        ng.NgDirective,
        ng.NgController,
        ng.NgFilter,
        ng.NgAttr,
        ng.NgOneWay,
        ng.NgOneWayOneTime,
        ng.NgTwoWay,
        ng.NgCallback,
        InjectableService
    ],
    override: '*'
)
import 'dart:mirrors';

part 'src/app/bootstrap_module.dart';
part 'src/app/docs.dart';
part 'src/app/head_ctrl.dart';
part 'src/app/main_ctrl.dart';
part 'src/app/package.dart';
part 'src/app/plunker.dart';
//part 'src/app/source_ctrl.dart';
part 'src/app/ba_bind_html_directive.dart';

void main() {
  ng.ngBootstrap(module: new BootstrapDemoApp());
}

class BootstrapDemoApp extends ng.Module {
  BootstrapDemoApp() {
    type(BaBindHtmlDirective);
    type(HeadController);
    type(MainController);
    type(AccordionDemoController);
    type(AlertDemoController);
    type(CollapseDemoController);
    type(DropdownToggleDemoController);
    type(PlunkerController);
    type(PlunkerContentDirective);
    type(ModalDemoController);
    type(RatingDemoController);
    type(TabsDemoController);

    install(new AccordionModule());
    type(AlertComponent);
    type(CollapseDirective);
    type(DropdownToggleController);
    install(new ModalModule());
    install(new RatingModule());
    install(new TabsModule());
    type(Transition);
    //factory(new ModalFactory(), )

    value(ModulesList, new ModulesList());
    value(Package, new Package());
    value(dom.HtmlDocument, dom.document);

    //init.createParser(this);

    //factory(Plunker, (_) => new Plunker().value());
    String someValue='BootstrapDemoApp';
//    type(RatingComponent);
//    type(Profiler, implementedBy: Profiler); // comment out to enable profiling ???
    String allModules = 'BootstrapDemoApp';
  }
}






