/// ```dart
/// var mediator = Mediator();
/// var colleagues = [Colleague(mediator), Colleague(mediator), Colleague(mediator)];
///
/// colleagues.first.handleRequest();
/// print(colleagues); // Prints "[State.handled, State.notified, State.notified]".
///
/// colleagues.last.handleRequest();
/// print(colleagues); // Prints "[State.notified, State.notified, State.handled]".
/// ```

enum State { unknown, handled, notified  }

abstract class AbstractMediator {
  void mediate(Colleague colleague);
  void add(Colleague colleague);
}

class Mediator implements AbstractMediator {
  final _colleagues = <Colleague>{};

  @override
  void mediate(Colleague colleague) {
    for (var other in _othersThan(colleague)) {
      other.notify();
    }
  }

  @override
  void add(Colleague colleague) => _colleagues.add(colleague);

  Set _othersThan(Colleague colleague) =>
      _colleagues.where((item) => item != colleague).toSet();
}

class Colleague {
  final AbstractMediator _mediator;
  State _state = State.unknown;

  Colleague(this._mediator) {
    _mediator.add(this);
  }

  void handleRequest() {
    _state = State.handled;
    _mediator.mediate(this);
  }

  void notify() => _state = State.notified;

  @override
  String toString() => '$_state';
}
