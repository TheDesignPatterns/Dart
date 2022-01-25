import 'package:test/test.dart';
import 'package:dart/flyweight.dart';

void main() {
  group('Flyweight(Bar)', () {
    test('is the same object as other Flyweight(Bar)', () {
      final bar = Flyweight('Bar');
      expect(bar, Flyweight('Bar'));
    });

    test('is not the same object as Flyweight(Baz)', () {
      final bar = Flyweight('Bar');
      expect(bar, isNot(Flyweight('Baz')));
    });
  });
}
