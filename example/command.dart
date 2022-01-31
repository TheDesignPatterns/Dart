import 'package:dp/command.dart';

void main() {
  var receiver = Receiver();
  var commands = Commands(
      'Execute ',
      [Foo(receiver), BarBaz(receiver)],
      ' not knowing the Receiver from inside Commands.'
  );

  // Prints "Execute Foo action, Bar action along with Baz action not knowing the Receiver from inside Commands."
  print(commands.execute());
}
