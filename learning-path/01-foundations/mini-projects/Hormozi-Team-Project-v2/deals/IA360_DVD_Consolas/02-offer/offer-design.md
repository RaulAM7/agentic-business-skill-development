# Offer Design — DVD Consolas

---

## 00. ONE SENTENCE PITCH

**Version pain-first (seleccionada):**

"Dejas de depender de que alguien se acuerde de avisar. Cada cambio de estado se comunica solo, con tono humano. Primeros avisos automaticos funcionando en la primera semana. Despues, ese mismo canal empieza a venderte mantenimientos y servicios sin que tengas que perseguir a nadie."

---

## 0. NOMBRE DEL PROYECTO / IDEA INICIAL

| Campo | Definicion |
|-------|------------|
| **Nombre del sistema** | Atencion DVD `proposed` |
| **Subtitulo** | Tu nuevo empleado de atencion al cliente — entrenado para tu negocio, con tu tono, con memoria de cada cliente |
| **Primer departamento** | Atencion al cliente y comunicacion |
| **Tipo de proyecto** | Sistema de atencion inteligente + canal comercial (DFY) |
| **Rol de la IA** | Empleado digital de atencion al cliente. No es protagonista tecnologico — es un compañero mas del equipo que nunca olvida, nunca se cansa y suena como vosotros `proposed` |
| **Vision a largo plazo** | Extension a Ambito B (busqueda de repuestos, facturacion, gestion de stock) en fases posteriores `proposed` |

---

## 1. AVATAR DIA 1 — Situacion actual

| **Aspecto** | **Descripcion** |
|-------------|------------------|
| **Quien es hoy el cliente** | - Taller de reparacion de consolas (PlayStation, Xbox), PC y moviles. 100 reparaciones/semana, ~400/mes `stated`<br>- Una tienda fisica. Cerro otra previamente — esta en fase de consolidacion `stated`<br>- 4 tecnicos. ERP Divergest. 3 numeros de WhatsApp descoordinados `stated` |
| **Que siente** | - Saturacion cronica: "siempre se les quedan cosas pendientes" `stated`<br>- Desgaste por microtareas manuales que no paran `inferred`<br>- Sensacion de que la operativa le resta aire para crecer `inferred`<br>- Quiere liberarse: "estaria mucho mas liberado" `stated` |
| **Que intenta** | - ERP Divergest: registra reparaciones pero no comunica nada al cliente `stated`<br>- 3 numeros de WhatsApp: intento de repartir carga que genero fragmentacion `stated`<br>- Respuesta manual caso a caso: el flujo por defecto, 3h/semana solo en mensajes `inferred` |
| **Que le duele de verdad** | - **Demasiadas cosas dependen de que alguien se acuerde** `inferred`<br>- Equipos acumulados meses porque nadie aviso al cliente `stated`<br>- 544h/año en friccion operativa (WhatsApp + llamadas + busquedas + facturacion) `stated`<br>- El cliente esta a ciegas y cuando la cadena falla, llama enfadado `stated` |

---

## 2. OBSTACULOS PRINCIPALES

**Toda comunicacion depende de memoria humana** (peso 5, estructural) — No hay trigger automatico. Cada aviso, seguimiento y recordatorio requiere que alguien se acuerde y actue. Es la raiz de casi todos los demas problemas. `inferred`

**El cliente esta completamente a ciegas** (peso 5, operativo) — No hay forma de saber el estado de la reparacion sin preguntar. Genera dependencia bidireccional y amplifica toda friccion comunicativa. `stated`

**Miedo a deshumanizar la relacion con el cliente** (peso 4, emocional) — No bloquea la operativa, bloquea la decision de compra. Si suena robotico, lo rechaza. `stated`

**Canales de comunicacion fragmentados** (peso 3, estructural) — 3 numeros de WhatsApp sin historico central. Informacion inconsistente, sin trazabilidad. `stated`

**Interrupciones repetitivas de bajo valor** (peso 3, operativo) — Llamadas y mensajes con preguntas basicas que drenan 120h/año y rompen concentracion. `stated`

**No existe infraestructura de activacion comercial** (peso 3, estructural) — Sin forma sistematica de comunicar con clientes existentes para upsells, campañas o reactivacion. `hypothesis`

