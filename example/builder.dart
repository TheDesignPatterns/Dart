import 'package:dp/builder.dart';

void main() {
  var foo = Director(FooBuilder()).construct();

  // Prints "Foo parts: [PartA.bar][PartB.bar, PartB.baz]"
  print(foo);
}

class FooBuilder implements AbstractBuilder {
  late final _foo = Foo();

  @override
  void buildPartA() => _foo.partsA.add(PartA.bar);
  @override
  void buildPartB() => _foo.partsB.addAll([PartB.bar, PartB.baz]);
  @override
  Foo getResult() => _foo;
}

class Foo {
  final partsA = <PartA>[];
  final partsB = <PartB>[];

  @override
  String toString() => 'Foo parts: $partsA$partsB';
}

enum PartA { bar, baz }
enum PartB { bar, baz }
