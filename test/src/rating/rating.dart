library bootstrap_angular.test.elements.rating;

import 'dart:html' as dom;
import 'dart:async';
import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';
import 'package:angular/angular.dart' as ng;
import 'package:angular/mock/module.dart' as ngMock;

import 'package:bootstrap_angular/rating/rating.dart';


void main() {
  useHtmlEnhancedConfiguration();

  ng.Scope _rootScope;
  dom.Element _element;
  ngMock.TestBed _tb;
  ngMock.MockHttpBackend _backend;

  setUp(() {
    Future f;
    try {
    ngMock.setUpInjector();

      ngMock.module((ng.Module module) {
        module.install(new RatingModule());
      });

      ngMock.inject((ng.Scope scope, ngMock.TestBed testBed) {
        _rootScope = scope;
        //_rootScope['rate'] = 3;
        _tb = testBed;
        _element = _tb.compile('<rating value="rate"></rating>', scope: _rootScope);
        _tb.rootScope['rate'] = 3;
        _tb.rootScope.$apply();
        _tb.rootScope.$digest();

        //f = dom.HttpRequest.getString('/bootstrap_angular/packages/bootstrap_angular/rating/rating.html')
        //.then((ratingTemplate) {
        //  _backend = new ngMock.MockHttpBackend();

         // assert(ratingTemplate.contains('<i '));
         // _backend.expect('GET').respond(ratingTemplate);


          print(_element);
          //_rootScope.$digest();
        //}).catchError((e) => print(e));
      });
    } catch(e) {
      print(e);
    }
    return f;
  });

  List<dom.Element> getStars() {
    print(_element);
    return _element.shadowRoot.querySelectorAll('i');
  }

  test("rating component", ( ) {
    var done = expectAsync0((){});
    new Timer(new Duration(milliseconds: 2000), () {

      expect(getStars().length, equals(3));
      done();
    });
  });
}