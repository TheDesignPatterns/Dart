import 'package:dart/proxy.dart';

class RealSubject implements AbstractSubject {
  @override
  Result handle(Request request) => Result.accepted;
}

void main() {
  AbstractSubject proxy = Proxy(RealSubject(), Request.A);

  proxy.handle(Request.A);
}
