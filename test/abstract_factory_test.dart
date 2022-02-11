// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:test/test.dart';
import 'package:dp/abstract_factory.dart';

void main() {
  late AbstractFactory factory1;
  late AbstractFactory factory2;

  setUp(() {
    factory1 = Factory1();
    factory2 = Factory2();
  });

  group('Factory1 creates', () {
    test('Foo1', () {
      final foo = factory1.createFoo();
      expect(foo.operation(), 'Foo1.operation');
    });

    test('Bar1', () {
      final bar = factory1.createBar();
      expect(bar.operation(), 'Bar1.operation');
    });
  });

  group('Factory2 creates', () {
    test('Foo2', () {
      final foo = factory2.createFoo();
      expect(foo.operation(), 'Foo2.operation');
    });

    test('Bar2', () {
      final bar = factory2.createBar();
      expect(bar.operation(), 'Bar2.operation');
    });
  });
}
