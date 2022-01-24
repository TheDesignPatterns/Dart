import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/facade.dart';
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
  });

  test('Facade returns "Foo|Bar|Baz"', () {
    AbstractFacade facade = Facade(factory);

    when(subsystemFoo.handle()).thenReturn('Foo');
    when(subsystemBar.handle()).thenReturn('Bar');
    when(subsystemBaz.handle()).thenReturn('Baz');

    expect(facade.handle(), 'Foo|Bar|Baz');
  });

  test('SubsystemFoo returns "Foo"', () {
    var foo = SubsystemFoo();

    expect(foo.handle(), 'Foo');
  });

  test('SubsystemBar returns "Bar"', () {
    var foo = SubsystemBar();

    expect(foo.handle(), 'Bar');
  });

  test('SubsystemBaz returns "Baz"', () {
    var foo = SubsystemBaz();

    expect(foo.handle(), 'Baz');
  });
}
