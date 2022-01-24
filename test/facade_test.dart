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
  late AbstractSubsystemFactory factoryMock;
  late AbstractSubsystemFoo subsystemFooMock;
  late AbstractSubsystemBar subsystemBarMock;
  late AbstractSubsystemBaz subsystemBazMock;

  setUp(() {
    factoryMock = MockAbstractSubsystemFactory();
    subsystemFooMock = MockAbstractSubsystemFoo();
    subsystemBarMock = MockAbstractSubsystemBar();
    subsystemBazMock = MockAbstractSubsystemBaz();

    when(factoryMock.createFoo()).thenReturn(subsystemFooMock);
    when(factoryMock.createBar()).thenReturn(subsystemBarMock);
    when(factoryMock.createBaz()).thenReturn(subsystemBazMock);
  });

  test('Facade returns "Foo|Bar|Baz"', () {
    AbstractFacade facade = Facade(factoryMock);

    when(subsystemFooMock.handle()).thenReturn('Foo');
    when(subsystemBarMock.handle()).thenReturn('Bar');
    when(subsystemBazMock.handle()).thenReturn('Baz');

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
