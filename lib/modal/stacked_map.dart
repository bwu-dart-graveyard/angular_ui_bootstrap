part of bootstrap_angular.elements.modal;

/**
 * A helper, internal data structure that acts as a map but also allows getting / removing
 * elements in the LIFO order
 */
class StackedMap {
  List<Map<String,String>> stack = [];

  StackedMap() {

  }

  void add(String key, String value) {
    stack.add({
      'key': key,
      'value': value
    });
  }

  Map<String,String> get(String key) {
    for(int i = 0; i < stack.length; i++) {
      if(key == stack[i]['key']) {
        return stack[i];
      }
    }
  }

  List<String> keys() {
    var keys = [];
    for(int i = 0; i < stack.length; i++) {
      keys.add(stack[i]['key']);
    }
    return keys;
  }

  Map<String,String> top() {
    return stack.last;
  }

  Map<String,String> remove(key) {
    var idx = -1;
    for(var i = 0; i < stack.length; i++) {
      if(key == stack[i]['key']) {
        idx = i;
        break;
      }
    }

    return stack.removeAt(idx);
  }

  Map<String,String> removeTop() {
   return stack[stack.length - 1];
  }

  int length() {
    return stack.length;
  }
}