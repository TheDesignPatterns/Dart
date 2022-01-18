import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/decorator.dart';
import 'decorator_test.mocks.dart';

@GenerateMocks([AbstractElement])
void main() {
  late AbstractElement element;

  setUp(() {
    element = MockAbstractElement();
  });

  test("verify Decorator", () {
    var sut = Decorator(element);

    sut.operation();
    verify(element.operation());
  });
}
