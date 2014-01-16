part of angular_ui_bootstrap.demo;

@ng.NgController(
    selector: '[ng-controller=plunker-ctrl]',
    publishAs: 'ctrl')
class PlunkerController {
  String pkgVersion = 'pkgVersion'; // TODO dynamically add versions
  String ngVersion = 'dart'; // '1.0.8';
  String bsVersion = '3.0.3';
  String version = '0.0.1';
//  String module; // accordion

  ng.Scope _scope;
  PlunkerController(this._scope) {
    print('PlunkerController');
  }
  Map content; // TODO

  void edit(String ngVersion, String bsVersion, String version, String module) {
    print('PlunkerController.edit()');
    PlunkGenerator.generate(ngVersion, bsVersion, version, module, content);
  }
}


class PlunkGenerator {
  //static final dom.NodeValidator validator = new dom.NodeValidatorBuilder.common();
  //List<dom.HtmlDocument> _document; // List<document>
  //PlunkGenerator.value(this._document); // TODO
//  String pkgVersion = 'pkgVersion'; // TODO dynamically add versions
//  String ngVersion; // = '1.0.8';
//  String bsVersion; // = '3.0.3';
//  String version; // = '0.7.0';
//  String module; // accordion
//  Map content;  // xxxModuleDemoController (e.g. AccordionDemoController)

  //dom.FormElement form;

  static void generate(String ngVersion, String bsVersion, String version, String module, Map content) {
    dom.FormElement form = new dom.Element.html('<form style="display: none;" method="post" action="http://plnkr.co/edit/?p=preview" target="_blank"></form>') as dom.FormElement;
    addField(form, 'description', 'http://bwu-dart.github.io/angular_ui_bootstrap/');
    addField(form, 'files[index.html]', indexContent(ngVersion, bsVersion, version, content['markup']));
    addField(form, 'files[example.js]', scriptContent(content['javascript']));
    dom.document.body.append(form);
    form.submit();
    form.remove();
  }

  static void addField(dom.FormElement form, String name, String value) {
    assert(name != null);
    var input = new dom.Element.html('<input type="hidden" name="$name">') as dom.InputElement;
    input.value = value;
    form.append(input);
  }

  static String indexContent(String ngVersion, String bsVersion, String version, String content) {
    return '''
<!doctype html>
<html ng-app="plunker">
  <head>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/${ngVersion}/angular.js"></script>
    <script src="http://bwu-dart.github.io/angular_ui_bootstrap/ui-bootstrap-tpls-${version}.js"></script> <!-- TODO -->
    <script src="example.js"></script>
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/${bsVersion}/css/bootstrap-combined.min.css" rel="stylesheet">
  </head>
  <body>
    ${content}
  </body>
</html>
;)''';
  }

  static String scriptContent(String content) {
    return "angular.module('plunker', ['ui.bootstrap']);\n" + content;
  }
}

@ng.NgDirective(
    selector: '[plunker-content]',
    publishAs: 'content-ctrl')
class PlunkerContentDirective {
  ng.Scope _scope;
  dom.Element _element;
  ng.NodeAttrs _attrs;

  PlunkerContentDirective(this._scope, this._element, this._attrs) {
    print('PlunkerContentDirective');
    _scope.content = {};
    _scope.content[_attrs['plunkerContent']] = _element.text.trim();
  }
}