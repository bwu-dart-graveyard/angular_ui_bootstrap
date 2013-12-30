part of bootstrap_angular.elements.modal;

@ng.NgComponent(
  selector: 'modal-window',
  templateUrl: 'packages/bootstrap_angular/modal/window.html',
  publishAs: 'ctrl',
  publishTypes: const [ModalComponent]
)
class ModalWindowComponent extends ModalComponent{
  final Duration _timeout;
  final ng.Scope _scope;
  final dom.Element _element;
  final ng.NodeAttrs _attrs;
  final ModalStack _modalStack;

  ModalWindowComponent(this._scope, ModalStack this._modalStack, this._element, this._attrs, this._timeout) {
    _scope.$on('close', scopeClose);
  }

  void timeout() {
    // trigger CSS transistions
    _scope['animate'] = true;
    // focus a freshly-opened modal
    _element.children[0].focus();
  }

  void scopeClose(dom.Event e) { // TODO type annotation
    var modal = _modalStack.getTop();
    if(_modal != null && _modal.value.backdrop != null && modal.value.backdrop != 'static' && (e.target == e.currentTarget)) {
      e.preventDefault();
      e.stopPropagation();
      _modalStack.dismiss(_modal.key, 'backdrop click');
    }
  }
}