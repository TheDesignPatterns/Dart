// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/builder.dart';
import 'builder_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<AbstractBuilder<String>>()])
void main() {
  late AbstractBuilder builderMock;

  setUp(() {
    builderMock = MockAbstractBuilder();
    when(builderMock.getResult()).thenReturn('product');
  });

  test('Director constructs a product using Builder interface', () {
    final director = Director(builderMock);
    director.construct([Token(Type.A, 'xx'), Token(Type.B, 'yy')]);
    verifyInOrder([
      builderMock.buildPartA('xx'),
      builderMock.buildPartB('yy'),
      builderMock.getResult()
    ]);
  });

  group('FooBuilder builds Foo reflecting value passed to', () {
    test('buildPartA', () {
      final builder = FooBuilder();
      builder.buildPartA('xx');
      var foo = builder.getResult();
      expect(foo.values, ['<A>xx</A>']);
    });

    test('buildPartB', () {
      final builder = FooBuilder();
      builder.buildPartB('yy');
      var foo = builder.getResult();
      expect(foo.values, ['<B>yy</B>']);
    });
  });

  group('BarBuilder builds Bar reflecting value passed to', () {
    test('buildPartA', () {
      final builder = BarBuilder();
      builder.buildPartA('xx');
      var bar = builder.getResult();
      expect(bar.valuesA, ['xx']);
    });

    test('buildPartB', () {
      final builder = BarBuilder();
      builder.buildPartB('yy');
      var bar = builder.getResult();
      expect(bar.valuesB, ['yy']);
    });
  });
}