---

## 3. DREAM OUTCOME — Avatar Dia 90 (Transformacion)

### Resultado final claro

DVD Consolas opera con un sistema de atencion al cliente inteligente, entrenado especificamente para su negocio, que:

- Comunica automaticamente cada cambio de estado de reparacion al cliente, con tono humano `grounded`
- Responde al momento cuando el cliente pregunta por su reparacion (consulta a base de datos, fotos, presupuesto) `grounded`
- Conoce los procesos, servicios y politicas de DVD Consolas como un empleado mas `grounded`
- Recuerda el historico de cada cliente y lo usa para personalizar la atencion `grounded`
- Activa recurrencia comercial (mantenimientos, upsells, campañas) sin esfuerzo manual `grounded`

Todo **sin perder la cercania humana que define al negocio**.

### Como se siente ese estado

- **Liberado.** La palabra del propio cliente. Menos carga mental, menos tareas pendientes. `stated`
- **Con control.** Nada se queda sin mover ni sin comunicar. `inferred`
- **Con aire para crecer.** La operativa de atencion no le consume el tiempo que necesita para consolidar la tienda. `inferred`
- **Con capacidad comercial nueva.** El canal que antes solo era reactivo ahora genera ingresos adicionales. `hypothesis`

### Que cambia en el dia a dia

- Ya nadie tiene que buscar telefonos, abrir WhatsApp ni escribir mensajes de estado `grounded`
- El cliente pregunta y recibe respuesta al momento, sin que un tecnico se interrumpa `grounded`
- Las llamadas de "donde esta mi consola" desaparecen — la IA ya informo o responde en el acto `grounded`
- Los recordatorios de mantenimiento salen solos al cabo de un año `grounded`
- Un solo numero de WhatsApp, una sola voz, historico completo por cliente `grounded`

### Metrica observable

- Horas semanales en WhatsApp manual: de 3h a ~0 `inferred`
- Llamadas repetitivas de bajo valor: reduccion significativa `inferred`
- Equipos olvidados sin comunicar: cero `hypothesis`
- Primeros ingresos recurrentes por reactivacion de clientes existentes `hypothesis`

---

## 4. TABLA RESUMEN — Problema → Solucion

| PROBLEMA REAL | COMO LO SOLUCIONA LA OFFER |
|---------------|----------------------------|
| Toda comunicacion depende de memoria humana (144h/año en WhatsApp) | Triggers automaticos: cambio de estado interno → mensaje al cliente sin intervencion humana |
| Cliente completamente a ciegas sobre su reparacion | El cliente pregunta por WhatsApp/llamada y la IA consulta base de datos y responde al momento con estado, fotos y presupuesto |
| Miedo a que la automatizacion suene robotica y fria | IA entrenada especificamente para DVD Consolas: conoce procesos, tono, tiene memoria por cliente. No es generica — es su empleada. + Validacion de tono con aprobacion antes de activar |
| 3 numeros de WhatsApp sin historico ni trazabilidad | Unificacion en un canal central con historico, trazabilidad e identidad del equipo |
| Llamadas repetitivas de bajo valor (120h/año) | FAQ automatizado + IA entrenada que responde con conocimiento real del negocio |
| Recurrencia comercial desaprovechada (288 servicios potenciales/año) | Recordatorios automaticos de mantenimiento + campañas de reactivacion y upsell configuradas |

---

## 5. STACK INTELIGENTE DE LA OFFER

### Capa 1 — Infraestructura de comunicacion (Foundation)

Resuelve obstaculos #1 (memoria), #4 (fragmentacion):

- Unificacion de WhatsApp en un canal central con plataforma (un numero, trazabilidad, historico) `grounded`
- Configuracion de estados de reparacion vinculados a triggers de mensaje automatico `grounded`
- Mensajes automaticos por hito: recibido, en diagnostico, pendiente de repuesto, en reparacion, terminado, listo para recoger `grounded`
- Entrenamiento y humanizacion de la IA: se entrena especificamente para DVD Consolas — conoce procesos, catalogo, politicas, tono. Es SU empleada, no una IA generica `grounded`
- Memoria por cliente: la IA recuerda reparaciones previas, preferencias y conversaciones anteriores de cada cliente `proposed`
- Validacion de tono humano: cada mensaje se redacta, se revisa con el cliente y se aprueba antes de activar `grounded`
- Historico centralizado de conversaciones `grounded`

