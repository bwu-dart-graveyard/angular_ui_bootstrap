library angular_ui_bootstrap.elements;

import 'dart:html' as dom;
import 'package:angular/angular.dart' as ng;

import 'injectable_service.dart';

// Used by dart2js to indicate which targets are being reflected on, to allow
// tree-shaking.
@MirrorsUsed(
    targets: const [
        'angular',
        'angular.core',
        'angular.core.dom',
        'angular.core.parser',
        'angular.routing',
        dom.NodeTreeSanitizer,
        'angular.filter',
        'angular.perf',
        'angular.directive',
        'angular_ui_bootstrap.elements',
        'angular_ui_bootstrap.elements.accordion',
        'angular_ui_bootstrap.elements.alert',
        'angular_ui_bootstrap.elements.collapse',
        'angular_ui_bootstrap.elements.dropdown_toggle',
        'angular_ui_bootstrap.elements.modal',
        'angular_ui_bootstrap.elements.rating',
        'angular_ui_bootstrap.elements.transition',
        'angular_ui_bootstrap.elements.tabs'
    ],
    metaTargets: const [
        ng.NgInjectableService,
        ng.NgComponent,
        ng.NgDirective,
        ng.NgController,
        ng.NgFilter,
        ng.NgAttr,
        ng.NgOneWay,
        ng.NgOneWayOneTime,
        ng.NgTwoWay,
        ng.NgCallback,
        InjectableService,
    ],
    override: '*'
)
import 'dart:mirrors';

export 'injectable_service.dart';
export 'accordion/accordion.dart';
export 'alert/alert.dart';
export 'collapse/collapse.dart';
export 'dropdown_toggle/dropdown_toggle.dart';
export 'modal/modal.dart';
export 'rating/rating.dart';
export 'transition/transition.dart';
export 'tabs/tabs.dart';



