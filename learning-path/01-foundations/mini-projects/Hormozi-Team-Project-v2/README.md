# Hormozi Team Project v2

Sistema de diseno de ofertas y propuestas comerciales basado en frameworks de Alex Hormozi, Russell Brunson y metodologia INFUSE.

## Arquitectura

**1 agente (subagente) + 6 skills (inline).** El usuario dirige el flujo.

| Componente | Tipo | Ubicacion | Invocacion |
|------------|------|-----------|------------|
| `hormozi-strategist` | Agente | `.claude/agents/hormozi-strategist.md` | `/agent hormozi-strategist` (subagente) |
| `context-curation` | Skill | `shared/skills/context-curation/SKILL.md` | Claude lee y ejecuta inline |
| `customer-mapping` | Skill | `shared/skills/customer-mapping/SKILL.md` | Claude lee y ejecuta inline |
| `offer-design` | Skill | `shared/skills/offer-design/SKILL.md` | Claude lee y ejecuta inline |
| `template-formatting` | Skill | `shared/skills/template-formatting/SKILL.md` | Claude lee y ejecuta inline |
| `proposal-critique` | Skill | `shared/skills/proposal-critique/SKILL.md` | Claude lee y ejecuta inline |
| `qa-gate` | Skill | `shared/skills/qa-gate/SKILL.md` | Claude lee y ejecuta inline |

**Diferencia clave**: Las skills NO son subagentes. Son procedimientos que Claude lee y ejecuta en la conversacion principal. Solo el agente estrategico se spawna como subagente separado.

## Quick Start

1. Depositar materiales del cliente en `deals/[NombreDeal]/00-context/raw/`
2. "Ejecuta context-curation para el deal X" — produce documento de contexto
3. "Ejecuta customer-mapping" — produce customer map (interactivo, valida por bloques)
4. "Ejecuta offer-design" — produce diseno de oferta (interactivo, valida en 4 puntos)
5. "Ejecuta template-formatting" — produce propuesta formal (2 gates obligatorios)
6. "Ejecuta proposal-critique" — diagnostico de la propuesta

Para consultoria estrategica en cualquier momento: `/agent hormozi-strategist`

## Estructura del repo

```
Hormozi-Team-Project-v2/
  .claude/agents/           Solo el agente (hormozi-strategist.md)
  harness/                  RULES, TASKFLOW, TEAM, SKILLS_INDEX
  shared/skills/            Skills como SKILL.md (procedimientos inline)
  shared/templates/         Templates de documentos (solo lectura)
  shared/knowledge/         Base de conocimiento (Hormozi, Brunson, Valdo)
  shared/references/        Documentos de referencia extraidos
  deals/                    Carpetas por cliente/deal
```

## Evolucion desde v1

v2 reemplaza la arquitectura de v1 (5 agentes, 0 skills) con un sistema basado en skills:
- Orquestador eliminado -> TEAM.md + usuario como driver
- 4 agentes de documentos eliminados -> 6 skills procedimentales (inline, no subagentes)
- Customer Map como nuevo documento intermedio
- Proposal Critique como nueva capacidad
- QA Gate antes de cierre
- Harness layer (RULES, TASKFLOW, TEAM, SKILLS_INDEX)
- Patron Skilland: agentes en `.claude/agents/`, skills en `shared/skills/`
