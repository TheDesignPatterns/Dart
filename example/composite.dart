import 'package:dp/composite.dart';

void main() {
  var composite = Foo([Bar(), Foo([Bar(), Bar()])]);

  print(composite.operation()); // Prints "Foo([Bar(), Foo([Bar(), Bar()])])".
}
