# Práctica Sesión 10 — Cierre de Calidad, Entrega Continua y Agentes de Código

## 📋 Descripción del Proyecto
En esta sesión final se completó la auditoría de calidad, resiliencia ante errores no controlados, automatización con GitHub Actions y desarrollo conjunto con un agente de código dentro de un arnés:
1. **Captura Global de Errores Inesperados (`ReporteErrores`)**:
   - `FlutterError.onError`: Intercepta fallos del framework en tiempo de renderizado y ejecución.
   - `PlatformDispatcher.instance.onError`: Captura excepciones asíncronas no controladas sin romper la aplicación.
   - `ErrorWidget.builder`: Reemplaza la pantalla roja de depuración por una interfaz de usuario amistosa y accesible (`ErrorPantallaView`).
   - Sanitización de registros (`limpiar`): Anonimiza cabeceras `Authorization` y tokens JWT antes de cualquier impresión o reporte a telemetría.
2. **Pruebas de Widgets y Cobertura Completa**:
   - Pruebas de widgets que verifican estados sin sesión (`SinSesionView`), validación de contraseñas cortas y vista amigable ante pantallas defectuosas (`PantallaConFallo`).
3. **Filtro de Gastos por Categoría (Generado por Agente en Arnés)**:
   - Filtro horizontal dinámico de categorías mediante `ChoiceChip` con opción "Todas" y categorías disponibles.
   - Reactividad instantánea con `Obx` en `GastosScreen` y `gastosFiltrados` en `GastosController`.
   - Prueba unitaria y de widget en `test/filtro_gastos_test.dart` verificando el comportamiento del filtro.
4. **Arnés de Contexto y Reglas para Agentes (`AGENTS.md`)**:
   - Definición de reglas del estudiante, convenciones de arquitectura y límites de seguridad para desarrollo asistido por IA.
5. **Puertas de Calidad (CI/CD) en GitHub Actions**:
   - `.github/workflows/ci.yml`: Análisis estático (`flutter analyze`) y ejecución automática de todas las pruebas en cada push/PR.
   - `.github/workflows/release-apk.yml`: Compilación y publicación automática del APK de producción al generar etiquetas de versión (`v*`).

---

## 🧪 Pruebas Unitarias y de Widgets

Se ejecutan todas las 29 pruebas del proyecto (Sesiones 8, 9, 10 y filtro de categoría):

```bash
flutter test
```

---

## 🚀 Cómo Ejecutar el Proyecto

```bash
# 1. Instalar dependencias
flutter pub get

# 2. Análisis de código
flutter analyze

# 3. Ejecutar la aplicación
flutter run
```

---

## 📦 Instrucciones de Entrega y Subida a GitHub

Este proyecto cuenta con su propio repositorio Git local configurado en la rama `main`.

Para subirlo a tu cuenta de GitHub (`elian4462`):

1. **Crear un nuevo repositorio en GitHub**:
   - Ve a [github.com/new](https://github.com/new)
   - Nombre sugerido: `practica-sesion-10` (o `modulo3-practica-10` / `exploraec-final`)
   - Selecciona "Public" y **no** marques "Initialize with README".

2. **Vincular y hacer Push**:
   ```bash
   cd PRACTICA-10
   git remote add origin https://github.com/elian4462/practica-sesion-10.git
   git branch -M main
   git push -u origin main
   ```
