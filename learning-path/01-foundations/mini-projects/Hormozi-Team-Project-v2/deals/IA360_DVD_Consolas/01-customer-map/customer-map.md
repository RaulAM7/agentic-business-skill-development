# Customer Map — DVD Consolas

**Deal**: IA360_DVD_Consolas
**Fuente**: Context Document (`00-context/context-document.md`)
**Frameworks**: Value Equation, Big Domino, Obstacle Map (Hormozi), Opportunity Switch (Russell)
**Scope**: Ambito A — Atencion y relacion con el cliente

---

## 1. AVATAR DIA 1 — Quien es hoy el cliente

### Situacion actual

| Aspecto | Descripcion | Confianza |
|---------|-------------|-----------|
| **Negocio** | Taller de reparacion de consolas (PlayStation, Xbox), PC y moviles. 100 reparaciones/semana, ~400/mes. Una tienda fisica (cerro otra previamente). | `stated` |
| **Rol del cliente** | Propietario-operador. Gestiona operativa, atiende clientes, coordina tecnicos, responde WhatsApps. No tiene capa de gestion intermedia — el absorbe todo lo que no es reparar. | `inferred` |
| **Equipo / recursos** | 4 tecnicos. ERP Divergest para registro de reparaciones. 3 numeros de WhatsApp (principal + 2 adicionales en manos de compañeros). Sin herramientas de automatizacion. | `stated` |
| **Estado emocional** | Saturacion y sensacion de arrastrar pendientes constantemente. "Estaria mucho mas liberado" si la atencion se automatizara. No es frustracion aguda — es un desgaste cronico que le resta aire para crecer. | `stated` / `inferred` |

### Lo que ha intentado

- **ERP Divergest** — Resuelve el registro de reparaciones, pero no comunica nada al cliente ni automatiza seguimiento. Es un repositorio, no un motor de accion. `stated`
- **Multiples numeros de WhatsApp** — Intento de repartir la carga de comunicacion entre el y dos compañeros. Resultado: informacion fragmentada, historico disperso, cliente recibe mensajes inconsistentes. Parche que genero un problema nuevo. `stated`
- **Respuesta manual caso a caso** — El flujo por defecto: cuando el cliente pregunta, alguien responde. No ha intentado automatizar esto formalmente. Resultado: 3h/semana solo en mensajes + interrupciones constantes a tecnicos. `inferred`

### Dolor nuclear (una frase)

> "Demasiadas cosas dependen de que alguien se acuerde — y cuando alguien no se acuerda, el cliente sufre, el equipo se satura y las cosas se quedan sin hacer." `inferred`

---

## 2. AVATAR DIA 90 — Quien quiere ser

### Estado deseado

- El equipo no arrastra pendientes de comunicacion. Los avisos de estado (terminado, pendiente de repuesto, recogida) se disparan solos cuando cambia el estado interno de la reparacion. `stated`
- El cliente tiene visibilidad de su reparacion sin preguntar. Sabe en que fase esta, ve fotos si las hay, ve presupuesto pendiente. No necesita llamar ni escribir por WhatsApp para enterarse. `stated`
- Las preguntas basicas (horario, ubicacion, "reparais PS5?") se responden solas, liberando al equipo de interrupciones de bajo valor. `inferred`
- Comunicacion unificada en un solo canal, con trazabilidad y con nombre humano detras del mensaje. No tres numeros desconectados. `stated`
- Clientes que hicieron mantenimiento reciben recordatorio automatico al cabo de un año sin que nadie tenga que acordarse. `stated`
- **El canal de comunicacion automatizado se convierte en canal de venta sistematico.** Una vez que controlas la comunicacion con el cliente de forma planificada, puedes impulsar facturacion: upsells post-reparacion, recordatorios de mantenimiento, campañas estacionales, reactivacion de clientes dormidos. Cuesta mucho ganar un cliente, pero una vez que lo es, venderle mas veces es mas facil y barato. Hoy esa palanca no existe. Despues de esto, si. `hypothesis` — el cliente no lo articula, pero la infraestructura lo habilita directamente. Los recordatorios de mantenimiento que si menciona (`stated`) son solo la punta del iceberg de esta capacidad.

### Como se siente ese estado

