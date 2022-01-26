import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/facade.dart';
import 'facade_test.mocks.dart';

@GenerateMocks([
  AbstractSubsystemFactory,
  AbstractSubsystemFoo,
  AbstractSubsystemBar,
  AbstractSubsystemBaz
])
void main() {
  late AbstractSubsystemFactory factory;
  late AbstractSubsystemFoo subsystemFoo;
  late AbstractSubsystemBar subsystemBar;
  late AbstractSubsystemBaz subsystemBaz;

  setUp(() {
    factory = MockAbstractSubsystemFactory();
    subsystemFoo = MockAbstractSubsystemFoo();
    subsystemBar = MockAbstractSubsystemBar();
    subsystemBaz = MockAbstractSubsystemBaz();

    when(factory.createFoo()).thenReturn(subsystemFoo);
    when(factory.createBar()).thenReturn(subsystemBar);
    when(factory.createBaz()).thenReturn(subsystemBaz);

    when(subsystemFoo.handle()).thenReturn('Foo');
    when(subsystemBar.handle()).thenReturn('Bar');
    when(subsystemBaz.handle()).thenReturn('Baz');
  });

  test('Facade returns "Foo|Bar|Baz"', () {
    final facade = Facade(factory);
    expect(facade.handle(), 'Foo|Bar|Baz');
  });
}
