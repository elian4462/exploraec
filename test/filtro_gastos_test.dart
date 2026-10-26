import 'dart:io';

import 'package:dio/dio.dart';
import 'package:exploraec/controllers/auth_controller.dart';
import 'package:exploraec/controllers/gastos_controller.dart';
import 'package:exploraec/controllers/places_controller.dart' show EstadoCarga;
import 'package:exploraec/models/gasto.dart';
import 'package:exploraec/models/usuario.dart';
import 'package:exploraec/screens/gastos_screen.dart';
import 'package:exploraec/services/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class _GastosControllerFalso extends GastosController {
  @override
  void onInit() {
    // Evitar llamadas a red durante la prueba de UI del filtro
  }

  @override
  Future<void> cargarGastos() async {}
}

void main() {
  setUpAll(() {
    final tempDir = Directory.systemTemp.createTempSync('hive_filtro');
    Hive.init(tempDir.path);
  });

  setUp(() async {
    Get.reset();
    Get.testMode = true;
    FlutterSecureStorage.setMockInitialValues({});
  });

  test('Paso 7 (unitario) — filtrar gastos por categoría en GastosController', () {
    final api = Get.put(ApiClient(dio: Dio(BaseOptions(baseUrl: 'http://prueba'))));
    Get.put(AuthController(api: api));
    final controller = Get.put(GastosController());

    controller.gastos.assignAll([
      Gasto(id: 1, descripcion: 'Almuerzo mercado', monto: 5.5, categoria: 'comida', fecha: '2026-10-26'),
      Gasto(id: 2, descripcion: 'Taxi al centro', monto: 3.0, categoria: 'transporte', fecha: '2026-10-26'),
      Gasto(id: 3, descripcion: 'Cena típica', monto: 8.0, categoria: 'comida', fecha: '2026-10-26'),
    ]);

    expect(controller.gastosFiltrados.length, 3);
    expect(controller.categoriasDisponibles, containsAll(['Todas', 'comida', 'transporte']));

    controller.seleccionarCategoria('comida');
    expect(controller.gastosFiltrados.length, 2);
    expect(controller.gastosFiltrados.every((g) => g.categoria == 'comida'), isTrue);

    controller.seleccionarCategoria('transporte');
    expect(controller.gastosFiltrados.length, 1);
    expect(controller.gastosFiltrados.first.descripcion, 'Taxi al centro');

    controller.seleccionarCategoria('Todas');
    expect(controller.gastosFiltrados.length, 3);
  });

  testWidgets('Paso 7 (widget) — al elegir comida solo se ven los gastos de comida', (tester) async {
    final api = Get.put(ApiClient(dio: Dio(BaseOptions(baseUrl: 'http://prueba'))));
    final auth = Get.put(AuthController(api: api));
    auth.usuario.value = const Usuario(id: 1, email: 'a@b.com');

    final controller = Get.put<GastosController>(_GastosControllerFalso());
    controller.estado.value = EstadoCarga.exito;
    controller.gastos.assignAll([
      Gasto(id: 1, descripcion: 'Almuerzo mercado', monto: 5.5, categoria: 'comida', fecha: '2026-10-26'),
      Gasto(id: 2, descripcion: 'Taxi al centro', monto: 3.0, categoria: 'transporte', fecha: '2026-10-26'),
      Gasto(id: 3, descripcion: 'Cena típica', monto: 8.0, categoria: 'comida', fecha: '2026-10-26'),
    ]);

    await tester.pumpWidget(const GetMaterialApp(home: GastosScreen()));
    await tester.pump();

    // Inicialmente se ven todos
    expect(find.text('Almuerzo mercado'), findsOneWidget);
    expect(find.text('Taxi al centro'), findsOneWidget);
    expect(find.text('Cena típica'), findsOneWidget);

    // Tocar el chip de comida
    final chipComida = find.widgetWithText(ChoiceChip, 'comida');
    expect(chipComida, findsOneWidget);
    await tester.tap(chipComida);
    await tester.pump();

    // Ahora solo se ven los de comida
    expect(find.text('Almuerzo mercado'), findsOneWidget);
    expect(find.text('Cena típica'), findsOneWidget);
    expect(find.text('Taxi al centro'), findsNothing);

    // Tocar 'Todas' para volver a ver todos
    final chipTodas = find.widgetWithText(ChoiceChip, 'Todas');
    expect(chipTodas, findsOneWidget);
    await tester.tap(chipTodas);
    await tester.pump();

    expect(find.text('Taxi al centro'), findsOneWidget);
  });
}
