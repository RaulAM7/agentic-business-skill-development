# Hormozi Team Project v2

Sistema de diseno de ofertas y propuestas comerciales basado en frameworks de Alex Hormozi, Russell Brunson y metodologia INFUSE.

## Arquitectura

**1 agente + 6 skills.** El usuario dirige el flujo.

| Componente | Tipo | Interactividad | Proposito |
|------------|------|----------------|-----------|
| `hormozi-strategist` | Agente | Conversacional | Consultoria estrategica de negocio |
| `context-curation` | Skill | Baja | Extraer contexto factual de materiales brutos |
| `customer-mapping` | Skill | Alta | Interpretar contexto con logica Hormozi |
| `offer-design` | Skill | Alta | Disenar oferta Grand Slam |
| `template-formatting` | Skill | Baja-Media | Formalizar en propuesta de negocio |
| `proposal-critique` | Skill | Baja | Diagnostico desde perspectiva de comprador |
| `qa-gate` | Skill | Ninguna | Validar documentos antes de cierre |

## Quick Start

1. Depositar materiales del cliente en `deals/[NombreDeal]/00-context/raw/`
2. `/agent context-curation` — produce documento de contexto
3. `/agent customer-mapping` — produce customer map (interactivo)
4. `/agent offer-design` — produce diseno de oferta (interactivo)
5. `/agent template-formatting` — produce propuesta formal
6. `/agent proposal-critique` — diagnostico de la propuesta

Para preguntas estrategicas en cualquier momento: `/agent hormozi-strategist`

## Estructura del repo

```
Hormozi-Team-Project-v2/
  .claude/agents/           Skills y agente (invocables via /agent)
  harness/                  RULES, TASKFLOW, TEAM, SKILLS_INDEX
  shared/templates/         Templates de documentos (solo lectura)
  shared/knowledge/         Base de conocimiento (Hormozi, Brunson, Valdo)
  shared/references/        Documentos de referencia extraidos
  deals/                    Carpetas por cliente/deal
```

## Evolucion desde v1

v2 reemplaza la arquitectura de v1 (5 agentes, 0 skills) con un sistema basado en skills:
- Orquestador eliminado -> TEAM.md + usuario como driver
- 3 agentes de documentos eliminados -> 4 skills especializadas
- Customer Map como nuevo documento intermedio
- Proposal Critique como nueva capacidad
- QA Gate antes de cierre
- Harness layer (RULES, TASKFLOW, TEAM, SKILLS_INDEX)
