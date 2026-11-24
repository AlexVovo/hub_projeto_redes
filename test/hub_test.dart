import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hub_projeto_redes/main.dart';
import 'package:hub_projeto_redes/widgets/link_card.dart';

void main() {
  testWidgets('Busca e categoria se combinam e permitem limpar os filtros', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1440, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const ProjetoRedesApp());
    await tester.tap(find.widgetWithText(ChoiceChip, 'Registro'));
    await tester.pumpAndSettle();
    expect(find.text('2 de 11 recursos'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'teleoncoped');
    await tester.pumpAndSettle();
    expect(find.text('1 de 11 recursos'), findsOneWidget);
    expect(find.byType(LinkCard), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'inexistente');
    await tester.pumpAndSettle();
    expect(find.text('Nenhum recurso encontrado.'), findsOneWidget);
    await tester.tap(find.byTooltip('Limpar busca'));
    await tester.pumpAndSettle();
    expect(find.text('2 de 11 recursos'), findsOneWidget);
  });

  testWidgets('Layout cabe em celular e com texto ampliado', (tester) async {
    tester.view.physicalSize = const Size(320, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(textScaler: TextScaler.linear(1.5)),
          child: const ProjetoRedesApp(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
