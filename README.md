# Práctica Sesión 06 — Programación Asíncrona y Backend de Gastos en ExploraEC

## 📋 Descripción del Proyecto
En esta práctica se integró la nueva sección **«Gastos del viaje»** comunicándose de forma asíncrona con el backend REST:
1. **Flujo Asíncrono en `GastosController`**:
   - Registro de usuario con manejo de colisiones de correo (`400 Bad Request` tolerado para usuarios existentes).
   - Autenticación (`login`) con obtención y almacenamiento en memoria del JWT bearer token.
   - Carga inicial paginada de gastos (`listarGastos(skip: 0, limit: 20)`).
   - Manejo de sesión caducada / inválida (`401 Unauthorized`), regresando al formulario con mensaje explicativo.
   - Paginación continua con `cargarMas()`.
2. **Tres Estados en Gastos (`Obx`)**:
   - Carga (`LoadingView`), lista vacía (`EmptyView`) y error (`ErrorView`) conectados reactivamente.
   - Deslizar para recargar (`RefreshIndicator`) con llamada directa al `Future` de `cargarGastos`.
3. **Capa de Red (`GastosApiService` y `ApiException`)**:
   - Consumo HTTP con encabezado `Authorization: Bearer <token>`.
   - Control de tiempo de espera (`timeout` de 15 segundos).
   - Traducción de códigos HTTP a mensajes de error comprensibles para el usuario.

---

## 🧪 Pruebas Unitarias

Esta práctica incluye pruebas completas con servidor simulado (`MockClient`):

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
   - Nombre sugerido: `practica-sesion-06` (o `modulo3-practica-06`)
   - Selecciona "Public" y **no** marques "Initialize with README".

2. **Vincular y hacer Push**:
   ```bash
   cd PRACTICA-06
   git remote add origin https://github.com/elian4462/practica-sesion-06.git
   git branch -M main
   git push -u origin main
   ```
