# TEAM

Diseno del equipo: 1 agente conversacional + 6 skills procedimentales, y como se coordinan.

## Mapa del equipo

```
                    USUARIO (driver)
                         |
        +----------------+----------------+
        |                                 |
   hormozi-strategist              SKILL PIPELINE
   (subagente, conversacional)    (Claude lee y ejecuta inline)
   Consultoria estrategica         |
   Preguntas abiertas              context-curation       (BAJA)
   Frameworks Hormozi/Brunson      customer-mapping        (ALTA)
   NO participa en pipeline        offer-design            (ALTA)
                                   template-formatting     (BAJA-MEDIA)
                                   proposal-critique       (BAJA)
                                   qa-gate                 (NINGUNA)
```

## Agente

### hormozi-strategist

- **Archivo**: `.claude/agents/hormozi-strategist.md`
- **Invocacion**: `/agent hormozi-strategist` (spawna subagente)
- **Rol**: Consultor estrategico senior de negocio (Hormozi + Brunson + Valdo)
- **Persona**: Directo, practico, sin humo. Tono consultor senior.
- **Dominio**: Diseno de oferta, arquitectura de funnel, generacion de leads, validacion de producto, narrativa de ventas.
- **Cuando usar**: Preguntas abiertas de estrategia, aplicacion de frameworks, coaching de negocio.
- **NO para**: Ejecucion del pipeline de deals (usar skills directamente).

## Skills

Las skills son procedimientos. Claude los lee y ejecuta INLINE en la conversacion principal. NO se spawnan como subagentes.

| Skill | Archivo | Tipo | Interactividad |
|-------|---------|------|----------------|
| `context-curation` | `shared/skills/context-curation/SKILL.md` | extraccion | BAJA |
| `customer-mapping` | `shared/skills/customer-mapping/SKILL.md` | interpretativo | ALTA |
| `offer-design` | `shared/skills/offer-design/SKILL.md` | diseno | ALTA |
| `template-formatting` | `shared/skills/template-formatting/SKILL.md` | formato | BAJA-MEDIA |
| `proposal-critique` | `shared/skills/proposal-critique/SKILL.md` | diagnostico | BAJA |
| `qa-gate` | `shared/skills/qa-gate/SKILL.md` | validacion | NINGUNA |

### Como se ejecuta una skill

1. El usuario pide trabajo del pipeline (ej: "curar el contexto del deal Yanira")
2. Claude identifica la skill correcta via la tabla de routing (abajo)
3. Claude lee el `SKILL.md` correspondiente con el Read tool
4. Claude sigue el procedimiento descrito paso a paso en la misma conversacion
5. Skills de ALTA interactividad pausan para validacion del usuario entre bloques

**Por que inline y no subagente**: las skills de alta interactividad (customer-mapping, offer-design) necesitan multiples rondas de feedback con el usuario. Un subagente tiene contexto limitado y maxTurns. Ejecutar inline mantiene el contexto completo y permite la interaccion natural.

## Coordinacion

Las skills NO se llaman entre si. Se coordinan a traves de la carpeta del deal:

```
context-curation ──escribe──> 00-context/context-document.md
                                         |
customer-mapping ──lee────────────────────┘ ──escribe──> 01-customer-map/customer-map.md
                                                                   |
offer-design ──lee─────────────────────────────────────────────────┘ ──escribe──> 02-offer/offer-design.md
                                                                                            |
template-formatting ──lee───────────────────────────────────────────────────────────────────┘ ──escribe──> 03-proposal/proposal.md
                                                                                                                     |
proposal-critique ──lee──────────────────────────────────────────────────────────────────────────────────────────────┘ ──escribe──> 04-evaluation/proposal-critique.md
```

- Cada skill lee de la carpeta de la fase anterior
- Cada skill escribe en la carpeta de su propia fase
- El usuario decide cuando invocar la siguiente skill
- La carpeta `scratch/` almacena archivos de trabajo y reportes de QA

## Reglas de routing

| Si el usuario quiere... | Hacer |
|--------------------------|-------|
| Procesar transcripcion de cliente en contexto | Leer y ejecutar `shared/skills/context-curation/SKILL.md` |
| Interpretar contexto con frameworks Hormozi | Leer y ejecutar `shared/skills/customer-mapping/SKILL.md` |
| Disenar la oferta | Leer y ejecutar `shared/skills/offer-design/SKILL.md` |
| Crear propuesta formal | Leer y ejecutar `shared/skills/template-formatting/SKILL.md` |
| Evaluar calidad de propuesta | Leer y ejecutar `shared/skills/proposal-critique/SKILL.md` |
| Validar cualquier documento antes de cerrarlo | Leer y ejecutar `shared/skills/qa-gate/SKILL.md` |
| Hacer preguntas estrategicas de negocio | `/agent hormozi-strategist` (subagente) |

## Orquestacion: sin orquestador formal (decision de arquitectura)

**Decision**: No existe ni debe existir un orquestador automatico, estado-maquina ni workflow engine entre las skills. El usuario es el driver.

**Por que**:
- El proceso tiene un driver humano con intencion clara.
- La estructura de carpetas del deal ES la maquina de estados — comprobar que carpetas tienen documentos te dice donde estas.
- La coordinacion entre skills ya esta resuelta por los documentos compartidos en la carpeta del deal.
- Un orquestador rigido seria fragil ante el trabajo iterativo y conversacional que hacemos aqui.

**Como funciona el routing**:
Claude lee CLAUDE.md al inicio -> CLAUDE.md apunta a TEAM.md -> TEAM.md describe las skills, sus rutas y cuando usarlas -> cuando el usuario pide trabajo del pipeline, Claude lee el SKILL.md correspondiente y lo ejecuta inline. Para consultoria estrategica, Claude lanza el subagente hormozi-strategist via `/agent`.
