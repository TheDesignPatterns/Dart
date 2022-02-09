// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/mediator.dart';
import 'mediator_test.mocks.dart';

@GenerateMocks([AbstractMediator, AbstractColleague])
void main() {
  late AbstractMediator mediatorMock;
  late AbstractColleague colleagueMock;
  late AbstractColleague otherColleagueMock;

  setUp(() {
    mediatorMock = MockAbstractMediator();
    colleagueMock = MockAbstractColleague();
    otherColleagueMock = MockAbstractColleague();
  });

  group('Colleague', () {
    test('adds itself to mediator list of colleagues when creating', () {
      final colleague = Colleague(mediatorMock);
      verify(mediatorMock.add(colleague));
    });

    test('triggers mediation when handling request', () {
      final colleague = Colleague(mediatorMock);
      colleague.handleRequest();
      verify(mediatorMock.mediate(colleague));
    });
  });

  group('Mediator', () {
    test('never notifies the colleague that has triggered mediation', () {
      final mediator = Mediator();
      mediator.add(colleagueMock);
      mediator.mediate(colleagueMock);
      verifyNever(colleagueMock.notify());
    });

    test('notifies other colleagues when mediating', () {
      final mediator = Mediator();
      mediator.add(otherColleagueMock);
      mediator.mediate(colleagueMock);
      verify(otherColleagueMock.notify());
    });
  });
}
