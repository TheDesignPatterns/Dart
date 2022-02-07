import 'package:dp/template_method.dart';

void main() {
  var fooClass = FooClass();

  var result = fooClass.templateMethod();

  print(result); // Prints "[ResultOf.primitiveOperation1, ResultOf.primitiveOperation2]"
}
