// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/adapter.dart';
import 'adapter_test.mocks.dart';

@GenerateMocks([AbstractAdaptee])
void main() {
  late AbstractAdaptee adapteeMock;

  setUp(() {
    adapteeMock = MockAbstractAdaptee();
    when(adapteeMock.specificRequest('oof'.runes)).thenReturn('foo'.runes);
  });

  test('Adapter adapts string to/from runes', () {
    final adapter = Adapter(adapteeMock);
    expect(adapter.request('oof'), 'foo');
  });

  test('Adaptee returns given runes in reverse order', () {
    final adaptee = Adaptee();
    expect(adaptee.specificRequest('rab'.runes), 'bar'.runes);
  });
}
