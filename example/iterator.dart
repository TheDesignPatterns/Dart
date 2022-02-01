import 'package:dp/iterator.dart';

void main() {
  var aggregator = Aggregator(['foo', 'bar', 'baz']);
  var iterator = aggregator.createIterator();

  while (iterator.hasNext()) {
    print(iterator.next()); // Prints: "foo" "bar" "baz"
  }
}
