part of bootstrap_angular.demo;

class BootstrapModule {
  final String name;
  String _displayName;
  Docs docs;

  BootstrapModule(this.name, [String displayName]) {
    String html;
    this._displayName = displayName;
    readSource().then((Docs d) => docs = d);
  }

  String get displayName => _displayName != null ? _displayName : name;

  Future<Docs> readSource() {
    var completer = new Completer<Docs>();

    Future.wait([
      dom.HttpRequest.getString('src/${this.name}/demo.html').then((e) => e, onError: (e) => ''),
      dom.HttpRequest.getString('src/${this.name}/readme.md').then((e) => e, onError: (e) => ''),
      dom.HttpRequest.getString('src/${this.name}/demo.dart').then((e) => e, onError: (e) => '')
    ]).then((List<String> results) {
      String html = results[0];
      String md = results[1];
      String dart = results[2];

      completer.complete(new Docs(html: html, md: 'md: ' + md, dart: 'dart: ' + dart));
    });

    return completer.future;
  }

  @override
  int get hashCode => this.name.hashCode;


  bool operator==(other) {
    if (other is! BootstrapModule) return false;
    BootstrapModule module = other;
    return (module.name == name);
  }
}

class ModulesList implements List<BootstrapModule> {
  static final List<BootstrapModule> _modules = [
     new BootstrapModule('accordion', 'Accordion'),
     new BootstrapModule('alert', 'Alert'),
     new BootstrapModule('buttons', 'Buttons'),
     new BootstrapModule('carousel', 'Carousel'),
     new BootstrapModule('collapse', 'Collapse'),
     new BootstrapModule('datepicker', 'Datepicker'),
     new BootstrapModule('dropdown_toggle', 'Dropdown Toggle'),
     new BootstrapModule('modal', 'Modal'),
     new BootstrapModule('pagination', 'Pagination'),
     new BootstrapModule('popover', 'Popover'),
     new BootstrapModule('progressbar', 'Progressbar'),
     new BootstrapModule('rating', 'Rating'),
     new BootstrapModule('tabs' , 'Tabs'),
     new BootstrapModule('timepicker', 'Timepicker'),
     new BootstrapModule('tooltip', 'Tooltip'),
     new BootstrapModule('typeahead', 'Typeahead')];

  BootstrapModule operator [](int index) {
    return _modules[index];
  }

  void operator []=(int index, value) {
    _modules[index] = value;
  }

  void add(value) {
    _modules.add(value);
  }

  void addAll(Iterable iterable) {
    _modules.addAll(iterable);
  }

  bool any(bool test(element)) {
    return _modules.any(test);
  }

  Map<int, BootstrapModule> asMap() {
    return _modules.asMap();
  }

  void clear() {
    _modules.clear();
  }

  bool contains(Object element) {
    return _modules.contains(element);
  }

  BootstrapModule elementAt(int index) {
    return _modules.elementAt(index);
  }

  bool every(bool test(element)) {
    return _modules.every(test);
  }

  Iterable<BootstrapModule> expand(Iterable f(element)) {
    return _modules.expand(f);
  }

  void fillRange(int start, int end, [fillValue]) {
    _modules.fillRange(start, end, fillValue);
  }

  BootstrapModule get first => _modules.first;

  BootstrapModule firstWhere(bool test(element), {orElse()}) {
    return _modules.firstWhere(test, orElse: orElse);
  }

  BootstrapModule fold(initialValue, combine(previousValue, element)) {
    return _modules.fold(initialValue, combine);
  }

  void forEach(void f(element)) {
    _modules.forEach(f);
  }

  Iterable<BootstrapModule> getRange(int start, int end) {
    return _modules.getRange(start, end);
  }

  int indexOf(element, [int start = 0]) {
    return _modules.indexOf(element, start);
  }

  void insert(int index, element) {
    _modules.insert(index, element);
  }

  void insertAll(int index, Iterable iterable) {
    _modules.insertAll(index, iterable);
  }

  bool get isEmpty => _modules.isEmpty;

  bool get isNotEmpty => _modules.isNotEmpty;

  Iterator<BootstrapModule> get iterator => _modules.iterator;

  String join([String separator = ""]) {
    return _modules.join(separator);
  }

  BootstrapModule get last => _modules.last;

  int lastIndexOf(element, [int start]) {
    return _modules.lastIndexOf(element, start);
  }

  BootstrapModule lastWhere(bool test(element), {orElse()}) {
    return _modules.lastWhere(test, orElse: orElse);
  }

  int get length => _modules.length;

  void set length(int newLength) {
    _modules.length = newLength;
  }

  Iterable<BootstrapModule> map(f(element)) {
    return _modules.map(f);
  }

  BootstrapModule reduce(combine(value, element)) {
    return _modules.reduce(combine);
  }

  bool remove(Object value) {
    return _modules.remove(value);
  }

  BootstrapModule removeAt(int index) {
    return _modules.removeAt(index);
  }

  BootstrapModule removeLast() {
    return _modules.removeLast();
  }

  void removeRange(int start, int end) {
    _modules.removeRange(start, end);
  }

  void removeWhere(bool test(element)) {
    _modules.removeWhere(test);
  }

  void replaceRange(int start, int end, Iterable replacement) {
    _modules.replaceRange(start, end, replacement);
  }

  void retainWhere(bool test(element)) {
    _modules.retainWhere(test);
  }

  Iterable<BootstrapModule> get reversed => _modules.reversed;

  void setAll(int index, Iterable iterable) {
    _modules.setAll(index, iterable);
  }

  void setRange(int start, int end, Iterable iterable, [int skipCount = 0]) {
    _modules.setRange(start, end, iterable, skipCount);
  }

  void shuffle([Random random]) {
    _modules.shuffle(random);
  }

  BootstrapModule get single => _modules.single;

  BootstrapModule singleWhere(bool test(element)) {
    return _modules.singleWhere(test);
  }

  Iterable<BootstrapModule> skip(int n) {
    return _modules.skip(n);
  }

  Iterable<BootstrapModule> skipWhile(bool test(value)) {
    return _modules.skipWhile(test);
  }

  void sort([int compare(a, b)]) {
    _modules.sort(compare);
  }

  List<BootstrapModule> sublist(int start, [int end]) {
    return _modules.sublist(start);
  }

  Iterable<BootstrapModule> take(int n) {
    return _modules.take(n);
  }

  Iterable<BootstrapModule> takeWhile(bool test(value)) {
    return _modules.takeWhile(test);
  }

  List<BootstrapModule> toList({bool growable: true}) {
    return _modules.toList(growable: growable);
  }

  Set<BootstrapModule> toSet() {
    return _modules.toSet();
  }

  Iterable<BootstrapModule> where(bool test(element)) {
    return _modules.where(test);
  }
}