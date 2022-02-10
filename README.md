# Design Patterns in Dart

Design Patterns examples written in [Dart](https://dart.dev) in form of a library using [TDD](https://en.wikipedia.org/wiki/Test-driven_development) and [mocking objects](https://en.wikipedia.org/wiki/Mock_object) techniques.

## Layout

* `example/`: design patterns to build/run (e.g. ```$ dart run example/builder.dart```)
* `lib/`: design patterns to import from a dart file (e.g. ```import 'package:dp/builder.dart';```)
* `test/` : design patterns to test (e.g. ```$ dart test test/builder_test.dart```)
* `tool/`: tools that may be useful when commiting to this repo

## Build (assuming Dart env is up and running)

```
$ git clone https://github.com/TheDesignPatterns/Dart.git
$ cd Dart
$ dart run build_runner build
$ dart test
$ dart run example/decorator.dart
```

## Build (using official Dart image via podman/docker)

```
$ git clone https://github.com/TheDesignPatterns/Dart.git
$ cd Dart
$ podman run -it -v $PWD:/Dart -w /Dart docker.io/library/dart
$ dart run build_runner build
$ dart test
$ dart run example/decorator.dart
```

## Contributing

You want to contribute to this project? That's nice! So please just fork it and
send me a pull request.

## Like it?

Be the first to star it!
