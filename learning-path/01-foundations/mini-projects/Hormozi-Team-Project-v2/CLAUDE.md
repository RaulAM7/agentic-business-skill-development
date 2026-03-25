# Hormozi Team Project v2

Lee estos archivos en orden antes de empezar cualquier tarea:

1. `harness/RULES.md` — restricciones siempre activas
2. `harness/TASKFLOW.md` — fases del workflow
3. `harness/TEAM.md` — diseno del equipo, roles y coordinacion
4. `harness/SKILLS_INDEX.md` — catalogo de skills disponibles

## Referencia rapida

- **Templates**: `shared/templates/` — solo lectura, nunca modificar
- **Conocimiento**: `shared/knowledge/` — 10 archivos de referencia canonica (Hormozi, Brunson, Valdo)
- **Referencias**: `shared/references/` — documentos extraidos reutilizables (rubrica, gates, checklist)
- **Deals**: `deals/[NombreDeal]/` — carpetas por cliente con estructura estandar
- **Skills**: `.claude/agents/` — invocar via `/agent [nombre-skill]`
- **Agente**: `/agent hormozi-strategist` — consultoria estrategica (no pipeline)

## Arquitectura

1 agente (consultoria estrategica) + 6 skills (pipeline de deals):

```
context-curation -> customer-mapping -> offer-design -> template-formatting -> proposal-critique
```

Cada skill lee del output de la anterior. El usuario dirige el flujo. No hay orquestador.

## Estructura de deals

```
deals/[NombreDeal]/
  00-context/raw/          <- materiales brutos
  00-context/              <- documento de contexto
  01-customer-map/         <- mapa de customer
  02-offer/                <- diseno de oferta
  03-proposal/             <- propuesta formal
  04-evaluation/           <- critica de propuesta
  scratch/                 <- archivos de trabajo, QA, borradores
```

## Reglas clave

- Cadena documental estricta: Contexto -> Customer Map -> Offer -> Proposal -> Critique
- Skills interactivas (customer-mapping, offer-design) pausan para validacion del usuario
- Todo claim interpretativo lleva etiqueta: `stated`, `inferred`, `hypothesis`
- QA gate antes de declarar cualquier documento completo
- No inventar hechos ni citas — marcar como `Unknown`
- Knowledge files son referencia canonica — leer antes de generar
