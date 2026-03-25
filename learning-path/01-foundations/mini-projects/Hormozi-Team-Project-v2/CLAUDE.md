# Hormozi Team Project v2

Lee estos archivos en orden antes de empezar cualquier tarea:

1. `INTERACTION-DESIGN.md` — como interactua el usuario con el sistema
2. `harness/RULES.md` — restricciones siempre activas
3. `harness/TASKFLOW.md` — fases del workflow
4. `harness/TEAM.md` — diseno del equipo, roles y coordinacion
5. `harness/SKILLS_INDEX.md` — catalogo de skills disponibles

## Referencia rapida

- **Templates**: `shared/templates/` — solo lectura, nunca modificar
- **Conocimiento**: `shared/knowledge/` — 10 archivos de referencia canonica (Hormozi, Brunson, Valdo)
- **Referencias**: `shared/references/` — documentos extraidos reutilizables (rubrica, gates, checklist)
- **Deals**: `deals/[NombreDeal]/` — carpetas por cliente con estructura estandar
- **Skills**: `shared/skills/[nombre]/SKILL.md` — procedimientos. Claude los LEE y los ejecuta inline.
- **Agente**: `/agent hormozi-strategist` — unico subagente, consultoria estrategica (no pipeline)

## Arquitectura

1 agente conversacional + 6 skills (procedimientos inline):

```
AGENTE (subagente):
  hormozi-strategist  ->  .claude/agents/hormozi-strategist.md
                          Se invoca con /agent hormozi-strategist
                          Consultoria abierta. NO pipeline.

SKILLS (inline, no son subagentes):
  context-curation     ->  shared/skills/context-curation/SKILL.md
  customer-mapping     ->  shared/skills/customer-mapping/SKILL.md
  offer-design         ->  shared/skills/offer-design/SKILL.md
  template-formatting  ->  shared/skills/template-formatting/SKILL.md
  proposal-critique    ->  shared/skills/proposal-critique/SKILL.md
  qa-gate              ->  shared/skills/qa-gate/SKILL.md
```

## Como se ejecutan las skills

Las skills NO son subagentes. Son documentos procedimentales que Claude lee y ejecuta en la conversacion principal:

1. El usuario pide ejecutar una skill (ej: "ejecuta context-curation para el deal X")
2. Claude lee el SKILL.md correspondiente de `shared/skills/`
3. Claude sigue el procedimiento descrito en el SKILL.md paso a paso
4. Todo ocurre en la misma conversacion — critico para skills de ALTA interactividad

Esto es diferente de `/agent`, que spawna un subagente separado con su propio contexto.

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
