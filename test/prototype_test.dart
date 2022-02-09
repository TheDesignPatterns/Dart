// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:test/test.dart';
import 'package:dp/prototype.dart';

void main() {
  test('Prototype name is just "foo"', () {
    final foo = Prototype('foo');
    expect(foo.toString(), 'foo');
  });

  test('Prototype name after cloning is "fooClone"', () {
    final fooClone = Prototype('foo').clone();
    expect(fooClone.toString(), 'fooClone');
  });
}
