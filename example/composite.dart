import 'package:dp/composite.dart';

void main() {
  var composite = Foo([Bar(), Foo([Bar(), Bar()]), Bar()]);

  // Prints "Foo([Bar(), Foo([Bar(), Bar()]), Bar()])".
  print(composite.operation());
}
