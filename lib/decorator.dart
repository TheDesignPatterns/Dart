abstract class AbstractElement {
  void operation();
}

class Decorator implements AbstractElement {
  final AbstractElement _element;

  const Decorator(this._element);

  @override
  void operation() {
    _element.operation();
  }
}
