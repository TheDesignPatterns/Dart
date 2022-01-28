import 'package:dp/composite.dart';

void main() {
  var composite = Composite([Bar(), Composite([Bar(), Bar()]), Bar()]);

  // Prints "Foo([Bar(), Foo([Bar(), Bar()]), Bar()])".
  print(composite.operation());
}
