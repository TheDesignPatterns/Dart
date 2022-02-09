// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/interpreter.dart';
import 'interpreter_test.mocks.dart';

@GenerateMocks([AbstractExpression])
void main() {
  late AbstractExpression leftExpressionMock;
  late AbstractExpression rightExpressionMock;
  final context = {'a': 20, 'b': 10};

  setUp(() {
      leftExpressionMock = MockAbstractExpression();
      rightExpressionMock = MockAbstractExpression();
      when(leftExpressionMock.interpret(context)).thenReturn(20);
      when(rightExpressionMock.interpret(context)).thenReturn(10);
  });

  test('Var(iable) returns associated value', () {
    final variable = Var('a');
    expect(variable.interpret(context), 20);
  });

  test('Plus adds two expressions', () {
    final plus = Plus(leftExpressionMock, rightExpressionMock);
    expect(plus.interpret(context), 30);
  });

  test('Minus subtracts two expressions', () {
    final minus = Minus(leftExpressionMock, rightExpressionMock);
    expect(minus.interpret(context), 10);
  });
}
