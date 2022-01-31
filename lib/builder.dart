/// ```dart
/// var tokens = [Token(Type.A, 'xx'), Token(Type.B, 'yy'), Token(Type.A, 'zz')];
///
/// var foo = Director(FooBuilder()).construct(tokens);
/// var bar = Director(BarBuilder()).construct(tokens);
///
/// print(foo); // Prints "[<A>xx</A>, <B>yy</B>, <A>zz</A>]".
/// print(bar); // Prints "A=[xx, zz] B=[yy]".
/// ```

enum Type { A, B }

class Token {
  Type type;
  String value;

  Token(this.type, this.value);
}

abstract class AbstractBuilder<Product> {
  void buildPartA(String value);
  void buildPartB(String value);
  Product getResult();
}

class FooBuilder implements AbstractBuilder<Foo> {
  late final _product = Foo();

  @override
  void buildPartA(String value) => _product.values.add('<A>$value</A>');
  @override
  void buildPartB(String value) => _product.values.add('<B>$value</B>');

  @override
  Foo getResult() => _product;
}

class BarBuilder implements AbstractBuilder<Bar> {
  late final _product = Bar();

  @override
  void buildPartA(String value) => _product.valuesA.add(value);
  @override
  void buildPartB(String value) => _product.valuesB.add(value);

  @override
  Bar getResult() => _product;
}

class Director<Product> {
  final AbstractBuilder _builder;

  Director(this._builder);

  Product construct(Iterable<Token> tokens) {
    for (var token in tokens) {
      if (token.type == Type.A) {
          _builder.buildPartA(token.value);
      } else {
          _builder.buildPartB(token.value);
      }
    }
    return _builder.getResult();
  }
}

class Foo {
  final values = <String>[];

  @override
  String toString() => '$values';
}

class Bar {
  final valuesA = <String>[];
  final valuesB = <String>[];

  @override
  String toString() => 'A=$valuesA, B=$valuesB';
}
