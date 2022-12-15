import 'package:flutter_test/flutter_test.dart';
import 'package:learn_flutter_test/app/app.dart';
import 'package:learn_flutter_test/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
