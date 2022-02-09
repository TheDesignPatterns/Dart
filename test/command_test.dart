// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/command.dart';
import 'command_test.mocks.dart';

@GenerateMocks([AbstractCommand])
void main() {
  late AbstractCommand commandMock;

  setUp(() {
      commandMock = MockAbstractCommand();
      when(commandMock.execute()).thenReturn('Command');
  });

  test('Commands composition invokes given commands', () {
    final commands = Commands([commandMock, commandMock]);
    expect(commands.execute(), 'Command, Command');
  });

  test('Foo command delegates executing to given receiver', () {
    final foo = Foo(Receiver());
    expect(foo.execute(), 'Receiver.foo');
  });

  test('BarBaz command delegates executing to given receiver', () {
    final barBaz = BarBaz(Receiver());
    expect(barBaz.execute(), 'Receiver.bar, Receiver.baz');
  });
}
