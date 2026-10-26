# Práctica Sesión 05 — Mapas y Geolocalización en ExploraEC

## 📋 Descripción del Proyecto
En esta práctica se integró soporte para mapas interactivos y servicios de geolocalización en tiempo real sobre **ExploraEC**:
1. **Servicio de Ubicación (`LocationService`)**:
   - Detección de servicios de ubicación del sistema (`Geolocator.isLocationServiceEnabled`).
   - Verificación y solicitud en tiempo real de permisos de geolocalización (`checkPermission` / `requestPermission`).
   - Manejo de excepciones amigables con `LocationException`.
   - Cálculo de distancias geodésicas mediante la fórmula de Haversine (`distanciaAPlaceEnMetros`) y formateo legible (`formatearDistancia`).
2. **Pantalla de Mapa Interactiva (`MapScreen`)**:
   - Integración de `flutter_map` con teselas de OpenStreetMap (OSM) y `userAgentPackageName`.
   - Capa de marcadores (`MarkerLayer`):
     - Marcador especial para la ubicación en vivo del usuario.
     - Marcadores para cada uno de los lugares cargados en el `PlacesController`.
     - Navegación al tocar un marcador hacia la pantalla de detalle (`DetailScreen`) enviando la distancia en metros calculada.
   - Botón flotante para centrar la cámara del mapa en la ubicación del usuario (`mapController.move`).
3. **Distancia en Tiempo Real en Tarjetas (`PlaceCard`)**:
   - Inclusión reactiva de la distancia al lugar en las tarjetas de Inicio (`Obx`), actualizándose automáticamente cuando se obtiene la posición.

---

## 🚀 Cómo Ejecutar el Proyecto

```bash
# 1. Instalar dependencias
flutter pub get

# 2. Ejecutar la aplicación en emulador o dispositivo
flutter run
```

---

## 📦 Instrucciones de Entrega y Subida a GitHub

Este proyecto cuenta con su propio repositorio Git local configurado en la rama `main`.

Para subirlo a tu cuenta de GitHub (`elian4462`):

1. **Crear un nuevo repositorio en GitHub**:
   - Ve a [github.com/new](https://github.com/new)
   - Nombre sugerido: `practica-sesion-05` (o `modulo3-practica-05`)
   - Selecciona "Public" y **no** marques "Initialize with README".

2. **Vincular y hacer Push**:
   ```bash
   cd PRACTICA-05
   git remote add origin https://github.com/elian4462/practica-sesion-05.git
   git branch -M main
   git push -u origin main
   ```
