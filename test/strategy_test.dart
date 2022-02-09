// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/strategy.dart';
import 'strategy_test.mocks.dart';

@GenerateMocks([AbstractStrategy])
void main() {
  late AbstractStrategy strategyMock;

  setUp(() {
      strategyMock = MockAbstractStrategy();
      when(strategyMock.algorithm()).thenReturn('Strategy.algorithm');
  });

  test('Context operates on given strategy', () {
    final context = Context(strategyMock);
    expect(context.operation(), 'Strategy.algorithm');
  });

  test('FooStrategy returns its algorithm', () {
    final foo = FooStrategy();
    expect(foo.algorithm(), 'FooStrategy.algorithm');
  });

  test('BarStrategy returns its algorithm', () {
    final bar = BarStrategy();
    expect(bar.algorithm(), 'BarStrategy.algorithm');
  });
}
