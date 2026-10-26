# Práctica Sesión 03 — Tema, Estados y Accesibilidad en ExploraEC

## 📋 Descripción del Proyecto
En esta práctica se consolidaron los siguientes requerimientos fundamentales sobre la aplicación móvil **ExploraEC**:
1. **Tema Material de Marca (`AppTheme`)**:
   - Centralización de colores (`navy`, `teal`), tipografía y bordes redondeados en `lib/theme/app_theme.dart`.
   - Soporte automático para **Modo Oscuro** (`darkTheme: AppTheme.darkTheme, themeMode: ThemeMode.system`).
2. **Tres Estados en Inicio (`FutureBuilder`)**:
   - `LoadingView`: Indicador visual con mensaje mientras se cargan los datos.
   - `EmptyView`: Vista amigable cuando la lista está vacía.
   - `ErrorView`: Vista de error con botón "Reintentar".
   - Menú de depuración `⋮` para simular estado normal, vacío o error.
3. **Layout Responsivo (`LayoutBuilder`)**:
   - En pantallas angostas (< 600 px): Lista vertical (`ListView`).
   - En pantallas anchas (>= 600 px y >= 900 px): Cuadrícula responsiva de 2 o 3 columnas (`GridView`) con `childAspectRatio: 2.2`.
4. **Accesibilidad con `Semantics`**:
   - Etiqueta semántica en `PlaceCard` (`label`, `hint`, `button: true`, `excludeSemantics: true`) para lectores de pantalla (TalkBack / VoiceOver).

---

## 🚀 Cómo Ejecutar el Proyecto

```bash
# 1. Obtener dependencias
flutter pub get

# 2. Ejecutar en emulador o dispositivo
flutter run
```

---

## 📦 Instrucciones de Entrega y Subida a GitHub

Este proyecto cuenta con su propio repositorio Git local configurado en la rama `main`.

Para subirlo a tu cuenta de GitHub (`elian4462`):

1. **Crear un nuevo repositorio en GitHub**:
   - Ve a [github.com/new](https://github.com/new)
   - Nombre sugerido: `practica-sesion-03` (o `modulo3-practica-03`)
   - Selecciona "Public" y **no** marques "Initialize with README".

2. **Vincular y hacer Push**:
   ```bash
   cd PRACTICA-03
   git remote add origin https://github.com/elian4462/practica-sesion-03.git
   git branch -M main
   git push -u origin main
   ```
