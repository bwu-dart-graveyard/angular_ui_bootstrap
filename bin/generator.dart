library chapter07.generator;

import 'dart:io';
import 'package:di/generator.dart' as di_generator;
import 'package:angular/tools/expression_extractor.dart' as ng_generator;

main() {
  //var dartSdkPath = Platform.environment['DART_SDK'];
  var dartSdkPath = '/home/zoechi/source/3rdparty/google/darteditor/dart-sdk';
  if (dartSdkPath == null || dartSdkPath.isEmpty) {
    throw 'export DART_SDK=/path/to/dart/sdk';
  }
  var entryPointDartFile = 'example/index.dart';
  var injectablesAnnotations =
      'angular.core.NgComponent,'
      'angular.core.NgController,'
      'angular.core.NgDirective,'
      'angular.core.NgFilter,'
      'injectable.InjectableService,'
      'angular.core.service.NgInjectableService,'
      'angular_ui_bootstrap.injectable_service';
  var diOutputFile = 'example/di_factories_gen.dart';
  var packageRoots = 'packages';

  _runDiGenerator(dartSdkPath, entryPointDartFile, injectablesAnnotations,
      diOutputFile, packageRoots);

  var htmlRoot = '.';
  var parserOutputFile = 'example/ng_parser_gen.dart';
  var parserHeaderFile = 'lib/parser_gen_header.dart';
  var parserFooterFile = ''; // we don't need anything in the footer, for now.

  _runNgGenerator(entryPointDartFile, htmlRoot, parserHeaderFile,
      parserFooterFile, parserOutputFile, packageRoots);
}

_runDiGenerator(dartSdkPath, entryPointDartFile, injectablesAnnotations,
                outputFile, packageRoots) {
  di_generator.main([
      dartSdkPath,
      entryPointDartFile,
      injectablesAnnotations,
      outputFile,
      packageRoots
  ]);
}

_runNgGenerator(entryPointDartFile, htmlRoot, parserHeaderFile,
                parserFooterFile, parserOutputFile, packageRoots) {
  // create empty output file to start with
  new File(parserOutputFile).createSync();

  ng_generator.main([
      entryPointDartFile,
      htmlRoot,
      parserHeaderFile,
      parserFooterFile,
      parserOutputFile,
      packageRoots
  ]);
}