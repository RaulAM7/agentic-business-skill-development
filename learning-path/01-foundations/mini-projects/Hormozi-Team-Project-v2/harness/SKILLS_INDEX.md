# SKILLS INDEX

Skills del Hormozi Team Project v2 para el pipeline de deals.

## Catalogo

| # | Skill | Archivo | Interactividad | Trigger |
|---|-------|---------|----------------|---------|
| 1 | context-curation | `.claude/agents/context-curation.md` | BAJA | El usuario tiene materiales brutos de cliente para procesar |
| 2 | customer-mapping | `.claude/agents/customer-mapping.md` | ALTA | Existe documento de contexto, necesita interpretacion Hormozi |
| 3 | offer-design | `.claude/agents/offer-design.md` | ALTA | Existe customer map, necesita disenar oferta |
| 4 | template-formatting | `.claude/agents/template-formatting.md` | BAJA-MEDIA | Existe oferta, necesita propuesta formal |
| 5 | proposal-critique | `.claude/agents/proposal-critique.md` | BAJA | Existe propuesta, necesita evaluacion de comprador |
| 6 | qa-gate | `.claude/agents/qa-gate.md` | NINGUNA | Cualquier documento necesita validacion antes de cierre |

## Agente (no es skill)

| Agente | Archivo | Trigger |
|--------|---------|---------|
| hormozi-strategist | `.claude/agents/hormozi-strategist.md` | Preguntas abiertas de estrategia de negocio |

## Grafo de dependencias

```
materiales brutos -> [context-curation] -> context-document
                                               |
                                               v
                                        [customer-mapping] -> customer-map
                                                                  |
                                                                  v
                                                           [offer-design] -> offer-design
                                                                                 |
                                                                                 v
                                                                          [template-formatting] -> proposal
                                                                                                      |
                                                                                                      v
                                                                                               [proposal-critique] -> critique
```

`[qa-gate]` se puede aplicar a CUALQUIER documento en cualquier fase.

`[hormozi-strategist]` es independiente — no forma parte del pipeline.

## Invocacion

Todas las skills se invocan via `/agent [nombre-skill]`.
El agente estrategico se invoca via `/agent hormozi-strategist`.
