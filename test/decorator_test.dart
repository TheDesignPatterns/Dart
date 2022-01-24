import 'package:dart/decorator.dart';
import 'package:test/test.dart';

void main() {
  test('Returns "Foo"', () {
    var foo = Foo();

    expect(foo.operation(), 'Foo');
  });

  test('Returns "FooBar"', () {
    var fooBar = Decorator(Foo(), 'Bar');

    expect(fooBar.operation(), 'FooBar');
  });

  test('Returns "FooBarBaz"', () {
    var fooBarBaz = Decorator(Decorator(Foo(), 'Bar'), 'Baz');

    expect(fooBarBaz.operation(), 'FooBarBaz');
  });
}
