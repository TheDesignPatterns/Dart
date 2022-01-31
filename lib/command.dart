/// ```dart
/// var receiver = Receiver();
/// var commands = Commands(
///     'Execute ',
///     [Foo(receiver), BarBaz(receiver)],
///     ' not knowing the Receiver from inside Commands.'
/// );
///
/// // Prints "Execute Foo action, Bar action along with Baz action not knowing the Receiver from inside Commands."
/// print(commands.execute());
/// ```

abstract class AbstractCommand {
  String execute();
}

class Commands implements AbstractCommand {
  final String _prefix;
  final List<AbstractCommand> _commands;
  final String _suffix;

  Commands(this._prefix, this._commands, this._suffix);

  @override
  String execute() {
    var result = '$_prefix';
    for (var i = 0; i < _commands.length - 1; i++) {
      result += '${_commands[i].execute()}, ';
    }
    return '$result${_commands.last.execute()}$_suffix';
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
  String execute() => '${_receiver.bar()} along with ${_receiver.baz()}';
}

class Receiver {
  String foo() => 'Foo action';
  String bar() => 'Bar action';
  String baz() => 'Baz action';
}
