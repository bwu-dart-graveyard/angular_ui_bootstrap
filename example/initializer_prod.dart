library angular_ui_bootstrap.demo.app_initializer.prod;

import 'package:angular/angular.dart';
import 'package:di/di.dart';
//import 'package:di/static_injector.dart';

// Generated Files!
//import 'di_factories_gen.dart' as di_factories_gen;
//import 'ng_parser_gen.dart' as ng_parser_gen;

//createInjector(List<Module> modules) {
//  di_factories_gen.main();
//  return new StaticInjector(modules: modules,
//      typeFactories: di_factories_gen.typeFactories);
//}

createParser(Module module) {
  module.type(Parser, implementedBy: StaticParser);
//  module.factory(StaticParserFunctions,
//      (i) => ng_parser_gen.functions(i.get(FilterMap)));
  throw('not implemented'); // comment in commented lines
}