- **Liberado.** La palabra que el propio cliente usa. Menos carga mental, menos tareas que dependen de acordarse. `stated`
- **Con control.** Nada importante se queda sin mover ni sin comunicar. Si falta un repuesto, el cliente lo sabe. Si un equipo lleva semanas parado, hay alerta. `inferred`
- **Con aire para crecer.** La operativa de atencion no le consume el tiempo que necesita para consolidar y potenciar la tienda. `inferred`
- **Con capacidad comercial que antes no tenia.** No solo deja de perder tiempo — empieza a generar ingresos adicionales por un canal que antes solo era reactivo. `hypothesis`

### Metricas observables

- Horas semanales dedicadas a WhatsApp manual bajan de 3h a ~0 (avisos automaticos). `inferred`
- Llamadas repetitivas de bajo valor reducidas significativamente (FAQ automatizado). `inferred`
- Cero equipos "olvidados" durante meses sin comunicacion al cliente. `hypothesis`
- Reactivacion de mantenimientos: primeros recordatorios automaticos enviados y primeras respuestas de clientes. `hypothesis`
- Ticket medio por cliente sube (upsells, cross-sells sistematicos). `hypothesis`
- Clientes recurrentes activados por campañas automaticas (no solo mantenimiento). `hypothesis`

---

## 3. OBSTACLE MAP — Obstaculos con peso estrategico

| # | Obstaculo | Peso (1-5) | Tipo | Confianza |
|---|-----------|:---:|------|-----------|
| 1 | **Toda comunicacion depende de memoria humana.** No hay trigger automatico — cada aviso, cada seguimiento, cada recordatorio requiere que alguien se acuerde y actue. Es la raiz de la que brotan casi todos los demas problemas. | 5 | estructural | `inferred` |
| 2 | **El cliente esta completamente a ciegas.** No hay forma de saber el estado de la reparacion sin preguntar. Eso genera dependencia bidireccional: el cliente depende de que le avisen, el equipo depende de que le pregunten. | 5 | operativo | `stated` |
| 3 | **Miedo a deshumanizar la relacion con el cliente.** Obstaculo emocional — no bloquea la operativa, bloquea la decision de compra. Si la solucion suena robotica o fria, el cliente la rechaza independientemente de su eficiencia. | 4 | emocional | `stated` |
| 4 | **Canales de comunicacion fragmentados.** 3 numeros de WhatsApp sin historico central. Informacion inconsistente, sin trazabilidad. Cualquier intento de organizar la comunicacion choca contra esta fragmentacion. | 3 | estructural | `stated` |
| 5 | **Interrupciones repetitivas de bajo valor.** Llamadas y mensajes con preguntas basicas (horario, ubicacion, servicios) que drenan tiempo y rompen concentracion del equipo, pero no aportan nada al negocio. | 3 | operativo | `stated` |
| 6 | **No existe infraestructura de activacion comercial.** El negocio no tiene forma sistematica de comunicarse con clientes existentes para upsells, campañas o reactivacion. El canal hoy es reactivo, no proactivo. Es un obstaculo invisible porque el cliente no lo percibe como tal — pero bloquea directamente el crecimiento de ticket medio. | 3 | estructural | `hypothesis` |

### Logica de priorizacion

Priorizado por **impacto en Value Equation + efecto cascada**:

- **Obstaculos 1 y 2 (peso 5)**: Causa y efecto del mismo problema nuclear. Resolver el #1 (triggers automaticos) resuelve parcialmente el #2 (visibilidad). Juntos representan la mayor concentracion de dolor operativo y emocional. Si la oferta solo resolviera estos dos, ya tendria valor.
- **Obstaculo 3 (peso 4)**: No es operativo, es decisional. Es la objecion que puede tumbar la venta aunque el producto sea bueno. Tiene que estar resuelto en el diseno de la oferta y en el tono de todo lo que se presente.
- **Obstaculos 4 y 5 (peso 3)**: Amplificadores del problema central. La fragmentacion hace que comunicar bien sea imposible. Las interrupciones drenan el tiempo que liberariamos con automatizacion. Resolverlos multiplica el impacto de resolver 1 y 2.
- **Obstaculo 6 (peso 3)**: Obstaculo de "siguiente nivel". El cliente no lo siente hoy, pero es lo que separa "alivio operativo" de "crecimiento de facturacion". Es donde entra la mini consultoria de ventas.

---

