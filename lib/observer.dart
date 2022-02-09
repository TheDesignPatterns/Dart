// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

/// ```dart
/// var subject = Subject();
/// var observers = [Observer(subject), Observer(subject)];
///
/// subject.change();
/// print(observers); // Prints "[State.notified, State.notified]".
/// ```

enum State { initial, notified }

abstract class AbstractSubject {
  void attach(AbstractObserver observer);
  void notify();
}

class Subject implements AbstractSubject {
  final _observers = <AbstractObserver>{};

  @override
  void attach(AbstractObserver observer) => _observers.add(observer);

  @override
  void notify() {
    for (var observer in _observers) {
      observer.update();
    }
  }

  void change() => notify();
}

abstract class AbstractObserver {
  void update();
}

class Observer implements AbstractObserver {
  final AbstractSubject _subject;
  State _state = State.initial;

  Observer(this._subject) {
    _subject.attach(this);
  }

  @override
  void update() => _state = State.notified;

  @override
  String toString() => '$_state';
}