### Capa 2 — Visibilidad e inteligencia (Intelligence)

Resuelve obstaculos #2 (cliente a ciegas), #5 (interrupciones):

- Visibilidad via WhatsApp/llamada: el cliente pregunta por su reparacion y la IA consulta el estado en base de datos y responde al momento, con fotos y presupuesto si los hay `grounded`
- FAQ automatizado para preguntas basicas: horario, ubicacion, servicios disponibles `grounded`
- Recordatorios automaticos de mantenimiento al cabo de un año `grounded`
- Alertas internas cuando una reparacion lleva demasiado tiempo sin movimiento `proposed`

### Capa 3 — Activacion comercial (Growth) — incluida en precio

Resuelve obstaculo #6 (sin infraestructura comercial):

- Mini consultoria de ventas: sesion de planificacion de como usar el canal para facturar mas `proposed`
- Diseno de secuencias comerciales: post-reparacion, estacionales, reactivacion de dormidos `proposed`
- Configuracion de las primeras campañas automaticas listas para disparar `proposed`

> Esta capa se presenta como incluida en el precio total. No es una linea separada. Es lo que se lleva de regalo por confiar en nosotros. No negociable por separado.

---

## 6. ARQUITECTURA DE LA OFFER (Plan unico)

### Plan unico — "Tu equipo deja de perseguir, tu cliente nunca esta a ciegas y tu canal te factura"

*El sistema completo de atencion al cliente automatizada, humanizada y con capacidad comercial.*

#### Que ES

La infraestructura completa de comunicacion inteligente para DVD Consolas. Una IA entrenada especificamente para el negocio que gestiona la atencion al cliente, las notificaciones automaticas y la activacion comercial — todo con tono humano, todo desde un solo canal.

No es un plan "basico" ni un MVP. Es **el sistema completo** para el Ambito A (atencion y relacion con el cliente).

#### Que hace

- Unificacion de WhatsApp en un canal central (un numero, historico, trazabilidad)
- IA entrenada especificamente para DVD Consolas (procesos, tono, catalogo, politicas)
- Memoria por cliente (reparaciones previas, preferencias, conversaciones anteriores)
- Triggers automaticos por hito de reparacion (recibido → diagnostico → repuesto → terminado → recogida)
- Visibilidad via WhatsApp/llamada: el cliente pregunta y la IA consulta base de datos y responde al momento
- FAQ automatizado (horario, ubicacion, servicios)
- Alertas internas cuando una reparacion lleva demasiado tiempo parada
- Recordatorios automaticos de mantenimiento (ciclo anual)
- Validacion de tono con aprobacion del cliente antes de activar

#### Incluido como regalo

- Mini consultoria de ventas: sesion de planificacion de como usar el canal para facturar mas
- Diseno y configuracion de primeras campañas automaticas (post-reparacion, reactivacion de dormidos, estacionales)

#### Que habilita

- Equipo recupera ~264h/año de comunicacion manual
- Cliente informado al momento sin que nadie se acuerde de avisar
- Cero equipos olvidados sin comunicacion
- Un solo canal, una sola voz, trazabilidad completa
- Canal comercial activo que genera ingresos recurrentes sobre base de clientes existente

#### Que NO hace

- No gestiona busqueda de repuestos ni facturacion/stock (Ambito B — posible fase futura)
- No sustituye el criterio humano en presupuestos personalizados
- No es un CRM completo — es atencion al cliente inteligente + canal comercial

---

## 7. TOOLKIT PRACTICO

**Incluye:**

- Biblioteca de mensajes automaticos por hito de reparacion (redactados con tono DVD Consolas, aprobados antes de activar) `grounded`
- Guion de FAQ con respuestas entrenadas para las preguntas mas frecuentes `grounded`
- Plantillas de campañas comerciales (recordatorio mantenimiento, post-reparacion, reactivacion) `proposed`
- Documento de entrenamiento de la IA: perfil del negocio, procesos, tono, catalogo, politicas `grounded`
- Set de 10 escenarios de validacion para la prueba de garantia `grounded`

