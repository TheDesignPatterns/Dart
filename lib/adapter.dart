/// A target interface that client uses
abstract class AbstractTarget {
  String request(String input);
}

/// An adapter that adapts to target interface
///
/// String is adapted to/from Runes (Unicode)
class Adapter implements AbstractTarget {
  final AbstractAdaptee _adaptee;

  Adapter(this._adaptee);

  @override
  String request(String input) => _adaptee.specificRequest(input.runes).string;
}

/// An interface that needs adapting
abstract class AbstractAdaptee {
  Runes specificRequest(Runes input);
}

/// An Adaptee that puts Runes in reverse order
class Adaptee implements AbstractAdaptee {
  @override
  Runes specificRequest(Runes input) =>
      String.fromCharCodes(input.toList().reversed).runes;
}
