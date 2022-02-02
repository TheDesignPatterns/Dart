import 'package:dp/observer.dart';

void main() {
  var subject = Subject();
  var observers = [Observer(subject), Observer(subject)];

  subject.change();
  print(observers); // Prints "[State.notified, State.notified]".
}
