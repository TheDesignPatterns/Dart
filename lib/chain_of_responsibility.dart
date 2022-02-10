// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

/// Usage example:
///
/// ```dart
/// var chain = Foo(Bar(Baz()));
///
/// print(chain.handleRequest(Request.foo)); // Prints "Foo handled".
/// print(chain.handleRequest(Request.bar)); // Prints "Bar handled".
/// print(chain.handleRequest(Request.baz)); // Prints "Baz handled".
/// ```

enum Request { foo, bar, baz }

abstract class AbstractHandler {
  String handleRequest(Request request);
}

class Foo implements AbstractHandler {
  final AbstractHandler _successor;

  Foo(this._successor);

  @override
  String handleRequest(Request request) =>
      request == Request.foo ? 'Foo handled' : _successor.handleRequest(request);
}

class Bar implements AbstractHandler {
  final AbstractHandler _successor;

  Bar(this._successor);

  @override
  String handleRequest(Request request) =>
      request == Request.bar ? 'Bar handled' : _successor.handleRequest(request);
}

class Baz implements AbstractHandler {
  @override
  String handleRequest(Request request) =>
      request == Request.baz ? 'Baz handled' : 'Unknown';
}
