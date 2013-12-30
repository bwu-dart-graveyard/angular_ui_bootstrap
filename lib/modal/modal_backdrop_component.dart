part of bootstrap_angular.elements.modal;



/**
 * A helper directive for the $modal service. It creates a backdrop element.
 */
@ng.NgComponent(
  selector: 'modal-backdrop',
  templateUrl: 'packages/bootstrap_angular/modal/backdrop.html',
  publishAs: 'ctrl',
  publishTypes: const [ModalComponent]
)
class ModalBackdropComponent extends ModalComponent{
  final Duration _timeout;
  final ng.Scope _scope;
//  final dom.Element _element;
//  final ng.NodeAttrs _attrs;

  ModalBackdropComponent(this._scope, this._timeout) {
    _scope['animate'] = false;
  }

  void timeout() {
    _scope['animate'] = true;
  }
}
