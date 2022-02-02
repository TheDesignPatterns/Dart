import 'package:test/test.dart';
import 'package:dp/memento.dart';

void main() {
  late Originator foo;

  setUp(() {
    foo = Originator('Foo');
  });

  group('Foo', () {
    test('is renamed to "Bar"', () {
      final caretaker = Caretaker(foo);
      caretaker.rename('Bar');
      expect(foo.toString(), 'Bar');
    });

    test('is restored to "Foo" after renaming', () {
      final caretaker = Caretaker(foo);
      caretaker.rename('Bar');
      caretaker.undo();
      expect(foo.toString(), 'Foo');
    });
  });
}
