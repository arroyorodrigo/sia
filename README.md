# sia

Workflow de [Alfred](https://www.alfredapp.com/) para conversar con el modelo de lenguaje de Apple que corre **localmente en el Mac** (Apple Foundation Models, vía `fm serve`). Sin internet, sin API key, sin costo.

![icono](workflow/icon.png)

## Requisitos

- macOS 27 (incluye el comando `fm`) en un Mac con Apple Silicon.
- Apple Intelligence activado.
- Alfred 5.5 o superior con Powerpack.

## Instalación

1. Acepta los términos del modelo una vez: `fm license`
2. Deja el servidor local corriendo siempre (se inicia solo al encender el Mac):

   ```zsh
   zsh scripts/instalar-fm-serve.sh
   ```

   Compruébalo con `curl http://127.0.0.1:1976/v1/models`. Para desinstalarlo: `zsh scripts/instalar-fm-serve.sh --quitar`
3. Haz doble clic en `sia.alfredworkflow`.

## Uso

### Keyword `sia`

- `sia <pregunta>` + ↩ continúa la conversación actual.
- ⌘↩ empieza un chat nuevo · ⌥↩ abre el historial.

Dentro del chat: ↩ preguntar · ⌘↩ chat nuevo · ⌥↩ copiar última respuesta · ⌃↩ copiar todo · ⇧↩ interrumpir.

### Acciones universales

Selecciona texto en cualquier app y abre las acciones universales de Alfred:

| Acción | Qué hace |
|---|---|
| sia: Resumir | Resumen de máximo 5 líneas |
| sia: Keywords para Obsidian | 5 a 8 conceptos como `[[wikilinks]]` |
| sia: Corregir | Ortografía y gramática, sin cambiar el estilo |
| sia: Traducir al inglés académico | Registro formal de artículo científico |
| sia: Traducir al español | Español de Chile, fiel al original |
| sia: Preguntar (con instrucción) | Escribes tu propia instrucción |

Cada acción empieza un chat nuevo.

## Configuración

En Alfred → Workflows → sia → *Configure Workflow*: keyword, mensajes de contexto, timeout e instrucciones de sistema. El endpoint (`sia_endpoint`) y el modelo (`sia_model`) están en las variables del workflow (botón **[x]**).

## Límites

- El modelo local tiene una ventana de contexto pequeña (del orden de 4.000 tokens): funciona bien con preguntas y textos cortos, no con documentos largos.
- El chat solo envía al modelo los últimos mensajes (6 por defecto).
- `fm` está en beta: una actualización de macOS puede cambiar el puerto o el comportamiento de `fm serve`.
- El uso del modelo se rige por los términos que aceptas con `fm license`.

## Desarrollo

El código fuente está en `workflow/`. Tras modificarlo, `zsh build.sh` regenera `sia.alfredworkflow`.

## Créditos

Basado en el [workflow OpenAI de Alfred](https://github.com/alfredapp/openai-workflow) (BSD 3-Clause, © Running with Crayons Ltd). Ver [LICENSE](LICENSE).
