# SKILLS INDEX

Skills del Hormozi Team Project v2 para el pipeline de deals.

Las skills son procedimientos en `shared/skills/[nombre]/SKILL.md`. Claude los lee y ejecuta inline — NO son subagentes.

## Catalogo

| # | Skill | Archivo | Interactividad | Trigger |
|---|-------|---------|----------------|---------|
| 1 | context-curation | `shared/skills/context-curation/SKILL.md` | BAJA | El usuario tiene materiales brutos de cliente para procesar |
| 2 | customer-mapping | `shared/skills/customer-mapping/SKILL.md` | ALTA | Existe documento de contexto, necesita interpretacion Hormozi |
| 3 | offer-design | `shared/skills/offer-design/SKILL.md` | ALTA | Existe customer map, necesita disenar oferta |
| 4 | template-formatting | `shared/skills/template-formatting/SKILL.md` | BAJA-MEDIA | Existe oferta, necesita propuesta formal |
| 5 | proposal-critique | `shared/skills/proposal-critique/SKILL.md` | BAJA | Existe propuesta, necesita evaluacion de comprador |
| 6 | qa-gate | `shared/skills/qa-gate/SKILL.md` | NINGUNA | Cualquier documento necesita validacion antes de cierre |

## Agente (unico subagente del proyecto)

| Agente | Archivo | Invocacion | Trigger |
|--------|---------|------------|---------|
| hormozi-strategist | `.claude/agents/hormozi-strategist.md` | `/agent hormozi-strategist` | Preguntas abiertas de estrategia de negocio |

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

## Ejecucion

**Skills (pipeline)**: Claude lee el SKILL.md y ejecuta el procedimiento inline en la conversacion principal. No se usa `/agent`.

**Agente (consultoria)**: se invoca con `/agent hormozi-strategist`. Spawna un subagente separado.
