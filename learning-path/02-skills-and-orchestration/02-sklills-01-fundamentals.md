---
title: "Bloque 02 · Skills — Módulo 01: Fundamentos"
source:
  - "The Complete Guide to Building Skills for Claude · Chapter 1 (Fundamentals)"
---

# Módulo 01 — Skills: Fundamentos (Notas finales)

Estas notas condensan el **Chapter 1: Fundamentals** de la guía oficial y lo alinean con el resumen de NotebookLM, dejando un mapa mental operativo para construir skills con cabeza. :contentReference[oaicite:0]{index=0}

---

## 1) ¿Qué es un Skill?

Un **Skill** es un **set de instrucciones empaquetado como una carpeta** que enseña a Claude a manejar **tareas o workflows específicos** de manera consistente. :contentReference[oaicite:1]{index=1}

**Por qué existen (valor real):**
- Evitan *re-explicar* tu proceso, preferencias y expertise en cada conversación.
- Dan consistencia en flujos repetibles (docs, research, diseño, procesos multi-step).
- Funcionan especialmente bien como “capa de conocimiento” encima de tool access (MCP). :contentReference[oaicite:2]{index=2}

**Señal de que necesitas un skill:**
- Lo haces más de 2–3 veces por semana/mes
- Hay pasos que siempre se repiten
- La calidad cae cuando el prompt cambia
- Quieres una “forma estándar” de operar (tú o un equipo)

---

## 2) Anatomía básica (estructura de carpeta)

Un skill es una carpeta con esta estructura base: :contentReference[oaicite:3]{index=3}

- `SKILL.md` **(obligatorio)**  
  Instrucciones en Markdown + YAML frontmatter.
- `scripts/` (opcional)  
  Código ejecutable (Python, Bash, etc.).
- `references/` (opcional)  
  Documentación que se carga **solo si hace falta**.
- `assets/` (opcional)  
  Templates, fuentes, iconos… recursos para el output.

> Regla mental: **SKILL.md = “el playbook”**; `references/` = “manuales anexos” (solo cuando toca); `scripts/` = “determinismo” (cuando el lenguaje puede fallar); `assets/` = “material de entrega”.

---

## 3) Los 3 principios core (lo que hace que funcione “bajo el capó”)

### 3.1 Progressive Disclosure (Divulgación progresiva)
Sistema de **3 niveles** para minimizar tokens sin perder especialización: :contentReference[oaicite:4]{index=4}

1) **Nivel 1 — YAML frontmatter**  
   Siempre cargado en el *system prompt*.  
   Contiene lo mínimo para decidir **cuándo** usar el skill.

2) **Nivel 2 — Cuerpo de `SKILL.md`**  
   Se carga cuando Claude decide que el skill es relevante.  
   Aquí van instrucciones completas y guidance.

3) **Nivel 3 — Archivos vinculados (`references/`, etc.)**  
   Claude navega esos recursos **solo si lo necesita** para el paso actual.

**Implicación práctica:**  
- El frontmatter es *disparador* (trigger).  
- El cuerpo es *procedimiento* (workflow).  
- Los references son *detalle* (solo bajo demanda). :contentReference[oaicite:5]{index=5}

---

### 3.2 Composability (Componibilidad)
Claude puede cargar **múltiples skills a la vez**, así que tu skill debe:
- ser “buen ciudadano”
- no asumir que es la única capacidad
- evitar pisar roles o imponer estilos globales sin necesidad :contentReference[oaicite:6]{index=6}

**Heurística:** escribe tus instrucciones como “si este skill está activo, aporta X y coordínate”, no como “a partir de ahora siempre…”

---

### 3.3 Portability (Portabilidad)
Un skill funciona **igual** en:
- Claude.ai
- Claude Code
- API

…siempre que el entorno soporte dependencias necesarias. :contentReference[oaicite:7]{index=7}

**Implicación práctica:** diseña una sola vez; despliegas en varias “superficies”.

---

## 4) Skills vs MCP (la analogía de la cocina)

Cuando conectas herramientas externas con MCP, la separación de responsabilidades es clave: :contentReference[oaicite:8]{index=8}

- **MCP = la cocina profesional (connectivity / tool access)**  
  Define *qué puede hacer* Claude (leer/escribir en Notion, Linear, etc.).

- **Skills = las recetas (knowledge / workflows)**  
  Definen *cómo debe hacerlo* para obtener un resultado útil y consistente.

### Por qué la combinación importa (impacto real)
**Sin skills** (solo MCP): :contentReference[oaicite:9]{index=9}  
- el usuario no sabe “qué hacer ahora”
- prompts inconsistentes → resultados inconsistentes
- tickets de soporte estilo “¿cómo hago X?”
- se culpa al conector cuando el problema es el workflow

**Con skills** (MCP + recipes): :contentReference[oaicite:10]{index=10}  
- workflows preconstruidos se activan cuando toca
- uso consistente de herramientas
- best practices embedidas
- curva de aprendizaje baja y valor rápido

---

## 5) Modelo mental final (en 6 líneas)

- **Skill = carpeta con instrucciones** para un workflow repetible. :contentReference[oaicite:11]{index=11}
- **Frontmatter decide el “cuándo”** (trigger).
- **Cuerpo decide el “cómo”** (procedimiento).
- **References decide el “detalle”** (solo si se necesita).
- **Componible**: funciona con otros skills.
- **Portable**: Claude.ai / Code / API.

---

## 6) Mermaid — Mapa conceptual del módulo

```mermaid
flowchart TD
  A[User request] --> B{Skill relevant?}
  B -->|No| Z[Default Claude behavior]
  B -->|Yes| C[Load Level 2: SKILL.md body]
  C --> D{Need extra context?}
  D -->|No| E[Execute workflow steps]
  D -->|Yes| F[Load Level 3: references/assets/scripts]
  F --> E
  E --> G[Output]

  subgraph PD[Progressive Disclosure]
    L1[Level 1: YAML frontmatter\n(always loaded)]
    L2[Level 2: SKILL.md body\n(loaded when relevant)]
    L3[Level 3: linked files\n(loaded as needed)]
    L1 --> L2 --> L3
  end

  subgraph MCPvsSkill[Skills + MCP]
    K[MCP = Kitchen\n(connectivity/tools)]
    R[Skill = Recipe\n(workflows/best practices)]
    K --> R
  end