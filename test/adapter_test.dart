import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/adapter.dart';
import 'adapter_test.mocks.dart';

@GenerateMocks([AbstractAdaptee])
void main() {
  late AbstractAdaptee adaptee;

  setUp(() {
    adaptee = MockAbstractAdaptee();
  });

  group('Adaptee', () {
    test('Runes are put in reverse order', () {
      var adaptee = Adaptee();

      expect(adaptee.specificRequest('bar'.runes), 'rab'.runes);
    });
  });

  group('Adapter', () {
    test('Input/Output string is adapted to/from Runes', () {
      var adapter = Adapter(adaptee);

      when(adaptee.specificRequest('foo'.runes)).thenReturn('oof'.runes);
      expect(adapter.request('foo'), 'oof');
    });
  });
}
