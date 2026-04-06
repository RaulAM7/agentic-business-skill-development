# Customer Map — Alonso Ventura Abogados

**Cliente**: Rafael Alonso Ventura
**Fuente**: Context Document (`00-context/context-document.md`)
**Fecha**: 2026-04-06

---

## 1. AVATAR DIA 1 — Quien es hoy el cliente

### Situacion actual

| Aspecto | Descripcion | Confianza |
|---------|-------------|-----------|
| **Negocio** | Despacho de abogados unipersonal en Las Palmas, servicios a empresas: conflictos societarios, contratos, derechos digitales, propiedad intelectual | `stated` |
| **Rol del cliente** | Abogado titular y unico tecnico. Todo el trabajo legal pasa por el. Su tiempo productivo ES el techo del negocio. | `stated` |
| **Equipo / recursos** | Ana (secretaria/admin) como unico apoyo. Ana gestiona leads, agenda, seguimiento, clientes existentes. No hay mas equipo ni plan inmediato de contratar. | `stated` |
| **Estado emocional** | Saturado pero no desesperado. Tiene clientes y facturacion, pero siente que el modelo actual no es sostenible con la paternidad inminente. La urgencia es de reorganizacion vital, no de supervivencia. | `inferred` |

### Lo que ha intentado

- **Google Ads + SEO + landing pages** — Genera leads, pero genericos y sin filtrado. No hay diferenciacion por tipo de servicio ni por perfil de cliente ideal. `stated`
- **Calendly integrado en la web** — Abandonado en la practica. Genera conflictos de agenda porque nadie lo supervisa. Crea mas problemas de los que resuelve. `stated`
- **elabogado.com (plataforma de posicionamiento)** — Leads pre-cualificados pero compartidos con competidores. Requiere velocidad de respuesta que el proceso manual no puede dar. `stated`
- **Protocolo martes/jueves para consultas** — Disenado para proteger dias productivos. No se cumple en la practica. `stated`

### Dolor nuclear (una frase)

> "Estoy perdiendo clientes que ya me buscaron, porque mi proceso de respuesta depende de una persona haciendo cosas a mano — y en el tiempo que tardamos, el cliente ya contrato con otro." `stated`

---

## 2. AVATAR DIA 90 — Quien quiere ser

### Estado deseado

- Rafael trabaja hasta las 4-5 de la tarde, dedicado exclusivamente a trabajo tecnico legal de alto valor (asesoramiento, conflictos societarios, igualas). `stated`
- Los leads nuevos reciben respuesta en minutos, sin intervencion humana. El pipeline de captacion funciona solo. `inferred`
- Ana ha dejado de ser ejecutora de tareas repetitivas y opera como supervisora del sistema: revisa logs, controla que todo funcione, gestiona excepciones y clientes existentes. `stated`
- El despacho solo atiende clientes por encima de un umbral minimo de ticket. Los leads de bajo valor se filtran automaticamente antes de llegar a Ana o a Rafael. `stated`
- Existe un funnel de captacion disenado para atraer y canalizar los tres nichos mas rentables (conflictos societarios, igualas, reclamaciones de cantidad), con la consulta de 100 EUR funcionando como tripwire estrategico que conduce a servicios de mayor valor. `inferred`

### Como se siente ese estado

- **Tranquilidad**: sabe que ningun lead se pierde por lentitud, y que el sistema filtra lo que no vale la pena. `inferred`
- **Control**: puede ser padre presente sin que el negocio dependa de su disponibilidad constante. `inferred`
- **Orgullo profesional**: trabaja menos horas pero con clientes que valoran y pagan su expertise. Deja de sentirse "caro" y empieza a sentirse "exclusivo". `hypothesis`

### Metricas observables

- Tiempo de primera respuesta a lead nuevo: minutos, no dias. `inferred`
- Jornada laboral de Rafael: termina a las 16-17h. `stated`
- Ticket medio de nuevos clientes: por encima del umbral definido (dato pendiente). `stated`
- Numero de igualas activas: mas de 1 (actualmente solo tiene 1 a 1.000 EUR/mes). `inferred`
- Tasa de no-shows en consultas: cercana a cero (pago anticipado de 100 EUR). `inferred`

---

## 3. OBSTACLE MAP — Obstaculos con peso estrategico

