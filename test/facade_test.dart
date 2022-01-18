import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/facade.dart';
import 'facade_test.mocks.dart';

@GenerateMocks([AbstractSubsystemFactory, AbstractSubsystemX, AbstractSubsystemY, AbstractSubsystemZ])
void main() {
  late AbstractSubsystemFactory factoryMock;
  late AbstractSubsystemX subsystemXMock;
  late AbstractSubsystemY subsystemYMock;
  late AbstractSubsystemZ subsystemZMock;

  setUp(() {
    factoryMock = MockAbstractSubsystemFactory();
    subsystemXMock = MockAbstractSubsystemX();
    subsystemYMock = MockAbstractSubsystemY();
    subsystemZMock = MockAbstractSubsystemZ();

    when(factoryMock.createX()).thenReturn(subsystemXMock);
    when(factoryMock.createY()).thenReturn(subsystemYMock);
    when(factoryMock.createZ()).thenReturn(subsystemZMock);
  });

  test("verify specific subsystems are called", () {
    AbstractFacade sut = Facade(factoryMock);
    sut.handle();

    verify(subsystemXMock.handle());
    verify(subsystemYMock.handle());
    verify(subsystemZMock.handle());
  });
}
