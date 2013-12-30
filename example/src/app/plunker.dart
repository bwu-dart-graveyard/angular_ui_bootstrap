part of bootstrap_angular.demo;


// Plunker
// Button click
// 1. Factory
// 2. function(ngVersion
// document
//   List<document>
// content // xxxModuleDemoController (e.g. AccordionDemoController)
//   javascript: function AccordionDemoCtrl($scope
//   markup: "<div ng-controller="AccordionDemoCtrl"...

//class PlunkerCtrl{
//  PlunkerCtrl() {
//    print('PlunkerCtrl');
//  }
//}

@NgController(
    selector: '[plunker-ctrl]',
    publishAs: 'ctrl')
class PlunkerCtrl {
  static final dom.NodeValidator validator = new dom.NodeValidatorBuilder.common();
  List<dom.HtmlDocument> _document; // List<document>
  PlunkerCtrl.value(this._document);
  String ngVersion; // 1.0.8
  String bsVersion; // 2.3.1
  String version; // 0.7.0
  String module; // accordion
  Map content; // // xxxModuleDemoController (e.g. AccordionDemoController)

  dom.FormElement form;

  PlunkerCtrl(this.ngVersion, this.bsVersion, this.version, this.module, this.content) {
    form = new dom.Element.html('<form style="display: none;" method="post" action="http://plnkr.co/edit/?p=preview" target="_blank"></form>') as dom.FormElement;
  }

  void addField(String name, String value) {
    assert(name != null);
    var input = new dom.Element.html('<input type="hidden" name="$name">') as dom.InputElement;
    input.value = value;
    form.append(input);
    addField('description', 'http://angular-ui.github.io/bootstrap/');
    addField('files[index.html]', indexContent(content['markup'], version));
    addField('files[example.js]', scriptContent(content['javascript']));
  }

  String indexContent(String content, String version) {
    return '''
<!doctype html>
<html ng-app="plunker">
  <head>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/${ngVersion}/angular.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-${version}.js"></script>
    <script src="example.js"></script>
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/${bsVersion}/css/bootstrap-combined.min.css" rel="stylesheet">
  </head>
  <body>
    ${content}
  </body>
</html>
;)''';

  }

  String scriptContent(String content) {
    return "angular.module('plunker', ['ui.bootstrap']);\n" + content;
  }
}