| # | Obstaculo | Peso (1-5) | Tipo | Confianza |
|---|-----------|-----------|------|-----------|
| 1 | **Velocidad de respuesta a leads depende de una persona manual** — Cada lead nuevo entra en una cola humana (Ana). En elabogado.com compite con otros abogados por el mismo lead; el primero que contacta gana. 2-3 dias de delay = lead perdido. | 5 | operativo | `stated` |
| 2 | **Ausencia de funnel y value ladder** — Invierte en trafico (Google Ads, SEO, elabogado.com) pero sin estructura de conversion. Los leads llegan genericos. No hay camino disenado para que un cliente de consulta puntual ascienda a iguala o servicio recurrente. Solo 1 iguala activa de ~100 posibles clientes. | 5 | estructural | `inferred` |
| 3 | **Sistema de agendamiento fragmentado** — Google Calendar + Calendly abandonado + Ana asignando a mano. Tres sistemas paralelos sin coordinacion. Genera conflictos, reprogramaciones y fricciones que deterioran la experiencia del cliente antes de que conozca a Rafael. | 4 | operativo | `stated` |
| 4 | **Ana como single point of failure** — Califica, agenda, hace seguimiento, gestiona clientes existentes, supervisa Calendly. Si Ana esta saturada o no disponible, todo se para. Su capacidad es el techo del pipeline. | 4 | estructural | `stated` |
| 5 | **Sin filtrado ni segmentacion de leads** — Todos los leads reciben el mismo trato. Clientes de ticket bajo consumen el mismo tiempo que los de ticket alto. La tarifa de 100 EUR filtra parcialmente pero se comunica tarde en el proceso (despues del contacto humano). | 3 | estructural | `stated` |

### Logica de priorizacion

Los dos obstaculos de peso 5 son los que mas impactan la Value Equation:

- **Obstaculo 1** (velocidad) ataca directamente el **Time Delay** — cada dia de retraso destruye la percepcion de valor y, peor, entrega el lead al competidor. Es el mas urgente porque tiene coste directo e inmediato.
- **Obstaculo 2** (funnel/value ladder) ataca el **Dream Outcome** y la **Perceived Likelihood** — sin estructura de ascenso, el negocio no puede cumplir la vision de "menos clientes, mas ticket". Es el mas importante estrategicamente porque sin el, resolver la velocidad solo produce mas clientes genericos mas rapido.

Los obstaculos 3 y 4 son operativos y derivados: se resuelven parcialmente al resolver los dos primeros (automatizar la entrada libera a Ana, centralizar el agendamiento elimina la fragmentacion).

El obstaculo 5 es de menor peso porque ya existe un filtro parcial (la tarifa de 100 EUR) y se resolveria naturalmente con un funnel bien disenado que cualifique antes del contacto humano.

---

## 4. BELIEF ARCHITECTURE — Arquitectura de creencias

### Big Domino

> "Si Rafael cree que un sistema automatizado de captacion + un funnel disenado estrategicamente pueden hacer en minutos lo que Ana hace en dias — y ademas dirigir los leads hacia sus servicios mas rentables — entonces contratar este servicio se vuelve obvio." `inferred`

### New Opportunity vs Opportunity Switch

**Tipo**: Opportunity Switch `inferred`

**Justificacion**: Rafael ya tiene un sistema de captacion (Ana + Ads + web + elabogado.com). No le estamos vendiendo algo que nunca ha visto — le estamos diciendo que su sistema actual tiene un techo estructural y que existe una forma mejor de hacer lo que ya intenta hacer. El switch es: de "proceso manual dependiente de Ana" a "sistema automatizado con diseno estrategico de funnel". La dimension de funnel/value ladder se acerca mas a New Opportunity (nunca lo ha tenido), pero el framing dominante es switch porque el cliente ya percibe que tiene un sistema — solo que no funciona bien.

### Creencias que habilitan la venta

- "El que contacte primero es el que se lleva al cliente." — Ya cree que la velocidad es el factor decisivo. Solo necesita un mecanismo que la garantice. `stated`
- "Quiero menos clientes pero con ticket mas alto." — Ya desea el resultado que un funnel bien disenado produce. No hay que convencerlo del destino, solo del vehiculo. `stated`
- "La tarifa de 100 EUR es un filtro de seriedad." — Ya piensa en terminos de cualificacion por compromiso economico. Tiene el instinto de tripwire sin conocer el concepto. `stated`
- "Quiero que Ana supervise, no que ejecute." — Ya visualiza el modelo operativo post-automatizacion. No hay resistencia a delegar en tecnologia. `stated`

### Creencias que bloquean la venta

- **"Habra clientes que no les gusta hablar con una IA."** — Miedo a la impersonalidad. Como abordarla: demostrar que la IA es primer contacto de triaje, no sustituto de la relacion. Las llamadas complejas se transfieren a humano en tiempo real. La IA no atiende clientes existentes. `stated`
- **"Intente cerrar una iguala hace poco pero es dificil — el cliente ve una cuota mensual muy alta."** — Cree que las igualas son dificiles de vender por naturaleza, no por falta de estructura de venta. Como abordarla: mostrar que el problema no es el precio de la iguala sino la ausencia de un value ladder que construya percepcion de valor antes de la propuesta de iguala. Un cliente que entra por consulta de 100 EUR, contrata un servicio puntual exitoso y recibe una propuesta de iguala contextualizada tiene una probabilidad de conversion radicalmente mayor que una propuesta en frio. `inferred`
- **"Por el momento no necesito contratar mas equipo."** — Puede interpretar la inversion en automatizacion + consultoria como "gasto innecesario si no estoy creciendo". Como abordarla: reframing — no es gasto de crecimiento, es inversion de liberacion. No necesita mas equipo precisamente porque el sistema sustituye la necesidad de contratar. `inferred`

