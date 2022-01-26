abstract class AbstractBuilder<R> {
  void buildPartA();
  void buildPartB();
  R getResult();
}

class FooBuilder implements AbstractBuilder<Foo> {
  late final _foo = Foo();

  @override
  void buildPartA() => _foo.colors.addAll([Color.red, Color.blue]);
  @override
  void buildPartB() => _foo.shapes.add(Shape.diamond);
  @override
  Foo getResult() => _foo;
}

class BarBuilder implements AbstractBuilder<Bar> {
  late final _bar = Bar();

  @override
  void buildPartA() => _bar.sizes.add(Size.medium);
  @override
  void buildPartB() => _bar.shapes.addAll([Shape.square, Shape.rectangle]);
  @override
  Bar getResult() => _bar;
}

class Director<R> {
  final AbstractBuilder _builder;

  Director(this._builder);

  R construct() {
    _builder.buildPartA();
    _builder.buildPartB();
    return _builder.getResult();
  }
}

class Foo {
  final colors = <Color>[];
  final shapes = <Shape>[];

  @override
  String toString() => 'Foo parts: $colors$shapes';
}

class Bar {
  final sizes = <Size>[];
  final shapes = <Shape>[];

  @override
  String toString() => 'Bar parts: $sizes$shapes';
}

enum Color { red, green, blue }
enum Shape { square, rectangle, diamond }
enum Size { small, medium, large }
