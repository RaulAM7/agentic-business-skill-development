# Diseno de Interaccion Usuario — Hormozi Team Project v2

## Como funciona una sesion de trabajo

### Lo que hace el usuario
Abre una sesion nueva y dice algo como "vamos con el deal de Yanira", "quiero disenar la oferta", "donde lo dejamos", o "evalua esta propuesta".

### Lo que pasa por debajo

1. Claude lee `CLAUDE.md` -> lee `harness/TEAM.md` -> identifica la skill correcta
2. Lee la carpeta del deal (`deals/[NombreDeal]/`) -> identifica que documentos existen y en que fase esta el deal
3. Lee el `SKILL.md` correspondiente de `shared/skills/`
4. Ejecuta el procedimiento **inline** en la conversacion principal (no spawna subagente)
5. Para skills de ALTA interactividad (customer-mapping, offer-design): pausa entre bloques/fases para validacion del usuario
6. Produce los outputs en la carpeta del deal
7. Reporta que se hizo y cual es el siguiente paso

### El matiz clave: skills inline, no subagentes

Las 6 skills del pipeline se ejecutan en la misma conversacion. Esto importa porque:

- Customer-mapping necesita 6 rondas de validacion con el usuario
- Offer-design necesita 4 pausas para decisiones de diseno
- Un subagente tiene contexto limitado y turnos finitos — no puede hacer eso bien
- El usuario conversa, ajusta, redirige — todo en el mismo hilo

El unico subagente es `hormozi-strategist`, que se lanza con `/agent hormozi-strategist` para consultoria estrategica abierta (no pipeline).

## Frases que el sistema entiende

| Dices | El sistema hace |
|-------|-----------------|
| "vamos con el deal [nombre]" | Lee la carpeta del deal, identifica la fase actual, propone siguiente paso |
| "donde lo dejamos" / "como va el deal" | Lee la estructura del deal, reporta que documentos existen y cual es el siguiente |
| "tengo materiales nuevos del cliente" | Indica depositar en `deals/[nombre]/00-context/raw/`, sugiere ejecutar context-curation |
| "cura el contexto" / "procesa los materiales" | Lee y ejecuta `context-curation` SKILL.md |
| "mapea al customer" / "interpreta el contexto" | Lee y ejecuta `customer-mapping` SKILL.md (interactivo: 6 bloques con validacion) |
| "disena la oferta" / "vamos con la offer" | Lee y ejecuta `offer-design` SKILL.md (interactivo: 4 pausas de decision) |
| "formatea la propuesta" / "crea el proposal" | Lee y ejecuta `template-formatting` SKILL.md (2 gates obligatorios) |
| "evalua la propuesta" / "critica esto" | Lee y ejecuta `proposal-critique` SKILL.md |
| "valida este documento" / "QA gate" | Lee y ejecuta `qa-gate` SKILL.md |
| "no me convence esto" / "cambia [X]" | Ajusta el output de la skill activa segun feedback |
| "aprobado" / "siguiente" / "ok" | En skills interactivas: avanza al siguiente bloque/fase |
| "quiero consultoria estrategica" | Lanza `/agent hormozi-strategist` (subagente separado) |
| "aplica el Value Equation a esto" | Lanza `/agent hormozi-strategist` |

## Flujo tipico de un deal completo

```
1. Usuario deposita materiales en deals/NuevoDeal/00-context/raw/
   "tengo la transcripcion del cliente, procesa el contexto"
   └── Claude ejecuta context-curation inline
   └── Produce context-document.md + context-gaps.md
   └── "Contexto listo. Hay 2 gaps: [X]. Quieres mapear al customer o completar gaps primero?"

2. "mapea al customer"
   └── Claude ejecuta customer-mapping inline
   └── Presenta Avatar Dia 1 → usuario valida → Avatar Dia 90 → usuario valida → ...
   └── 6 bloques, cada uno con pausa para feedback
   └── "Customer Map completo. Variante 2 de promesa seleccionada. Listo para disenar oferta."

3. "disena la oferta"
   └── Claude ejecuta offer-design inline
   └── Presenta direccion estrategica → usuario valida → stack → usuario valida → ...
   └── 4 pausas de decision
   └── Auto-critica producida
   └── "Oferta lista. Score: 48/60. Areas de mejora: [X]. Quieres refinar o avanzar a propuesta?"

4. "crea la propuesta"
   └── Claude ejecuta template-formatting inline
   └── Batch de secciones 1-4.3 → GATE 1: metodologia → usuario aprueba
   └── Batch de secciones 4.4-8.1 → GATE 2: garantia + pricing → usuario aprueba
   └── "Propuesta lista. Quieres evaluarla?"

5. "evalua la propuesta"
   └── Claude ejecuta proposal-critique inline
   └── Produce diagnostico completo: scorecard, bottleneck checklist, fixes
   └── "Scored 7.2/10. 6 PASS, 2 PARTIAL, 1 FAIL. Top 3 fixes: [X]."

6. (opcional) "valida el documento de oferta"
   └── Claude ejecuta qa-gate inline
   └── "QA PASS. 18/18 checks pasados."
```

## Principio central

> **El usuario disena. Claude gestiona.**
>
> La complejidad procedimental la absorbe Claude; la atencion del usuario se reserva para las decisiones de negocio de alto valor (estrategia de oferta, estructura de planes, garantia, pricing).

## Como sabe Claude en que fase esta un deal

No hay STATE.md ni base de datos. La carpeta del deal ES el estado:

```
deals/NombreDeal/
  00-context/raw/           ← si tiene archivos: hay materiales
  00-context/context-document.md   ← si existe: contexto curado
  01-customer-map/customer-map.md  ← si existe: customer map hecho
  02-offer/offer-design.md         ← si existe: oferta disenada
  03-proposal/proposal.md          ← si existe: propuesta formateada
  04-evaluation/proposal-critique.md ← si existe: propuesta evaluada
  scratch/                          ← archivos de trabajo, QA, borradores
```

Claude lista la carpeta, ve que archivos existen, y sabe exactamente donde esta.

## Configuracion tipica

- El usuario tiene contexto del cliente (transcripciones, notas de discovery, emails)
- Claude Code abierto en el directorio del proyecto
- El usuario conversa en espanol o ingles — Claude responde en el mismo idioma
- Para skills interactivas: el usuario revisa cada bloque, da feedback, aprueba o redirige
- Para skills de baja interactividad: Claude produce el output y lo presenta para revision final
