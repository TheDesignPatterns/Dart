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
    when(adaptee.specificRequest('oof'.runes)).thenReturn('foo'.runes);
  });

  group('adaptee', () { 
    test('Runes are reversed', () {
      var adaptee = Adaptee();

      expect(adaptee.specificRequest('rab'.runes), 'bar'.runes);
    });
  });

  group('adapter', () { 
    test('Strings are adapted to Runes', () {
      var adapter = Adapter(adaptee);

      expect(adapter.request('oof'), 'foo');
    });
  });
}
