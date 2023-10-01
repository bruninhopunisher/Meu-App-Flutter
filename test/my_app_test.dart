import 'package:flutter_test/flutter_test.dart';
import 'package:meuprimeiroapp/my_app.dart';

void main() {
  testWidgets('MyApp widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MyApp), findsOneWidget);

  });
}
