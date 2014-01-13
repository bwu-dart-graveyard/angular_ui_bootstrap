part of bootstrap_angular.elements;

/**
 * $transition service provides a consistent interface to trigger CSS 3 transitions and to be informed when they complete.
 * @param  {DOMElement} element  The DOMElement that will be animated.
 * @param  {string|object|function} trigger  The thing that will cause the transition to start:
 *   - As a string, it represents the css class to be added to the element.
 *   - As an object, it represents a hash of style attributes to be applied to the element.
 *   - As a function, it represents a function to be called that will cause the transition to occur.
 * @return {Promise}  A promise that is resolved when the transition finishes.
 */
class Transition implements Function {
  //var q;
  //@ng.NgAttr('timeout') var timeout;
  var rootScope;
  //var transition;
  Completer _completer;
  StreamSubscription transitionEndEventSubscription = null;
  dom.Element _element;
  var _trigger;
  Map _options;
  String _endEventName;

  Transition();

  void transitionEndHandler(event) {
    //print('transitionEndHandler');

    if(transitionEndEventSubscription != null) {
      transitionEndEventSubscription.cancel();
    }
    if(!_completer.isCompleted) {
      _completer.complete(_element);
    }

  }

  Future<dom.Element> call(dom.Element element, trigger, [Map options = const {}]){
    //print('Transition.call(${element.localName}, $trigger, $options');

    _completer = new Completer();
    this._element = element;
    this._trigger = trigger;
    this._options = options;

    _endEventName = _options.containsKey('animation') ? "animationEndEventName" : "transitionEndEventName";

    if (_endEventName != null) {
      //print('add transitionEndHandler');
      transitionEndEventSubscription = _element.onTransitionEnd.listen(transitionEndHandler);
    }

    // Wrap in a timeout to allow the browser time to update the DOM before the transition is to occur
    Timer.run(() {
      if ( _trigger is String ) {
        _element.classes.add(_trigger);
      } else if (_trigger is Function ) {
        _trigger(_element);
      } else if (_trigger is Map) {
        //print('trigger is map');
        _trigger.forEach((k, v) => _element.style.setProperty(k, v.toString()));
      }
      //If browser does not support transitions, instantly resolve
      if (_endEventName == null) {
        //print('completed');
        //deferred.resolve(element);
        _completer.complete(_element);
      }
    });

    // timeout
//    new Timer(new Duration(milliseconds: 2000), () {
//      if(!_completer.isCompleted) {
//        cancel();
//      }
//    });

    return _completer.future;
  }

  // Add our custom cancel function to the promise that is returned
  // We can call this if we are about to run a new transition, which we know will prevent this transition from ending,
  // i.e. it will therefore never raise a transitionEnd event for that transition
  // deferred.promise.cancel = ()*/ () {
  void cancel() {
    if (_endEventName != null ) {
      if(transitionEndEventSubscription != null) {
        transitionEndEventSubscription.cancel();
      }
    }
    if(!_completer.isCompleted) {
      //deferred.reject('Transition cancelled');
      //print('cancel completer');
      _completer.completeError('Transition cancelled');
    }
  }
}

