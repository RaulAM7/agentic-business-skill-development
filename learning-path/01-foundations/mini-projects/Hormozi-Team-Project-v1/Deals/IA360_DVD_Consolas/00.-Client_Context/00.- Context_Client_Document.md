# Context Document — DVD Consolas
<!-- SOURCE: Deals/IA360_DVD_Consolas/00.-Client_Context/NOTAS-DISCOVERY-FISICO.md -->

## Document Purpose
Este documento captura el contexto del cliente DVD Consolas (operación física) a partir de una única fuente de discovery, para habilitar `step2-offer` y `step3-proposal`.

---

## 1️⃣ Transcripción literal (destilada, en palabras del cliente)

⚠️ **Objetivo aquí**: capturar **cómo piensa**, **qué le duele** y **qué teme**, no resumir técnicamente.

### Cómo vive hoy su negocio

- "Cliente entra en tienda."
- "Se registra reparación en Divergest."
- "Se coloca físicamente en estantería de pendientes."
- "Técnico recoge cuando tiene hueco."
- "Repara o espera repuesto."

👉 **Insight clave**: El flujo base funciona, pero depende de pasos manuales y memoria operativa de personas concretas; esto crea variabilidad entre casos.

### Dolor principal (real)

- "Si cliente pregunta → se responde manualmente por WhatsApp."
- "Si está terminado → alguien tiene que: buscar teléfono, abrir WhatsApp, escribir mensaje manual, confirmar envío."
- "3h / semana" en mensajes, "12h / mes", "144h / año".

👉 **Insight clave**: El dolor no es "enviar mensajes"; es la interrupción continua del trabajo técnico y la pérdida de foco que degrada productividad.

### Miedos críticos

- "No hay histórico central."
- "Cliente recibe información distinta."
- "No hay trazabilidad clara."
- "A veces se quedan equipos meses acumulados porque falta repuesto y nadie avisa."

👉 **Insight clave**: El miedo central es reputacional y operativo: perder control del estado real de cada reparación y deteriorar confianza del cliente.

### Expectativas sobre la solución

- "Si falta repuesto → no siempre se comunica inmediatamente."
- "Si cliente pregunta → se responde manualmente por WhatsApp."
- "Con 400 reparaciones mensuales esto escala mal."

👉 **Insight clave**: La expectativa implícita es un sistema que sostenga volumen sin multiplicar fricción humana, con comunicación consistente y trazable.

**GAP DE EVIDENCIA**: La fuente no trae peticiones explícitas tipo "quiero X" o "no quiero Y" del cliente en primera persona.

### Visión de futuro

- "Con 400 reparaciones mensuales esto escala mal."
- "288 servicios adicionales anuales" potenciales con recordatorios.
- "544 horas anuales" en fricción operativa.
- "Un técnico trabaja casi 3 meses al año en fricción operativa."

👉 **Insight clave**: La visión implícita es escalar volumen y recurrencia sin contratar al mismo ritmo, recuperando horas productivas para trabajo técnico de valor.

**GAP DE EVIDENCIA**: No hay declaración explícita de horizonte temporal ni meta verbalizada en formato Day 90 por parte del cliente.

---

## 2️⃣ Problemas reales (no soluciones, no features)

Aquí destilamos **los problemas estructurales**, no lo que el cliente "cree que necesita".

### Problema 1 — Comunicación de estado manual e interruptiva

Cada actualización de reparación requiere:
- Buscar datos de contacto manualmente.
- Redactar y enviar mensajes uno a uno.
- Confirmar envío y retomar contexto técnico.

El coste es temporal y cognitivo (interrupciones + cambios de foco).

👉 **Problema raíz**: *la comunicación operacional no está integrada al flujo de reparación y depende de acciones manuales por evento*.

### Problema 2 — Falta de visibilidad de estado para cliente

Manifestaciones:
- El cliente no sabe si el equipo está en diagnóstico, repuesto, reparación o terminado.
- Aumentan llamadas y mensajes de seguimiento.
- Se instala la sensación de "no me están diciendo nada".

El coste es reputacional y de experiencia de cliente.

👉 **Problema raíz**: *no existe un mecanismo estándar y proactivo de estado por hito*.

### Problema 3 — Operación multi-WhatsApp sin sistema único

Dependencia extrema de:
- Un número principal y dos números adicionales.
- Conversaciones repartidas entre personas.
- Contexto que no queda centralizado.

Si cambia el interlocutor interno, la respuesta al cliente se vuelve inconsistente.

👉 **Problema raíz**: *la memoria de relación con cliente vive distribuida en chats y personas, no en un historial unificado*.

