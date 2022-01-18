import 'package:dart/decorator.dart';

class Element implements AbstractElement {
  @override
  void operation() => print('$this has been decorated');
}

void main() {
  AbstractElement decorator = Decorator(Element());

  decorator.operation();
}
