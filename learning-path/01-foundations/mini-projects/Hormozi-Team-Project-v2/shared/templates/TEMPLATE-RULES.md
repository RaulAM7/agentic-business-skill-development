# Template Rules and Conventions v2

## Purpose

Reglas, convenciones y gates de validacion para los 5 templates del Hormozi Team Project v2.

---

## Templates

| # | Template | Archivo | Proposito |
|---|----------|---------|-----------|
| 0 | Context Client | `00-context-client.md` | Extraccion factual del contexto del cliente |
| 1 | Customer Map | `01-customer-map.md` | Mapa interpretativo con logica Hormozi (NEW) |
| 2 | Offer Design | `02-offer-design.md` | Diseno de oferta Grand Slam |
| 3 | Proposal | `03-proposal.md` | Propuesta formal de negocio |
| 4 | Proposal Critique | `04-proposal-critique.md` | Diagnostico desde perspectiva de comprador (NEW) |

---

## Document Naming Conventions

### Production Documents

```
deals/[NombreDeal]/[stage]/[nombre-documento].md
```

**Examples:**
- `deals/IA360_Yanira_Leyva/00-context/context-document.md`
- `deals/IA360_Yanira_Leyva/01-customer-map/customer-map.md`
- `deals/IA360_Yanira_Leyva/02-offer/offer-design.md`
- `deals/IA360_Yanira_Leyva/03-proposal/proposal.md`
- `deals/IA360_Yanira_Leyva/04-evaluation/proposal-critique.md`

**Versiones:**
- `offer-design-v2.md`, `proposal-v3.md` si se revisa

**Deal naming:**
- `[CodigoEmpresa]_[NombreCliente]`: `IA360_Yanira_Leyva`

---

## Formatting Standards

### Emoji Markers

Preservar exactamente como aparecen en templates:

| Emoji | Significado | Uso |
|-------|-------------|-----|
| 1-5 | Numeros de seccion | Headers principales en Context Document |
| 🚀 | Launch/Offer | Titulo de oferta |
| 🔵 | Plan 1/Foundation | Tier fundacional |
| 🟢 | Plan 2/Intelligence | Tier avanzado |
| 🔴 | Plan 3/Premium | Tier premium (opcional) |
| 🔒 | Garantia | Seccion de garantia |
| 👉 | Insight/Key Point | Insights sintetizados |

### Section Numbering

- **Context**: Emoji numbers (`## 1 Section Name`)
- **Customer Map**: Standard numbers (`## 1.`, `## 2.`)
- **Offer**: Numeric prefixes (`## 00.`, `## 0.`, `## 1.`)
- **Proposal**: Standard decimal (`## 1.`, `### 3.1.`)
- **Critique**: Letters (`## A)`, `## B)`)

### Tables, Quotes, Emphasis

- Tables: Markdown pipe syntax, `---` separator
- Client quotes: Standard double quotes `"text"`
- Bold: `**text**` para conceptos clave
- Italic: `*text*` para causas raiz

---

## Confidence Tags (nuevo en v2)

En documentos interpretativos (Customer Map, Offer Design):

| Tag | Significado |
|-----|-------------|
| `stated` | El cliente lo dijo explicitamente (cita del contexto) |
| `inferred` | Derivado logicamente de lo que dijo |
| `hypothesis` | Plausible pero sin confirmar |

Para offer-design, las decisiones de diseno usan:

| Tag | Significado |
|-----|-------------|
| `grounded` | Basado directamente en el customer map |
| `proposed` | Recomendacion de la skill |

---

## Placeholder System

```markdown
[PLACEHOLDER: Descripcion de que va aqui]
```

- `PLACEHOLDER` siempre en mayusculas
- Siempre incluir dos puntos despues
- Nunca dejar placeholders en documentos de produccion

---

## Validation Gates

### Resumen de gates por documento

| Documento | Gate | Tipo |
|-----------|------|------|
| Context | Min 3 quotes por subseccion, min 3 problemas estructurales | Automatico |
| Context | Aprobacion antes de Customer Map | Usuario |
| Customer Map | Validacion despues de cada bloque (6 bloques) | Usuario (interactivo) |
| Offer | Self-critique con scoring rubric | Automatico + usuario |
| Proposal | **GATE 1**: Metodologia (despues de 4.3) | Usuario (obligatorio) |
| Proposal | **GATE 2**: Garantia + Pricing (en 8.1) | Usuario (obligatorio) |
| Critique | Sin gates (diagnostico) | — |

### Gates obligatorios de Proposal

Ver `shared/references/validation-gates.md` para definicion completa.

---

## Dependency Chain

```
Context Document (sin prerequisitos)
    |
    v
Customer Map (requiere Context) -- NEW
    |
    v
Offer Design (requiere Context + Customer Map)
    |
    v
Proposal (requiere Context + Offer)
    |
    v
Proposal Critique (requiere todos)
```

Nunca saltar documentos en la cadena.

---

## Prohibited Actions

### Para skills usando templates

**NO:**
- Inventar citas o datos del cliente
- Saltar validation gates
- Modificar templates (son solo lectura)
- Crear documentos fuera de orden
- Dejar placeholders en produccion
- Incluir metadata interna en entregables al cliente (Proposal)

**SI:**
- Leer templates antes de producir documentos
- Reemplazar todos los placeholders con contenido real
- Preservar emoji markers y estructura
- Solicitar aprobacion en gates
- Referenciar documentos fuente con trazabilidad
- Producir gap report (Context) y self-critique (Offer)

---

## Quality Checklist

### Todos los documentos
- [ ] Todos los placeholders reemplazados
- [ ] Emoji markers preservados
- [ ] Tablas bien formateadas
- [ ] Numeracion de secciones correcta
- [ ] Archivo nombrado segun convencion
- [ ] Guardado en la carpeta correcta del deal

### Context Document
- [ ] Min 3 quotes por subseccion
- [ ] Min 3 problemas estructurales
- [ ] Gap report producido en scratch/

### Customer Map (nuevo)
- [ ] 6 bloques completos
- [ ] Todos los claims con tag de confianza
- [ ] Transformation Promise con variante seleccionada

### Offer Design
- [ ] 12 secciones completas
- [ ] Self-critique con scoring producida en scratch/
- [ ] Todos los planes diferenciados

### Proposal
- [ ] Gate 1 (Metodologia) aprobado
- [ ] Gate 2 (Garantia + Pricing) aprobado
- [ ] Sin metadata interna en output final
- [ ] Pricing completo (ningun MISSING)

### Proposal Critique
- [ ] Scorecard con 10 criterios puntuados
- [ ] Bottleneck Checklist (9 checks)
- [ ] Improvement Playbook con fixes ordenados por leverage
- [ ] Translation Check (fidelidad offer-to-proposal)
