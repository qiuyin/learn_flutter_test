import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:learn_flutter_test/main_production.dart' as app;

import 'utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('counter', (tester) async {
    // I call this at the top of each test
    initCustomExpect();
    debugPrint('---test start--');
    app.main();
    await tester.pumpAndSettle();
    expectCustom((find.byKey(const Key('count')).evaluate().single.widget as Text).data, '0');

    debugPrint('--tab add button--');
    final addButton = find.byIcon(Icons.add);
    await tester.tap(addButton);
    await tester.pumpAndSettle();
    expectCustom((find.byKey(const Key('count')).evaluate().single.widget as Text).data, '1');

    debugPrint('--tab add button--');
    await tester.tap(addButton);
    await tester.pumpAndSettle();
    expectCustom((find.byKey(const Key('count')).evaluate().single.widget as Text).data, '2');
    debugPrint('--test end--');
  });
}
