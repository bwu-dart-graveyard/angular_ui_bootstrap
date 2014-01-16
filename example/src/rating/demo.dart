library angular_ui_bootstrap.demo.rating;

import 'package:angular/angular.dart' as ng;


@ng.NgController(
    selector: '[ng-controller=rating-demo-ctrl]',
    publishAs: 'ctrl'
)
class RatingDemoController {
  ng.Scope _scope;

  int rate = 7;
  int max = 10;
  bool isReadonly = false;
  int overStar;
  double percent = 100.0;
  List<Map<String,String>> ratingStates = [
                                           {'stateOn': 'glyphicon-ok-sign', 'stateOff': 'glyphicon-ok-circle'},
                                           {'stateOn': 'glyphicon-star', 'stateOff': 'glyphicon-star-empty'},
                                           {'stateOn': 'glyphicon-heart', 'stateOff': 'glyphicon-ban-circle'},
                                           {'stateOn': 'glyphicon-heart'},
                                           {'stateOff': 'glyphicon-off'}
                                           ];

  RatingDemoController(this._scope) {
    print('RatingDemoController');
  }

  void hoveringOver(int value) {
    if(value == null || value == 0.0) {
      percent = 0.0;
    } else {
      overStar = value;
      percent = 100 * (value / max);
    }
  }
}