---

## 5. VALUE EQUATION DIAGNOSIS — Diagnostico preliminar

| Factor | Estado actual | Oportunidad | Prioridad |
|--------|---------------|-------------|-----------|
| **Dream Outcome** | Claro en la cabeza de Rafael: menos horas, mas ticket, tiempo para su familia. Pero fragmentado — ve la automatizacion y el crecimiento de ticket como problemas separados, no como un sistema integrado. | Unificar la promesa: un solo sistema que resuelve velocidad + filtrado + ascenso de clientes. Cuando vea que es UNA solucion y no tres proyectos, el Dream Outcome se vuelve mucho mas atractivo. | **Alta** |
| **Perceived Likelihood** | Media-baja. Ha visto la demo del agente de voz y le gusto ("esta bastante bien"), pero no tiene evidencia de que el sistema completo funcione para un despacho de abogados. La iguala la ve como "dificil de cerrar" — no cree que tenga solucion sistematica. | Casos de exito en servicios profesionales. Mostrar el mecanismo (funnel + automatizacion) como algo probado, no experimental. La garantia sera critica aqui. | **Alta** |
| **Time Delay** | Espera resultados rapidos — ya piensa en terminos de "sobre la marcha", "inmediato". Pero no tiene expectativa definida de en cuantos dias/semanas el sistema estaria operativo. | Definir quick wins claros (ej: "en la primera semana ya tienes respuesta automatica a leads") y separar el time-to-first-result del time-to-full-deployment. Comprimir la percepcion de espera con hitos tempranos. | **Media** |
| **Effort & Sacrifice** | Preocupacion baja. Rafael no ha expresado miedo al esfuerzo de implementacion. Pero implicitamente espera que sea "plug and play" — que no le consuma el tiempo que esta intentando liberar. | Hacer explicito que el esfuerzo de implementacion recae en nosotros, no en el. Su unica inversion de tiempo son las sesiones de validacion/decision. Ana recibe formacion para supervisar, no para operar el sistema a mano. | **Media** |

### Recomendacion para offer design

La palanca mas potente esta en **Perceived Likelihood**. Rafael ya quiere el resultado (Dream Outcome claro) y no le preocupa el esfuerzo. Lo que le falta es creer que es posible — especialmente la parte de funnel/value ladder que nunca ha tenido. La oferta debe:

1. **Demostrar mecanismo**, no solo prometer resultado. Mostrar *como* funciona el sistema paso a paso para que la creencia sea "esto es ingenieria, no magia".
2. **Unificar la promesa** — que la automatizacion de captacion y el diseno de funnel/value ladder sean un solo paquete, no dos servicios separados. Esto amplifica el Dream Outcome.
3. **Incluir garantia fuerte** que absorba el riesgo percibido. Si la Perceived Likelihood es el cuello de botella, la garantia es el acelerador.

---

## 6. TRANSFORMATION PROMISE DRAFT — Borrador de promesa

### Variante 1 (outcome-focused) -- SELECCIONADA

> "De despacho donde la captacion depende de gestiones manuales, a despacho con sistema automatico que filtra, agenda y cobra en minutos — y un funnel disenado para que cada cliente nuevo tenga un camino hacia tus servicios de mayor valor. Primeros leads atendidos por el sistema en la semana 1."

### Variante 2 (pain-first)

> "Dejas de perder clientes porque Ana no llego a tiempo. Un sistema automatizado responde, cualifica y agenda por ti en minutos. Mientras, un funnel estrategico deja de atraer lo que sea y empieza a atraer lo que te conviene. Resultado: menos clientes, mas ticket, tardes libres."

### Variante 3 (identity-focused)

> "El sistema que convierte a un abogado que trabaja para su despacho en un abogado cuyo despacho trabaja para el — empezando por automatizar la captacion y terminando por disenar un modelo donde solo entran los clientes que valen tu tiempo."

---

## Completion Checklist

- [x] Bloque 1 (Avatar Dia 1) validado por usuario
- [x] Bloque 2 (Avatar Dia 90) validado por usuario
- [x] Bloque 3 (Obstacle Map) priorizado y validado por usuario
- [x] Bloque 4 (Belief Architecture) con Big Domino identificado y validado
- [x] Bloque 5 (Value Equation Diagnosis) completo
- [x] Bloque 6 (Transformation Promise) con variante 1 seleccionada por usuario
- [x] Todas las etiquetas de confianza (stated/inferred/hypothesis) presentes
- [x] No hay claims sin fuente en el Documento de Contexto
