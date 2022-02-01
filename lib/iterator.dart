/// ```dart
/// var aggregator = Aggregator(['foo', 'bar', 'baz']);
/// var iterator = aggregator.createIterator();
///
/// while (iterator.hasNext()) {
///   print(iterator.next()); // Prints: "foo" "bar" "baz"
/// }
/// ```

abstract class AbstractIterator<T> {
  T? next();
  bool hasNext();
}

class Iterator<T> implements AbstractIterator<T> {
  final List<T> _list;
  int _index = 0;

  Iterator(this._list);

  @override
  T? next() => hasNext() ? _list[_index++] : null;

  @override
  bool hasNext() => _index < _list.length;
}

abstract class AbstractAggregator<T> {
  AbstractIterator<T> createIterator();
}

class Aggregator<T> implements AbstractAggregator<T> {
  final List<T> _list;

  Aggregator(this._list);

  @override
  AbstractIterator<T> createIterator() => Iterator<T>(_list);
}