---

## 8. ESCALERA Y UPGRADE

**Este es un plan unico y completo.** No hay escalera entre tiers.

La escalera natural es temporal, no de scope:

- **Fase actual**: Ambito A completo — atencion al cliente, comunicacion, activacion comercial
- **Fase futura (si el cliente quiere)**: Ambito B — busqueda centralizada de repuestos, facturacion automatizada, gestion de stock. Engagement separado, precio separado.

**Sin presion.** El plan actual es autosuficiente. Ambito B es una puerta abierta, no una dependencia.

---

## 9. GARANTIA

### "Lo ves funcionar antes de que toque a un solo cliente"

Antes de activar cualquier interaccion con clientes reales, hacemos una fase de validacion cerrada. DVD Consolas ve exactamente como responde la IA a escenarios reales de su negocio. Nada sale al exterior sin su aprobacion.

**Que se valida (criterios objetivos):**

1. **Precision**: La IA responde correctamente a un minimo de 10 escenarios reales de DVD Consolas (consultas de estado, FAQ, avisos, situaciones complicadas como repuesto pendiente)
2. **Tono**: Cada tipo de mensaje y respuesta pasa la aprobacion explicita del cliente — el decide si suena a su negocio o no
3. **Conocimiento**: La IA demuestra que conoce los procesos, servicios, politicas y catalogo de DVD Consolas con precision
4. **Memoria**: La IA demuestra que recuerda historico de un cliente de prueba y lo usa en la conversacion

**Si no supera la validacion:**

- Primero: iteramos. Ajustamos entrenamiento, tono, respuestas. Incluido en el proyecto, sin coste adicional.
- Si tras las iteraciones de ajuste la IA sigue sin superar los criterios → **reembolso completo**.

**Que NO es la garantia:**

No se valida si "gusta" subjetivamente. Se valida si **funciona**: responde bien, suena humano, conoce el negocio y recuerda al cliente. Criterios binarios: pasa o no pasa.

> La garantia destruye el Big Domino: el cliente no tiene que creer que la automatizacion puede sonar humana. Lo va a VER con sus propios escenarios antes de que toque a un solo cliente real.

---

## 10. VISION A LARGO PLAZO (Narrativa estrategica)

"Este proyecto le da a DVD Consolas algo que hoy no tiene: un empleado de atencion al cliente que nunca olvida, nunca se cansa, y suena exactamente como vosotros. Esa base no solo resuelve el dolor de hoy — abre la puerta a crecer sin que la operativa se rompa."

"Cuando esta base esta funcionando, el siguiente paso natural es extender la inteligencia al lado logistico y administrativo: busqueda de repuestos, facturacion, gestion de stock. Pero eso es una decision futura, no una dependencia."

"Nuestro compromiso es que DVD Consolas tenga la infraestructura operativa que le permita consolidar esta tienda, hacerla crecer y darse a conocer — que es exactamente lo que quiere."

**No se promete.** Se **habilita**.

---

## 11. FRASE DE CIERRE (Hormozi puro)

"No estas comprando software ni automatizacion. Estas contratando a un empleado que nunca se olvida de avisar a tu cliente, que nunca suena a robot, y que ademas te vende mantenimientos mientras tu reparas consolas."

---

## Completion Checklist

- [x] ONE SENTENCE PITCH captura transformacion pain-first, no features
- [x] AVATAR DAY 1 conectado directamente al Context Document
- [x] DREAM OUTCOME especifico a Dia 90, emocional y con metricas
- [x] OBSTACULOS mapeados del Customer Map con pesos
- [x] STACK con 3 capas logicas (Foundation, Intelligence, Growth)
- [x] Plan unico con valor completo y limites claros
- [x] ESCALERA define expansion futura a Ambito B sin dependencia
- [x] GARANTIA reduce riesgo con criterios objetivos y reembolso
- [x] VISION pinta narrativa a largo plazo con Ambito B como puerta abierta
- [x] FRASE DE CIERRE reenmarca la compra (empleado, no software)
- [x] Alineacion con Value Equation: Dream Outcome claro / Perceived Likelihood via garantia y demo / Time Delay con quick wins / Effort & Sacrifice minimizado con DFY
