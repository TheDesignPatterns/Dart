/// ```dart
/// var visitor1 = Visitor1();
/// var visitor2 = Visitor2();
///
/// for (var element in [Foo(), Bar(), Bar(), Foo()]) {
///   element.accept(visitor1);
///   element.accept(visitor2);
/// }
///
/// print(visitor1); // Prints "visited [Foo, Bar, Bar, Foo]".
/// print(visitor2); // Prints "visited [Foo, Foo][Bar, Foo]".
/// ```

abstract class AbstractVisitor {
  void visitFoo(Foo element);
  void visitBar(Bar element);
}

abstract class AbstractElement {
  void accept(AbstractVisitor visitor);
}

class Foo implements AbstractElement {
  @override
  void accept(AbstractVisitor visitor) => visitor.visitFoo(this);

  String operation() => 'Foo';
}

class Bar implements AbstractElement {
  @override
  void accept(AbstractVisitor visitor) => visitor.visitBar(this);

  String operation() => 'Bar';
}

class Visitor1 implements AbstractVisitor {
  final visited = <String>[];

  @override
  void visitFoo(Foo element) {
    visited.add(element.operation());
  }

  @override
  void visitBar(Bar element) {
    visited.add(element.operation());
  }

  @override
  String toString() => 'visited $visited';
}

class Visitor2 implements AbstractVisitor {
  final fooVisited = <String>[];
  final barVisited = <String>[];

  @override
  void visitFoo(Foo element) {
    fooVisited.add(element.operation());
  }

  @override
  void visitBar(Bar element) {
    barVisited.add(element.operation());
  }

  @override
  String toString() => 'visited $fooVisited$barVisited';
}
