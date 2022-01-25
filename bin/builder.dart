class Foo {}

class Bar {}

class Product {
  final _partsA = <Foo>[];
  final _partsB = <Bar>[];

  void addFoo(Foo foo) => _partsA.add(foo);
  void addBar(Bar bar) => _partsB.add(bar);

  void showParts() {
    print(_partsA);
    print(_partsB);
  }
}

abstract class AbstractBuilder {
  void buildFoo();
  void buildBar();
  Product getResult();
}

class Builder implements AbstractBuilder {
  late final _product = Product();

  @override
  void buildFoo() => _product.addFoo(Foo());

  @override
  void buildBar() => _product.addBar(Bar());

  @override
  Product getResult() => _product;
}

class Director {
  final AbstractBuilder _builder;

  Director(this._builder);

  Product construct() {
    _builder.buildFoo();
    _builder.buildBar();
    return _builder.getResult();
  }
}

void main() {
  var director = Director(Builder());
  var product = director.construct();

  product.showParts();
}
