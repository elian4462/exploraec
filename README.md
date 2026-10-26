# Práctica Sesión 08 — Autenticación, Almacenamiento Seguro y CRUD Completo de Gastos

## 📋 Descripción del Proyecto
En esta práctica se consolidó la arquitectura de red profesional migrando a **Dio**, gestionando la sesión del usuario de forma persistente y segura, y completando el CRUD de gastos:
1. **Cliente HTTP con Interceptores (`ApiClient` con `dio`)**:
   - `onRequest`: Interceptor para inyectar automáticamente la cabecera `Authorization: Bearer <token>` en todas las solicitudes.
   - `onError`: Interceptor centralizado para capturar respuestas `401 Unauthorized` (sesión caducada), disparando el cierre de sesión y redirigiendo al login.
2. **Controlador de Autenticación (`AuthController`)**:
   - Registro de usuarios con validaciones de formulario (`Validadores.correo` y `Validadores.password`).
   - Inicio de sesión mediante OAuth2 (`application/x-www-form-urlencoded`).
   - Almacenamiento seguro del token en el llavero/keystore del dispositivo mediante `flutter_secure_storage`.
   - Restauración automática de sesión al iniciar la aplicación (`restaurarSesion`), verificando `GET /usuarios/me`.
   - Cambio de contraseña (`PUT /usuarios/me/password`).
3. **CRUD Completo de Gastos (`GastosController` & UI)**:
   - Carga dinámica de categorías desde el backend (`GET /gastos/categorias`).
   - Creación de gastos con control de límites del servidor (límite de 500 dólares con mensaje `ApiException`).
   - Edición de gastos con peticiones `PATCH` enviando exclusivamente los campos modificados.
   - Eliminación de gastos con confirmación visual en diálogo (`AlertDialog`) y actualización reactiva de la lista y la caché de Hive.
   - Limpieza completa de datos locales al cerrar sesión (`cerrarSesion`).

---

## 🧪 Pruebas Unitarias

Todas las 15 pruebas unitarias de autenticación, interceptores y CRUD pasan exitosamente:

```bash
flutter test test/sesion_08_test.dart
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
   - Nombre sugerido: `practica-sesion-08` (o `modulo3-practica-08`)
   - Selecciona "Public" y **no** marques "Initialize with README".

2. **Vincular y hacer Push**:
   ```bash
   cd PRACTICA-08
   git remote add origin https://github.com/elian4462/practica-sesion-08.git
   git branch -M main
   git push -u origin main
   ```