## 4. BELIEF ARCHITECTURE — Arquitectura de creencias

### Big Domino

> "Si crees que la comunicacion automatizada puede sentirse tan humana y cercana como la manual, entonces delegar la atencion al cliente a un sistema se convierte en obvio — porque consigues el alivio sin perder lo que te importa." `inferred`

Esta es la creencia que, si cae, hace que todo lo demas caiga. Toda la resistencia del cliente pivota sobre un punto: automatizar = perder humanidad. Si resolvemos eso, la compra se vuelve obvia porque ya quiere automatizar, ya siente el dolor, ya sabe cuanto le cuesta.

### New Opportunity vs Opportunity Switch

**Tipo**: Opportunity Switch `inferred`

**Justificacion**: DVD Consolas ya comunica con sus clientes — el problema no es que no lo haga, es como lo hace (manualmente, reactivamente, dependiendo de memoria). No estamos creando una necesidad nueva. Estamos proponiendo un vehiculo nuevo para algo que ya hace: pasar de comunicacion manual y reactiva a comunicacion automatizada, proactiva y con tono humano. El cliente no necesita ser convencido de que comunicar es importante — necesita ser convencido de que hay una forma mejor de hacerlo sin perder lo que valora.

### Creencias que habilitan la venta

- **Ya quiere automatizar.** No hay que venderle la idea de automatizacion — el la busca activamente. Esta en la reunion de discovery por voluntad propia. `stated`
- **Ve y cuantifica el coste del status quo.** Sabe que pierde horas, sabe que se le quedan cosas pendientes, sabe que el cliente sufre. No necesita que le expliques el problema. `stated`
- **Valora lo practico y simple.** "Le bastaria con verlo en una hoja." Su umbral de satisfaccion es bajo — no necesitas una solucion espectacular, necesitas una que funcione dentro de su dia a dia. `stated`
- **Esta en momento de inversion.** Fase de consolidacion, quiere que la tienda funcione mejor para crecer. Esta dispuesto a invertir si ve que resuelve su problema real. `inferred`

### Creencias que bloquean la venta

- **"Automatizar = robotico y frio."** La objecion principal. Sale espontaneamente del cliente. No es racional — es estetica y emocional. **Como abordarla**: La oferta tiene que demostrar tono humano desde el primer contacto. Ejemplos reales de mensajes automaticos que suenan a persona. El cliente necesita VER que no suena a maquina antes de creer que es posible. `stated`

- **"Hay cosas demasiado personalizadas para automatizar."** Lo dice sobre presupuestos, pero podria extenderlo a otras areas de comunicacion. **Como abordarla**: No prometer automatizacion total. Dejar claro que la solucion automatiza lo repetitivo y reserva lo personalizado para el equipo humano. La linea es: "automatizamos lo que no necesita tu criterio; lo que si lo necesita, te lo dejamos pero te lo facilitamos." `stated`

- **"No nos ponemos objetivos, vamos creciendo."** Resistencia a planificacion formal. Relevante para la capa de activacion comercial (campañas, upsells). **Como abordarla**: No presentar la capa comercial como "plan de marketing con KPIs". Presentarla como "cosas que pasan solas y te traen ingresos extra" — alineado con su estilo organico. `stated`

---

## 5. VALUE EQUATION DIAGNOSIS — Diagnostico preliminar

| Factor | Estado actual | Oportunidad | Prioridad |
|--------|---------------|-------------|:---------:|
| **Dream Outcome** (resultado deseado) | Claro pero enmarcado como alivio de dolor ("dejar de arrastrar pendientes", "sentirme liberado"), no como ganancia. El cliente sabe lo que quiere dejar de sufrir, pero no visualiza completamente lo que podria ganar. | Ampliar el dream outcome de "alivio operativo" a "alivio operativo + motor de facturacion". La capa de activacion comercial convierte la solucion de gasto en inversion con retorno. | Media |
| **Perceived Likelihood** (probabilidad percibida) | Mixta. Cree que ciertas cosas son automatizables (avisos, FAQ), pero duda de que se pueda hacer sin sonar robotico. El Big Domino esta aqui: si no cree que la automatizacion puede sentirse humana, no compra. | Demostrar, no prometer. Ejemplos reales de mensajes automaticos con tono humano. Mostrarle como suena ANTES de pedirle que compre. La prueba tangible destruye la objecion mejor que cualquier argumento. | **Alta** |
| **Time Delay** (tiempo hasta resultado) | No expresado explicitamente. No esta en crisis — esta en desgaste cronico. No necesita resultado manana, pero tampoco tiene paciencia para un proyecto de 6 meses. | Quick wins en las primeras 1-2 semanas: primer aviso automatico funcionando, FAQ basico respondiendo. Resultados visibles rapido para que confie en el proceso y mantenga momentum. | Media |
| **Effort & Sacrifice** (esfuerzo requerido) | Critico. Valora lo simple ("una hoja me bastaria"). Cree que la tecnologia debe adaptarse a su flujo, no al reves. Si la solucion requiere aprender un sistema nuevo complejo o cambiar como trabajan, la resistencia sera alta. | Posicionar como "nosotros montamos, tu solo cambias el estado en tu sistema y todo lo demas pasa solo". Minimo cambio de comportamiento para el equipo. La adopcion tiene que ser casi invisible. | **Alta** |

