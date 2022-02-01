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
  void add(AbstractColleague colleague);
  void mediate(AbstractColleague colleague);
}

class Mediator implements AbstractMediator {
  final _colleagues = <AbstractColleague>{};

  @override
  void add(AbstractColleague colleague) => _colleagues.add(colleague);

  @override
  void mediate(AbstractColleague colleague) {
    for (var other in _othersThan(colleague)) {
      other.notify();
    }
  }

  Set _othersThan(AbstractColleague colleague) =>
      _colleagues.where((item) => item != colleague).toSet();
}

abstract class AbstractColleague {
  void handleRequest();
  void notify();
}

class Colleague implements AbstractColleague {
  final AbstractMediator _mediator;
  State _state = State.unknown;

  Colleague(this._mediator) {
    _mediator.add(this);
  }

  @override
  void handleRequest() {
    _state = State.handled;
    _mediator.mediate(this);
  }

  @override
  void notify() => _state = State.notified;

  @override
  String toString() => '$_state';
}
