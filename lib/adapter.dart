/// A target interface that Client uses
abstract class AbstractTarget {
	String request(String input);
}

/// An adapter that adapts to target interface
///
/// Input/Output in form of String is adapted to/from Runes
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

/// A specific entity that converts input to output in reverse order
class Adaptee implements AbstractAdaptee {
	@override
	Runes specificRequest(Runes input) => String.fromCharCodes(input.toList().reversed).runes;
}
