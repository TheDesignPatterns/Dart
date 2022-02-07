import 'package:test/test.dart';
import 'package:dp/iterator.dart';

void main() {
  group('Iterator.hasNext', () {
    test('returns false for empty collection', () {
      final iterator = Iterator([]);
      expect(iterator.hasNext(), isFalse);
    });

    test('returns true for non-empty collection', () {
      final iterator = Iterator(['foo']);
      expect(iterator.hasNext(), isTrue);
    });

    test('returns false unless next element', () {
      final iterator = Iterator(['foo']);
      iterator.next();
      expect(iterator.hasNext(), isFalse);
    });
  });

  group('Iterator.next', () {
    test('returns value if next element', () {
      final iterator = Iterator(['foo', 'bar']);
      expect(iterator.next(), 'foo');
      expect(iterator.next(), 'bar');
    });

    test('returns null unless next element', () {
      final iterator = Iterator(['foo']);
      expect(iterator.next(), 'foo');
      expect(iterator.next(), null);
    });
  });
}
