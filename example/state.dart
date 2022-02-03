import 'package:dp/state.dart';

void main() {
  var context = Context(StateFoo(), StateBar());

  print(context.request()); // Prints "StateFoo.handle".
  print(context.request()); // Prints "StateBar.handle".
}
