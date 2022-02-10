// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

/// Usage example:
///
/// ```dart
/// var context = Context(StateFoo(), StateBar());
///
/// print(context.request()); // Prints "StateFoo.handle".
/// print(context.request()); // Prints "StateBar.handle".
/// ```

typedef Result = String;

abstract class AbstractState {
  Result handle(AbstractContext context);
}

class StateFoo implements AbstractState {
  @override
  Result handle(AbstractContext context) {
    context.moveToStateBar();
    return 'StateFoo.handle';
  }
}

class StateBar implements AbstractState {
  @override
  Result handle(AbstractContext context) {
    context.moveToStateFoo();
    return 'StateBar.handle';
  }
}

abstract class AbstractContext {
  void moveToStateFoo();
  void moveToStateBar();
}

class Context implements AbstractContext {
  final AbstractState _stateFoo;
  final AbstractState _stateBar;
  AbstractState _current;

  Context(this._stateFoo, this._stateBar) : _current = _stateFoo;

  @override
  void moveToStateFoo() => _current = _stateFoo;
  @override
  void moveToStateBar() => _current = _stateBar;

  Result request() => _current.handle(this);
}
