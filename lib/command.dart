// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

/// Usage example:
///
/// ```dart
/// var receiver = Receiver();
///
/// // Commands class (aka Invoker) itself knows nothing about the Receiver.
/// var commands = Commands([Foo(receiver), BarBaz(receiver)]);
///
/// print(commands.execute()); // Prints "Receiver.foo, Receiver.bar, Receiver.baz".
/// ```

abstract class AbstractCommand {
  String execute();
}

class Commands implements AbstractCommand {
  final List<AbstractCommand> _commands;

  Commands(this._commands);

  @override
  String execute() {
    var result = '';
    for (var i = 0; i < _commands.length - 1; i++) {
      result += '${_commands[i].execute()}, ';
    }
    return '$result${_commands.last.execute()}';
  }
}

class Foo implements AbstractCommand {
  final Receiver _receiver;

  Foo(this._receiver);

  @override
  String execute() => _receiver.foo();
}

class BarBaz implements AbstractCommand {
  final Receiver _receiver;

  BarBaz(this._receiver);

  @override
  String execute() => '${_receiver.bar()}, ${_receiver.baz()}';
}

class Receiver {
  String foo() => 'Receiver.foo';
  String bar() => 'Receiver.bar';
  String baz() => 'Receiver.baz';
}
