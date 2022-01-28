import "dart:io";

void main() {
  var elements = [ElementA(), ElementB()];

  client(elements, Visitor1());
  client(elements, Visitor2());
}

abstract class AbstractVisitor {
  void visitElementA(ElementA element);
  void visitElementB(ElementB element);
}

abstract class AbstractElement {
  void accept(AbstractVisitor visitor);
}

class ElementA implements AbstractElement {
  @override
  void accept(AbstractVisitor visitor) => visitor.visitElementA(this);

  void operation() => print(this);
}

class ElementB implements AbstractElement {
  @override
  void accept(AbstractVisitor visitor) => visitor.visitElementB(this);

  void operation() => print(this);
}

class Visitor1 implements AbstractVisitor {
  @override
  void visitElementA(ElementA element) {
    stdout.write("$this visits ");
    element.operation();
  }

  @override
  void visitElementB(ElementB element) {
    stdout.write("$this visits ");
    element.operation();
  }
}

class Visitor2 implements AbstractVisitor {
  @override
  void visitElementA(ElementA element) {
    stdout.write("$this visits ");
    element.operation();
  }

  @override
  void visitElementB(ElementB element) {
    stdout.write("$this visits ");
    element.operation();
  }
}
