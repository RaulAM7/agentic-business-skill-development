# TEAM

Diseno del equipo de agentes y skills especializados, y como se coordinan.

## Mapa del equipo

```
                    USUARIO (driver)
                         |
        +----------------+----------------+
        |                                 |
   hormozi-strategist              SKILL PIPELINE
   (agente, conversacional)       (el usuario invoca directamente)
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
- **Rol**: Consultor estrategico senior de negocio (Hormozi + Brunson + Valdo)
- **Persona**: Directo, practico, sin humo. Tono consultor senior.
- **Dominio**: Diseno de oferta, arquitectura de funnel, generacion de leads, validacion de producto, narrativa de ventas.
- **Skills asociadas**: `proposal-critique` (puede invocarla cuando evalua propuestas)
- **Cuando usar**: Preguntas abiertas de estrategia, aplicacion de frameworks, coaching de negocio.
- **NO para**: Ejecucion del pipeline de deals (usar skills directamente).

## Skills

| Skill | Tipo | Interactividad | Input | Output |
|-------|------|----------------|-------|--------|
| `context-curation` | extraccion | BAJA | Materiales brutos en `00-context/raw/` | Documento de Contexto |
| `customer-mapping` | interpretativo | ALTA | Documento de Contexto | Customer Map |
| `offer-design` | diseno | ALTA | Contexto + Customer Map | Documento de Offer |
| `template-formatting` | formato | BAJA-MEDIA | Contexto + Offer | Documento de Proposal |
| `proposal-critique` | diagnostico | BAJA | Todos los documentos del deal | Critique Report |
| `qa-gate` | validacion | NINGUNA | Cualquier documento | Veredicto Pass/Fail |

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

| Si el usuario quiere... | Invocar |
|--------------------------|---------|
| Procesar transcripcion de cliente en contexto | `context-curation` |
| Interpretar contexto con frameworks Hormozi | `customer-mapping` |
| Disenar la oferta | `offer-design` |
| Crear propuesta formal | `template-formatting` |
| Evaluar calidad de propuesta | `proposal-critique` |
| Validar cualquier documento antes de cerrarlo | `qa-gate` |
| Hacer preguntas estrategicas de negocio | agente `hormozi-strategist` |

## Orquestacion: sin orquestador formal (decision de arquitectura)

**Decision**: No existe ni debe existir un orquestador automatico, estado-maquina ni workflow engine entre las skills. El usuario es el driver.

**Por que**:
- El proceso tiene un driver humano con intencion clara.
- La estructura de carpetas del deal ES la maquina de estados — comprobar que carpetas tienen documentos te dice donde estas.
- La coordinacion entre skills ya esta resuelta por los documentos compartidos en la carpeta del deal.
- Un orquestador rigido seria fragil ante el trabajo iterativo y conversacional que hacemos aqui.

**Como funciona el routing**:
Claude Code lee CLAUDE.md al inicio -> CLAUDE.md apunta a TEAM.md -> TEAM.md describe las skills, sus dominios y cuando usarlas -> las `description` de cada skill contienen los triggers -> Claude Code lanza la skill adecuada.
