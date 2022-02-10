// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

/// Usage example:
///
/// ```dart
/// var adaptee = Adaptee();
/// var adapter = Adapter(adaptee);
///
/// print('oof'.runes); // prints (111, 111, 102)
/// print(adaptee.specificRequest('oof'.runes)); // prints (102, 111, 111)
/// print(String.fromCharCodes(adaptee.specificRequest('oof'.runes))); // prints foo
///
/// print(adapter.request('oof')); // prints foo
/// ```

abstract class AbstractTarget {
  String request(String input);
}

class Adapter implements AbstractTarget {
  final AbstractAdaptee _adaptee;

  Adapter(this._adaptee);

  @override
  String request(String input) => _adaptee.specificRequest(input.runes).string;
}

abstract class AbstractAdaptee {
  Runes specificRequest(Runes input);
}

class Adaptee implements AbstractAdaptee {
  @override
  Runes specificRequest(Runes input) =>
      String.fromCharCodes(input.toList().reversed).runes;
}
