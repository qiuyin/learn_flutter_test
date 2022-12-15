import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> waitFor(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 20),
}) async {
  final end = tester.binding.clock.now().add(timeout);

  do {
    if (tester.binding.clock.now().isAfter(end)) {
      throw Exception('Timed out waiting for $finder');
    }

    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 100));
  } while (finder.evaluate().isEmpty);
}

FlutterExceptionHandler? _originalOnError;
void initCustomExpect() {
  _originalOnError = FlutterError.onError;
}

// A workaround for: https://github.com/flutter/flutter/issues/34499
void expectCustom(
    dynamic actual,
    dynamic matcher, {
      String? reason,
      dynamic skip, // true or a String
    }) {
  final onError = FlutterError.onError;
  FlutterError.onError = _originalOnError;
  expect(actual, matcher, reason: reason, skip: skip);
  FlutterError.onError = onError;
}
