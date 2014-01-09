part of bootstrap_angular.elements;

/**
 * The collapsible directive indicates a block of html that will expand and collapse
 */
@ng.NgDirective(
    selector: 'collapse',
    publishAs: 'collapse',
    map: const {
      'transition' : '<=>transistion',
      'timeout' : '@timeout'
    }
)
class Collapse {
  var initialAnimSkip = true;
  var currentTransition = null;
  final HtmlElement _element;
  final Map<String, String> _attrs;
  var transition;
  var newTransition;
  final ng.Scope _scope;

  Collapse(this._element, this._attrs, this._scope) {
    _scope.$watch(_attrs['collapse'], (bool shouldCollapse) {
      if (shouldCollapse) {
        collapse();
      } else {
        expand();
      }
    });
  }

  Function doTransition(Map change) {
    newTransition = transition(_element, change);
    if (currentTransition) {
      currentTransition.cancel();
    }
    currentTransition = newTransition;
    newTransition.then(_newTransitionDone, _newTransitionDone);
    return newTransition;
  }

  _newTransitionDone () {
    // Make sure it's this transition, otherwise, leave it alone.
    if (currentTransition == newTransition) {
      currentTransition = null;
    }
  }


  void expand() {
    if (initialAnimSkip) {
      initialAnimSkip = false;
      expandDone();
    } else {
      _element
        ..classes.remove('collapse')
        ..classes.add('collapsing');
      doTransition({ 'height': '${_element.children[0].scrollHeight}px' }).then(expandDone);
    }
  }

  void expandDone() {
    _element
    ..classes.remove('collapsing')
    ..classes.add('collapse in')
    ..style.height = 'auto';
  }

  void collapse() {
    if (initialAnimSkip) {
      initialAnimSkip = false;
      collapseDone();
      _element.style.height = 0;
    } else {
      // CSS transitions don't work with height: auto, so we have to manually change the height to a specific value
      _element.style.height = '${_element.children[0].scrollHeight}px';
      //trigger reflow so a browser relaizes that height was updated from auto to a specific value
      var x = _element.children[0].offsetWidth;

      _element.classes
        ..remove('collapse in')
        ..add('collapsing');

      doTransition({ 'height': 0 }).then(collapseDone);
    }
  }

  collapseDone() {
    _element.classes
      ..remove('collapsing')
      ..add('collapse');
  }
}