import 'package:get/get.dart';

import '../models/place.dart';

enum EstadoCarga { cargando, exito, error }

/// Fuente única de verdad de los lugares — Sesión 4. Antes de esta sesión el
/// estado de la lista (su `Future`, las banderas de simulación y el
/// `setState`) vivía atrapado dentro de `HomeScreen`, y la pantalla se
/// enteraba de un lugar nuevo solo recargando a mano al volver del
/// formulario. Ahora vive aquí, registrado una sola vez por
/// `PlacesBinding` y obtenido con `Get.find()` (vía `GetView`, ver
/// `HomeScreen`): cualquier pantalla futura lo lee sin repetir esa carga.
class PlacesController extends GetxController {
  final RxList<Place> lugares = <Place>[].obs;
  final Rx<EstadoCarga> estado = EstadoCarga.cargando.obs;
  final RxString mensajeError = ''.obs;

  bool _modoDebugError = false;
  bool _modoDebugVacio = false;

  @override
  void onInit() {
    super.onInit();
    cargarLugares();
  }

  /// Simula uno de los 3 estados a propósito, solo para esta práctica —
  /// mismo recurso que `HomeScreen` traía desde la Sesión 3, ahora
  /// centralizado aquí para que cualquier pantalla pueda mostrarlos.
  void simular(String modo) {
    _modoDebugError = modo == 'error';
    _modoDebugVacio = modo == 'vacio';
    cargarLugares();
  }

  Future<void> cargarLugares() async {
    estado.value = EstadoCarga.cargando;

    try {
      final resultado = await fetchLugaresSimulado(
        forzarError: _modoDebugError,
        forzarVacio: _modoDebugVacio,
      );
      lugares.assignAll(resultado);
      estado.value = EstadoCarga.exito;
    } catch (e) {
      mensajeError.value = '$e';
      estado.value = EstadoCarga.error;
    }
  }

  /// Agrega un lugar creado a mano (`AddPlaceScreen`) — en memoria
  /// únicamente hasta que la Sesión 7 lo persista con Hive. `lugares.add`
  /// (en vez de reconstruir toda la lista) ya notifica a cualquier `Obx`
  /// que esté escuchando: Inicio se actualiza solo, sin el `_cargar()`
  /// manual que la Sesión 3 hacía al volver del formulario.
  void agregarLugar(Place lugar) {
    lugaresEjemplo.add(lugar);
    lugares.add(lugar);
  }

  /// Favoritos en memoria — Paso 6 (opcional). Viven solo mientras la app
  /// está abierta; la Sesión 7 los persiste con Hive, sin cambiar los
  /// nombres de abajo (`favoritos`, `esFavorito`, `alternarFavorito`).
  final RxList<Place> favoritos = <Place>[].obs;

  bool esFavorito(Place lugar) => favoritos.any((p) => p.id == lugar.id);

  /// Otro estado derivado: se calcula a partir de `favoritos`, no se guarda.
  int get totalFavoritos => favoritos.length;

  void alternarFavorito(Place lugar) {
    if (esFavorito(lugar)) {
      favoritos.removeWhere((p) => p.id == lugar.id);
    } else {
      favoritos.add(lugar);
    }
  }
}
