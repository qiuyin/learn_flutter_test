import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:learn_flutter_test/app/app.dart';

void main() {
  testGoldens('CounterPage click', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        const Device(name: 'ipad pro', size: Size(1366, 1024))
      ]) //　テストしたい端末かサイズを指定
      ..addScenario(
        widget: const App(),
        name: 'init',
      )
      ..addScenario(
        widget: const App(),
        name: 'tap add button 1 times',
        onCreate: (scenarioWidgetKey) async {
          final finder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(Icons.add),
          );
          await tester.tap(finder);
        },
      );
    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'counter-page');
  });
}
