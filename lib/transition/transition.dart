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
@NgDirective(
    selector: 'transition',
    publishAs: 'transition'
//    map: const {
//      'transition' : '<=>transistion',
//      'timeout' : '@timeout'
//    }
)
//@NgInjectableService()
class Transition implements Function {
  var q;
  var timeout;
  var rootScope;
  var transition;
  var deferred;
  StreamSubscription transitionEndEventSubscription = null;
  
  Transition(this.q, this.timeout, this.rootScope) {
    deferred = q.defer();
  }
  
  void transitionEndHandler(event) {
    rootScope.apply(() {
      if(transitionEndEventSubscription != null) {
        transitionEndEventSubscription.cancel();
      }
      // TODO deferred.resolve(element);
    });      
  }
  
  void call(HtmlElement element, trigger, [Map options = const {}]){
    
    
    var endEventName = transition[options['animation'] ? "animationEndEventName" : "transitionEndEventName"];
  
    if (endEventName) {
      element.onTransitionEnd.listen(transitionEndHandler);
    }
  
    // Wrap in a timeout to allow the browser time to update the DOM before the transition is to occur
    timeout(() {
      if ( trigger is String ) {
        element.classes.add(trigger);
      } else if ( trigger is Function ) {
        trigger(element);
      } else if ( trigger is Map) { 
        trigger.forEach((k, v) => element.style.setProperty('k', v));
      }
      //If browser does not support transitions, instantly resolve
      if ( !endEventName ) {
        deferred.resolve(element);
      }
    });
  
    // Add our custom cancel function to the promise that is returned
    // We can call this if we are about to run a new transition, which we know will prevent this transition from ending,
    // i.e. it will therefore never raise a transitionEnd event for that transition
    deferred.promise.cancel = () {
      if ( endEventName ) {
        if(transitionEndEventSubscription != null) {
          transitionEndEventSubscription.cancel();
        }
      }
      deferred.reject('Transition cancelled');
    };
  
    return deferred.promise;
  }
}

