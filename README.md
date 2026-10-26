# Práctica Sesión 04 — Gestión de Estado con GetX en ExploraEC

## 📋 Descripción del Proyecto
En esta práctica se migró el estado de la aplicación a una arquitectura reactiva y centralizada utilizando **GetX**:
1. **`PlacesController` (GetxController)**:
   - Estado observable para la lista de lugares (`RxList<Place> lugares`), estado de carga (`Rx<EstadoCarga> estado`) y mensaje de error (`RxString mensajeError`).
   - Carga reactiva de lugares con manejo de excepciones y `assignAll`.
   - Soporte para favoritos en memoria con `alternarFavorito`, `esFavorito` y `totalFavoritos`.
2. **Inyección de Dependencias (`PlacesBinding`)**:
   - Registro global de `PlacesController` a través de `initialBinding: PlacesBinding()` en `GetMaterialApp`.
3. **Reactividad con `Obx`**:
   - `HomeScreen` migrado a `GetView<PlacesController>`.
   - `Obx` escucha cambios de estado y redibuja automáticamente la interfaz sin necesidad de `setState`.
4. **Navegación declarativa de GetX**:
   - Migración de `Navigator.push` a `Get.to(() => ...)` y `Get.back()`.
5. **Internacionalización y Traducciones (i18n)**:
   - Configuración de `AppTranslations` con soporte dinámico para español e inglés (`'es_EC'` / `'en_US'`).
   - Cambio de idioma reactivo con `Get.updateLocale` mediante botón en la AppBar.

---

## 🚀 Cómo Ejecutar el Proyecto

```bash
# 1. Instalar dependencias
flutter pub get

# 2. Ejecutar la aplicación
flutter run
```

---

## 📦 Instrucciones de Entrega y Subida a GitHub

Este proyecto cuenta con su propio repositorio Git local configurado en la rama `main`.

Para subirlo a tu cuenta de GitHub (`elian4462`):

1. **Crear un nuevo repositorio en GitHub**:
   - Ve a [github.com/new](https://github.com/new)
   - Nombre sugerido: `practica-sesion-04` (o `modulo3-practica-04`)
   - Selecciona "Public" y **no** marques "Initialize with README".

2. **Vincular y hacer Push**:
   ```bash
   cd PRACTICA-04
   git remote add origin https://github.com/elian4462/practica-sesion-04.git
   git branch -M main
   git push -u origin main
   ```
