---
title: "Bloque 02 · Skills — Módulo 02: Planning & Design"
source:
  - "The Complete Guide to Building Skills for Claude · Chapter 2 (Planning & design)"
---

# Módulo 02 — Skills: Planning & Design (Notas finales)

Este módulo convierte “idea” → “skill instalable” siguiendo el **Chapter 2: Planning & design** de la guía oficial, y aterriza el resumen de NotebookLM en una checklist operativa. :contentReference[oaicite:0]{index=0}

---

## 1) Planning: define 2–3 casos de uso (antes de escribir nada)

**Regla práctica:** no empieces por el archivo. Empieza por **2–3 workflows repetibles** y define el “resultado correcto”. :contentReference[oaicite:1]{index=1}

### Las 3 categorías oficiales (elige 1 como “primary”)
1) **Document & asset creation**  
   Outputs consistentes sin herramientas externas (docs, slides, componentes, propuestas, research deliverables). :contentReference[oaicite:2]{index=2}
2) **Workflow automation**  
   Procesos multi-step con metodología fija (p. ej., “crear un nuevo skill”, “montar un repo estándar”, “operar un funnel”). :contentReference[oaicite:3]{index=3}
3) **MCP enhancement**  
   Añadir “recetas” sobre un MCP existente (p. ej., Sentry → GitHub fixes; Figma → export + docs). :contentReference[oaicite:4]{index=4}

### Qué definir para cada caso de uso (mínimo viable)
- **Input típico** (cómo lo pide el usuario, en lenguaje natural)
- **Output esperado** (formato + calidad)
- **Criterio de done** (qué significa “éxito”)
- **Errores previsibles** (y qué hacer)

---

## 2) Reglas estrictas de estructura (si fallas aquí, no carga)

La estructura del skill es “no negociable” (en especial naming y archivos). :contentReference[oaicite:5]{index=5}

### Reglas de naming / ficheros (las que más rompen)
- **Carpeta del skill en kebab-case**: `notion-project-setup/`  
  (sin espacios, sin `_`, sin mayúsculas). :contentReference[oaicite:6]{index=6}
- **Archivo obligatorio exacto**: `SKILL.md` (case-sensitive). :contentReference[oaicite:7]{index=7}
- **No `README.md` dentro de la carpeta del skill**  
  La documentación va en `SKILL.md` o en `references/`. :contentReference[oaicite:8]{index=8}

### Estructura recomendada
- `SKILL.md` (core)
- `references/` (docs largas, guías, patrones)
- `scripts/` (cuando necesitas determinismo)
- `assets/` (plantillas, iconos, etc.)

---

## 3) YAML frontmatter (lo más importante para “trigger”)

El **YAML frontmatter** determina si Claude decide cargar tu skill. Va arriba de `SKILL.md` entre `---`. :contentReference[oaicite:9]{index=9}

### Campos mínimos
- `name`: kebab-case
- `description`: la clave

### Regla de oro de `description`
Debe incluir:
1) **Qué hace** (scope / outcomes)
2) **Cuándo usarlo** (triggers / frases disparadoras)

Constraints relevantes:
- **máx 1024 caracteres**
- **no incluir `<` o `>`** (por seguridad / parsing) :contentReference[oaicite:10]{index=10}

#### Anti-ejemplo (vaga)
> “Ayuda con proyectos”

#### Ejemplo correcto (what + when + triggers)
> “Gestiona flujos de trabajo de proyectos en Linear: planificación de sprints, creación de tareas y seguimiento de estado. Usar cuando el usuario mencione ‘sprint’, ‘Linear’, ‘crear tickets’, ‘planificación de proyecto’ o pida organizar tareas.”

> Nota: tu `description` es el “producto” del skill. Si no está bien escrita, tendrás undertrigger o overtrigger.

---

## 4) Cuerpo de instrucciones en Markdown (procedimiento ejecutable)

El body de `SKILL.md` es donde “ganas la partida”: instrucciones claras, accionables y robustas. :contentReference[oaicite:11]{index=11}

### Best practices (operativas)
- **Especificidad accionable**  
  Mal: “Valida los datos”  
  Bien: “Ejecuta `python scripts/validate.py --input {filename}` y revisa el output.” :contentReference[oaicite:12]{index=12}
- **Ejemplos (1–3) de interacción**  
  “Usuario dice X → pasos → output Y”
- **Manejo de errores / Troubleshooting**  
  Qué hacer si falla un MCP, credenciales, rate limit, etc. :contentReference[oaicite:13]{index=13}
- **Referenciar recursos sin inflar tokens**  
  Documentación larga a `references/` y se consulta “solo si hace falta”. :contentReference[oaicite:14]{index=14}

---

## 5) Plantilla mínima recomendada de SKILL.md

```md
---
name: my-skill
description: "Qué hace + cuándo usarlo (triggers). Máx 1024 chars. Sin < ni >."
---

# Objetivo
- Outcome principal en 1–2 líneas

# Cuándo usar este skill
- Triggers (frases típicas del usuario)
- Casos que NO aplican (anti-triggers)

# Procedimiento
1) Paso 1 (accionable)
2) Paso 2
3) Paso 3

# Examples
## Example 1
- User: ...
- Assistant (using this skill): ...

# Troubleshooting
- Error A → acción
- Error B → acción

# References (opcional)
- Leer `references/...` cuando ...


## 6) Mermaid — Flujo “idea → skill triggerable”
```mermaid
flowchart TD
  A[Idea de skill] --> B[Define 2-3 casos de uso]
  B --> C[Elige categoría primaria<br/>Docs/Assets · Workflow · MCP enhancement]
  C --> D[Define éxito: output + done criteria]
  D --> E[Define triggers: frases del usuario]
  E --> F[Implementa estructura carpeta + SKILL.md]
  F --> G[Frontmatter YAML: name + description (what+when)]
  G --> H[Body: pasos accionables + ejemplos + troubleshooting]
  H --> I[Move long docs to references/]
  I --> J[Skill listo para testing del Módulo 03/04]    