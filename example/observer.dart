// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:dp/observer.dart';

void main() {
  var subject = Subject();
  var observers = [Observer(subject), Observer(subject)];

  subject.change();
  print(observers); // Prints "[State.notified, State.notified]".
}
