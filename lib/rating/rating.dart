library bootstrap_angular.elements.rating;

import 'package:angular/angular.dart' as ng;

class RatingModule extends ng.Module {
  RatingModule() {
    type(RatingComponent);
    value(RatingConfig, new RatingConfig());
  }
}

class RatingConfig {
  int max = 5;
  String stateOn = null;
  String stateOff = null;
}

@ng.NgComponent(
    selector: 'rating',
    publishAs: 'ctrl',
    //templateUrl: 'packages/bootstrap_angular/rating/rating.html',
    template: r'''
<span ng-mouseleave="ctrl.reset()">
  <i ng-repeat="r in ctrl.range" ng-mouseenter="ctrl.enter($index + 1)" ng-click="ctrl.rate($index + 1)" class="glyphicon" ng-class="ctrl.stateClass($index, r)"></i>
</span>
''',
    applyAuthorStyles: true
)
class RatingComponent implements ng.NgAttachAware {
  //final ng.Scope _scope;
  //final ng.NodeAttrs _attrs;
  final RatingConfig _config;

  @ng.NgOneWay('max') int max;
  @ng.NgTwoWay('value') int value = 0;
  @ng.NgTwoWay('readonly') bool isReadonly = false;
  @ng.NgCallback('on-hover') var onHover;
  @ng.NgCallback('on-leave') var onLeave;
  @ng.NgTwoWay('rating-states') List<Map<String,String>> ratingStates;
  @ng.NgTwoWay('state-on') String stateOn;
  @ng.NgTwoWay('state-off') String stateOff;

  int val = 0;
  List<Map> range;

  //ng.Injector _injector;
  //dom.Element _element;

  RatingComponent(/*this._scope, this._attrs, */ this._config /*, this._element*/) {
    //print('RatingComponent');
  }

  List<Map<String,String>> createRateObjects(List<Map<String,String>> states) {
    Map<String,String> defaultOptions =
      {
        'stateOn': this.stateOn,
        'stateOff': this.stateOff
      };

    if(states != null) {
      for (int i = 0, n = states.length; i < n; i++) {
        while(states.length <= i) {
          states.add({});
        }
        states[i] = extend({ 'index': i }, [states[i], defaultOptions]);
      }
    }
    return states;
  }

  void rate (int value) {
    if(this.value != value && !isReadonly) {
      this.value = value;
    }
  }

  void enter(int value) {
    if(!isReadonly) {
      this.val = value;
    }
    onHover({'value': value});
  }

  void reset() {
    val = value;
    onLeave();
  }

  String stateClass(int index, Map r) {
    String c;
    if(index < val) {
      c = (r['stateOn'] != null) ? r['stateOn'] : 'glyphicon-star';
    } else {
      c = (r['stateOff'] != null) ? r['stateOff'] : 'glyphicon-star-empty';
    }
    return c;
  }

  void attach() {
    int maxRange = max != null ? max : _config.max;
    stateOn = stateOn != null ? stateOn : _config.stateOn;
    stateOff = stateOff != null ? stateOff : _config.stateOff;

    range = ratingStates != null ?
        createRateObjects(copy(ratingStates)) :
          this.createRateObjects(new List(maxRange));
    reset();
  }

  static Map extend(Map dst, List<Map> src) {
    var tmpSrc = new List<Map>.from(src);

    while(tmpSrc.length > 0) {
      //print('tmpSrc: $tmpSrc');
      if(tmpSrc[0] != null) {
        tmpSrc[0].forEach((k, v) {
          if(v != null)
          dst[k] = copy(v);
        });
      }
      tmpSrc.removeAt(0);
      //extend(dst, tmpSrc);
    }
    return dst;
  }

  static dynamic copy(source, [destination]) {
    var dst;
    //print('source: $source; <=>destination: $destination');
    if(destination != null) {
      if(source is List) {
        dst = new List();
        source.forEach((e) => dst.add(copy(e, dst)));
      } else if(source is Map) {
        dst = new Map();
        source.forEach((k, v) => dst[k] = copy(v));
      } else {
        return source;
      }
    } else {
      if(source is List) {
        dst = [];
        source.forEach((e) => dst.add(copy(e, dst)));
      } else if(source is Map) {
        dst = {};

        source.forEach((k, v) => dst[k] = copy(v));
      } else {
        return source;
      }
    }
    return dst;
  }
}