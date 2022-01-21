class PartA {}

class PartB {}

class Product {
  final _partsA = <PartA>[];
  final _partsB = <PartB>[];

  void addPartA(PartA p) => _partsA.add(p);
  void addPartB(PartB p) => _partsB.add(p);

  void showParts() {
    print(_partsA);
    print(_partsB);
  }
}

abstract class AbstractBuilder {
  void buildPartA();
  void buildPartB();
  Product getResult();
}

class Builder implements AbstractBuilder {
  late final _product = Product();

  @override
  void buildPartA() => _product.addPartA(PartA());

  @override
  void buildPartB() => _product.addPartB(PartB());

  @override
  Product getResult() => _product;
}

class Director {
  final AbstractBuilder _builder;

  Director(this._builder);

  Product construct() {
    _builder.buildPartA();
    _builder.buildPartB();
    return _builder.getResult();
  }
}

void main() {
  var director = Director(Builder());
  var product = director.construct();

  product.showParts();
}
