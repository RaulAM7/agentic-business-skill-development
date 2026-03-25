# TASKFLOW

Fases para procesar un deal de cliente. Completar cada fase antes de pasar a la siguiente.
El usuario dirige el flujo. No hay orquestacion automatica.

## 1. Seed

Depositar materiales brutos del cliente (transcripciones, notas, archivos de discovery) en:

```
deals/[NombreDeal]/00-context/raw/
```

## 2. Curate (Curar Contexto)

Leer materiales brutos y producir el Documento de Contexto.

- Skill: `shared/skills/context-curation/SKILL.md` (leer y ejecutar inline)
- Output: `deals/[NombreDeal]/00-context/context-document.md`
- Interactividad: BAJA
- Tambien produce: `deals/[NombreDeal]/scratch/context-gaps.md`

## 3. Map (Mapear Customer)

Transformar contexto curado en mapa de insights del cliente con logica Hormozi.
Interactivo — el usuario valida interpretaciones bloque a bloque.

- Skill: `shared/skills/customer-mapping/SKILL.md` (leer y ejecutar inline)
- Output: `deals/[NombreDeal]/01-customer-map/customer-map.md`
- Interactividad: ALTA
- Requiere: Documento de Contexto completo

## 4. Design (Disenar Offer)

Disenar oferta aplicando Value Equation. Interactivo — el usuario valida decisiones de diseno.

- Skill: `shared/skills/offer-design/SKILL.md` (leer y ejecutar inline)
- Output: `deals/[NombreDeal]/02-offer/offer-design.md`
- Interactividad: ALTA
- Tambien produce: `deals/[NombreDeal]/scratch/offer-self-critique.md`
- Requiere: Documento de Contexto + Customer Map

## 5. Format (Formatear Proposal)

Formalizar oferta en propuesta profesional de negocio.

- Skill: `shared/skills/template-formatting/SKILL.md` (leer y ejecutar inline)
- Output: `deals/[NombreDeal]/03-proposal/proposal.md`
- Interactividad: BAJA-MEDIA (2 gates obligatorios)
- Requiere: Documento de Contexto + Offer Design

## 6. Critique (Criticar Proposal) — opcional pero recomendado

Analizar propuesta desde perspectiva de comprador/negociador.

- Skill: `shared/skills/proposal-critique/SKILL.md` (leer y ejecutar inline)
- Output: `deals/[NombreDeal]/04-evaluation/proposal-critique.md`
- Interactividad: BAJA
- Requiere: Todos los documentos del deal

## 7. QA Gate — en cualquier fase

Validar cualquier documento antes de cerrarlo.

- Skill: `shared/skills/qa-gate/SKILL.md` (leer y ejecutar inline)
- Output: `deals/[NombreDeal]/scratch/qa-[tipo]-[fecha].md`
- Interactividad: NINGUNA

## Consultoria Estrategica (en cualquier momento)

Para preguntas abiertas de estrategia fuera del pipeline de deal.

- Agente: `/agent hormozi-strategist` (unico subagente, se invoca con /agent)
- No requiere output de archivo
- No forma parte del pipeline de documentos