### Problema 4 — Búsqueda de repuestos artesanal y no estandarizada

Manifestaciones:
- Comparación manual en varios proveedores por cada caso.
- 5-10 minutos por búsqueda, repetidos varias veces al día.
- Consumo estimado de 200+ horas/año.

El coste es temporal y de throughput del taller.

👉 **Problema raíz**: *no existe un proceso asistido para consulta y comparación rápida de repuestos*.

### Problema 5 — Pérdida de recurrencia por ausencia de recordatorios

Manifestaciones:
- Se recomienda mantenimiento anual, pero no se activa recordatorio sistemático.
- Oportunidad no capturada de servicios repetidos.
- Fuga de ingresos previsibles por falta de seguimiento post-servicio.

El coste es comercial (LTV infraexplotado).

👉 **Problema raíz**: *el negocio carece de un ciclo postventa automatizado con disparadores por fecha/servicio*.

---

## 3️⃣ Requisitos funcionales (destilados a nivel estratégico)

No a nivel técnico todavía, sino **qué debe ser verdad para que esto funcione**.

### MUST — Imprescindibles

- Estado de reparación trazable por ticket/cliente (diagnóstico, repuesto, reparación, terminado).
- Comunicación de hitos al cliente integrada al flujo operativo (no dependiente de memoria individual).
- Historial único de conversaciones y acciones por cliente/equipo.
- Reducción explícita de interrupciones al técnico durante reparación.
- Proceso consistente para no dejar casos sin aviso cuando falta repuesto.
- Base mínima de control para soportar volumen cercano a 400 reparaciones/mes.

### SHOULD — Muy importantes

- Flujo asistido para búsqueda/comparativa de repuestos con menos pasos manuales.
- Recordatorios de mantenimiento con lógica periódica.
- Estandarización de respuestas para FAQs recurrentes (horario, ubicación, tipos de reparación, precios orientativos).
- Métricas operativas visibles (horas recuperadas, tiempos de respuesta, backlog por estado).

### COULD — Deseables

- Vista externa de estado para cliente (consulta autónoma).
- Segmentación de recordatorios por tipo de equipo/servicio.
- Alertas internas de riesgo (casos estancados, demoras por repuesto).

---

## 4️⃣ Creencias profundas del cliente (oro puro para la offer)

Esto es **material directo para copy, promesa y Big Domino** después.

### Creencias explícitas

- "Si cliente pregunta → se responde manualmente por WhatsApp."
- "No hay histórico central."
- "Con 400 reparaciones mensuales esto escala mal."
- "Este es el mayor cuello de botella invisible."
- "A veces se quedan equipos meses acumulados porque falta repuesto y nadie avisa."

### Creencias implícitas

- La calidad de atención depende de mantener contexto y consistencia, no solo de reparar bien.
- El coste principal no es solo tiempo total, sino la fragmentación del foco técnico.
- Escalar sin sistema aumenta riesgo de errores y pérdida de confianza del cliente.
- La recurrencia post-servicio es palanca real de crecimiento si se sistematiza.

---

## 5️⃣ Resultado deseado real (Day 90 implícito)

Aunque no lo dice así, **esto es lo que realmente quiere**:

- Operar con visibilidad clara del estado de cada reparación sin perseguir información manualmente.
- Mantener comunicación proactiva y consistente con cliente, reduciendo llamadas/mensajes reactivos.
- Recuperar horas de técnico hoy consumidas en fricción operativa y tareas repetitivas.
- Evitar acumulaciones silenciosas de casos por falta de repuesto o falta de aviso.
- Activar recurrencia de mantenimiento con seguimiento post-servicio sistemático.

👉 **Transformación deseada**:

**De** operación artesanal con memoria distribuida, multitarea interruptiva y trazabilidad débil **→ a** operación estandarizada con estado visible, comunicación consistente y control de escala.

---

## Completion Checklist

- [ ] Section 1 includes minimum 3 direct client quotes per subsection.
- [x] Client voice is preserved with verbatim quotes from source material.
- [x] Section 2 identifies 3+ structural problems with root causes.
- [x] Section 3 categorizes requirements into MUST/SHOULD/COULD.
- [x] Section 4 captures explicit and implicit beliefs.
- [x] Section 5 articulates transformation (From → To).
- [x] Insights (👉) synthesize structural meaning.
- [x] Source is documented (single-source synthesis).

**Nota de validación**: El único criterio incompleto es densidad de citas por subsección en Sección 1. Se requiere una segunda fuente (transcripción literal de discovery o entrevista) para cerrar el estándar estricto del agente.
