# Práctica Sesión 07 — Almacenamiento Local y Caché Offline con Hive en ExploraEC

## 📋 Descripción del Proyecto
En esta práctica se incorporó almacenamiento local rápido, ligero y persistente en el dispositivo utilizando **Hive**:
1. **Repositorio de Gastos con Respaldo en Caché (`GastosRepository`)**:
   - Patrón *servidor primero con respaldo offline*: Si el backend responde, se actualiza la caja local del usuario (`gastos_<id_usuario>`); si falla por red (sin conexión) o por error 5xx, se recupera la última copia guardada en Hive.
   - Variable observable `desdeCache` para notificar al usuario.
2. **Banner Informativo Sin Conexión (`MaterialBanner`)**:
   - Visualización de banner de advertencia cuando los datos provienen de la caché local, mostrando la fecha/hora de la última sincronización y acción de "Reintentar".
3. **Persistencia de Favoritos en Lugares**:
   - Caja global de Hive `favoritos` (`Hive.openBox<Map>('favoritos')`).
   - Métodos `alternarFavorito`, `esFavorito` y `totalFavoritos` conectados a Hive para persistir lugares seleccionados entre sesiones de la app.
4. **Privacidad y Cierre de Sesión Seguro**:
   - Al cerrar sesión (`salir`), se vacía y elimina por completo la caja del usuario en el disco (`await _repository.vaciar()`) para evitar exposición de datos compartidos.
5. **Persistencia de Preferencias de Idioma (`SettingsService`)**:
   - Caja `ajustes` en Hive para almacenar y recordar el idioma preferido (español o inglés) al reiniciar la app.

---

## 🧪 Pruebas Unitarias

Todas las 10 pruebas unitarias con mock de red y Hive pasan exitosamente:

```bash
flutter test test/gastos_controller_test.dart
```

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
   - Nombre sugerido: `practica-sesion-07` (o `modulo3-practica-07`)
   - Selecciona "Public" y **no** marques "Initialize with README".

2. **Vincular y hacer Push**:
   ```bash
   cd PRACTICA-07
   git remote add origin https://github.com/elian4462/practica-sesion-07.git
   git branch -M main
   git push -u origin main
   ```
