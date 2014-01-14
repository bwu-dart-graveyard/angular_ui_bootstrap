library bootstrap_angular.demo;

import 'dart:async' show Completer, Future, Future;
import 'dart:html' as dom;
import 'dart:math' show Random;
import 'package:angular/angular.dart' as ng;
import 'package:markdown/markdown.dart' as markdown;

import 'package:bootstrap_angular/elements.dart';

//import 'package:di/di.dart';
// import 'package:perf_api/perf_api.dart';

import 'src/accordion/demo.dart';
import 'src/alert/demo.dart';
import 'src/collapse/demo.dart';
import 'src/dropdown_toggle/demo.dart';
import 'src/modal/demo.dart';
import 'src/rating/demo.dart';
import 'src/tabs/demo.dart';


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


    //factory(Plunker, (_) => new Plunker().value());
    String someValue='BootstrapDemoApp';
//    type(RatingComponent);
//    type(Profiler, implementedBy: Profiler); // comment out to enable profiling ???
    String allModules = 'BootstrapDemoApp';
  }
}






