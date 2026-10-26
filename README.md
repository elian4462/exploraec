# Práctica Sesión 09 — IA y Modelos LLM en Flutter: Asistente ExploraIA

## 📋 Descripción del Proyecto
En esta práctica se integró inteligencia artificial en **ExploraEC** mediante la pestaña **«Asistente ExploraIA»**, conectada a un servidor proxy local y al protocolo MCP:
1. **Pestaña Asistente (`AssistantScreen`)**:
   - Interfaz conversacional para formular preguntas naturales sobre los gastos («¿En qué categoría gasto más?», «¿Cuánto me queda en comida?»).
   - Chips de preguntas sugeridas predefinidas (`Wrap` con `ActionChip`).
   - Envío de consulta y resumen de totales por categoría (`AiAssistantService.preguntar(consulta, resumen)`).
2. **Confirmación Humana Obligatoria (Human-in-the-loop)**:
   - Si la IA infiere la intención y propone registrar un nuevo gasto (`AccionPropuesta`), la app solicita confirmación explícita mediante un diálogo modal (`AlertDialog`) antes de ejecutar cualquier mutación en el backend.
3. **Servidor Proxy Local (`mock-server/mock-server.js`)**:
   - Proxy en Node.js que conecta con Google Gemini (modelo `gemini-2.5-flash` o `gemini-3.5-flash-lite`) mediante `GEMINI_API_KEY`, o responde con motor de reglas si no hay clave.
   - Seguridad y privacidad: nunca registra tokens de autenticación ni datos sensibles.
4. **Integración MCP (Model Context Protocol)**:
   - Cliente MCP (`mcp-cliente.js`) que consulta la herramienta `resumen_gastos` directamente en el servidor MCP del backend (`POST /mcp/`) utilizando el token del usuario (`X-Resumen-Origen: mcp`).

---

## 🧪 Pruebas Unitarias y de Integración

Todas las 22 pruebas (Sesión 8 y 9) pasan exitosamente con servidor y proxy simulados:

```bash
flutter test
```

---

## 🚀 Cómo Ejecutar el Proyecto

### 1. Iniciar el Proxy de IA (Opcional si se prueba con backend)
```bash
cd mock-server
# Modo con reglas (sin clave):
node mock-server.js

# O modo con Gemini API:
# $env:GEMINI_API_KEY="tu_clave_aqui"; node mock-server.js
```

### 2. Ejecutar la Aplicación Móvil
```bash
flutter pub get
flutter run
```

---

## 📦 Instrucciones de Entrega y Subida a GitHub

Este proyecto cuenta con su propio repositorio Git local configurado en la rama `main`.

Para subirlo a tu cuenta de GitHub (`elian4462`):

1. **Crear un nuevo repositorio en GitHub**:
   - Ve a [github.com/new](https://github.com/new)
   - Nombre sugerido: `practica-sesion-09` (o `modulo3-practica-09`)
   - Selecciona "Public" y **no** marques "Initialize with README".

2. **Vincular y hacer Push**:
   ```bash
   cd PRACTICA-09
   git remote add origin https://github.com/elian4462/practica-sesion-09.git
   git branch -M main
   git push -u origin main
   ```
