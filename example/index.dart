library bootstrap_angular.demo;

import 'dart:async' show Completer, Future, Future;
import 'dart:html' as dom;
import 'dart:math' show Random;
import 'package:angular/angular.dart';
import 'package:bootstrap_angular/elements.dart';

//import 'package:di/di.dart';
// import 'package:perf_api/perf_api.dart';

import 'src/accordion/demo.dart';
import 'package:markdown/markdown.dart' as markdown;

part 'src/app/bootstrap_module.dart';
part 'src/app/docs.dart';
part 'src/app/head_ctrl.dart';
part 'src/app/main_ctrl.dart';
part 'src/app/package.dart';
part 'src/app/plunker.dart';
//part 'src/app/source_ctrl.dart';
part 'src/app/ba_bind_html_directive.dart';

void main() {
  ngBootstrap(module: new BootstrapDemoApp());
}

class BootstrapDemoApp extends Module {
  BootstrapDemoApp() {
    type(HeadController);
    type(MainController);
    type(AccordionDemoCtrl);
    type(PlunkerCtrl);
    type(BaBindHtmlDirective);

    type(Accordion);
    type(AccordionController);
    type(AccordionHeading);
    type(AccordionTransclude);
    type(Collapse);
    install(new Modal());
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






