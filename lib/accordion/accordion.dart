part of bootstrap_angular.elements;

@NgComponent(
    selector: 'accordion',
    templateUrl: 'packages/bootstrap_angular/accordion/accordion.html',
    publishAs: 'accordion',
    map: const {
      //'max-rating' : '@maxRating',
      //'rating' : '<=>rating'
    }
)
class Accordion {
  Accordion( ) {
    print('Accordion');
  }
}

class AccordionController {
  
}

class AccordionHeading {
  
}

class AccordionTransclude {
  
}