### Recomendacion para offer design

La oferta debe atacar las dos palancas de mayor prioridad:

1. **Perceived Likelihood**: Resolver el Big Domino con prueba tangible. Incluir en la oferta una fase de "prueba de tono" o demo real donde el cliente vea mensajes automaticos que suenan humanos. No vender la promesa — mostrar el resultado.

2. **Effort & Sacrifice**: Disenar la implementacion como "llave en mano". El equipo de DVD Consolas no deberia tener que aprender casi nada. El esfuerzo percibido de adopcion tiene que ser cercano a cero.

Secundariamente, ampliar el Dream Outcome con la capa de activacion comercial para justificar el precio como inversion, no como gasto.

---

## 6. TRANSFORMATION PROMISE DRAFT — Borrador de promesa

**Variante seleccionada: Pain-first**

> "Dejas de depender de que alguien se acuerde de avisar. Cada cambio de estado se comunica solo, con tono humano. Primeros avisos automaticos funcionando en la primera semana. Despues, ese mismo canal empieza a venderte mantenimientos y servicios sin que tengas que perseguir a nadie."

**Razon de seleccion**: El lead se ha expresado consistentemente en terminos de pain-aversion, no de benefit-aspiring. En primera compra con un cliente que verbaliza dolor, la promesa pain-first conecta mejor que outcome-focused o identity-focused.

### Variantes descartadas (referencia)

**Variante 1 (outcome-focused)**:
> "De taller que pierde horas respondiendo WhatsApps y arrastrando pendientes, a taller donde el cliente esta informado, el equipo respira y el canal de comunicacion te genera ingresos adicionales — en las primeras semanas, sin cambiar como trabajas."

**Variante 3 (identity-focused)**:
> "El sistema que convierte un taller saturado y reactivo en un negocio con atencion al cliente profesional, proactiva y humana — y que ademas te abre un canal de ventas que hoy no tienes."

---

## Notas para offer-design

- **Scope del proyecto**: Ambito A (atencion y relacion con el cliente). Ambito B (busqueda repuestos, facturacion/stock) queda fuera — posible consultoria futura.
- **Capa de activacion comercial**: Incluir como "mini consultoria de ventas" dentro de la oferta — planificar con el cliente como usar el canal automatizado para impulsar facturacion (upsells, campañas, recordatorios, reactivacion). Es valor añadido estrategico, no solo implementacion tecnica.
- **Budget orientativo**: 4-5k segun indicacion del usuario. Esto condiciona alcance de implementacion.
- **Prioridad en la oferta**: Demostrar tono humano (Perceived Likelihood) y minimizar esfuerzo de adopcion (Effort & Sacrifice).

---

## Completion Checklist

- [x] Bloque 1 (Avatar Dia 1) validado por usuario
- [x] Bloque 2 (Avatar Dia 90) validado por usuario
- [x] Bloque 3 (Obstacle Map) priorizado y validado por usuario
- [x] Bloque 4 (Belief Architecture) con Big Domino identificado y validado
- [x] Bloque 5 (Value Equation Diagnosis) validado por usuario
- [x] Bloque 6 (Transformation Promise) variante pain-first seleccionada por usuario
- [x] Todas las etiquetas de confianza (stated/inferred/hypothesis) presentes
- [x] No hay claims sin fuente en el Documento de Contexto
