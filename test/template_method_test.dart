import 'package:test/test.dart';
import 'package:dp/template_method.dart';

void main() {
    test('Template method is a result of primitive operations', () {
      final fooClass = FooClass();
      var result = fooClass.templateMethod();
      expect(result, [ResultOf.primitiveOperation1, ResultOf.primitiveOperation2]);
    });
}
