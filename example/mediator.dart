import 'package:dp/mediator.dart';

void main() {
  var mediator = Mediator();
  var colleagues = [Colleague(mediator), Colleague(mediator), Colleague(mediator)];

  colleagues.first.handleRequest();
  print(colleagues); // Prints "[State.handled, State.notified, State.notified]".

  colleagues.last.handleRequest();
  print(colleagues); // Prints "[State.notified, State.notified, State.handled]".
}
