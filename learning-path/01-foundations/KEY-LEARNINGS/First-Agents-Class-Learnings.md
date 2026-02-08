# Lesson 1.5: Agents — Key Learnings

## 1. Conceptos fundamentales

### Que es un agent en Claude Code

Un agent es una instancia independiente de Claude que ejecuta una tarea de forma autonoma. Se lanza desde la conversacion principal, trabaja en paralelo con otros agents, y devuelve un resultado al finalizar.

Cada agent:
- Recibe un prompt con instrucciones claras
- Tiene acceso a las herramientas del sistema (lectura de archivos, busqueda, web, etc.)
- Trabaja de forma aislada — no ve lo que hacen los demas agents
- Devuelve un resultado unico a la conversacion principal

### Que NO es un agent

- No es un chatbot independiente con memoria persistente
- No es un hilo de conversacion — no hay ida y vuelta con el agent
- No es un sub-agent personalizado (eso es leccion 1.6)
- No es util para tareas secuenciales donde cada paso depende del anterior

### Diferencia entre agents y custom sub-agents

| Aspecto | Agent (1.5) | Custom Sub-agent (1.6) |
|---------|-------------|------------------------|
| Proposito | Ejecutar tareas paralelas similares | Aportar una perspectiva especifica (rol, expertise) |
| Configuracion | Prompt de tarea ad-hoc | Definicion persistente con personalidad, rol, restricciones |
| Cantidad tipica | Muchos (5-10+) | Pocos (2-4) |
| Interaccion | Fire-and-forget (lanza y recoge resultado) | Puede tener dialogo estructurado |
| Ejemplo | "Analiza estos 10 archivos" | "Dame feedback como director financiero" |

### Paralelismo vs secuencialidad

**Paralelismo:** Multiples tareas independientes ejecutadas al mismo tiempo. Cada una puede completarse sin conocer el resultado de las demas.

**Secuencialidad:** Cada paso depende del anterior. No se puede avanzar sin el resultado previo.

**Regla practica:** Si puedes darle las mismas instrucciones a 10 personas y cada una puede trabajar sin hablar con las otras, es paralelizable. Si necesitan pasarse informacion entre si, es secuencial.

### El papel critico de la sintesis

Los agents generan datos en bruto. Sin sintesis, tienes 10 informes separados que no dicen nada juntos.

La sintesis es donde:
- Se detectan patrones cruzados
- Se identifican contradicciones
- Se construye la narrativa unificada
- Se extraen insights que ningun agent individual podia ver

La sintesis siempre ocurre en la conversacion principal, no en un agent.

### Que significan los "patterns" detectados por Claude

Cuando Claude analiza multiples fuentes en paralelo y luego sintetiza, detecta patrones que no son visibles al leer archivos uno por uno. Ejemplo de la clase:

- 10 campanas analizadas individualmente -> patron comun: todas son transaccionales, ninguna genera identidad
- 4 fuentes cruzadas (CSV, competidores, feedback, gaps) -> patron emergente: "coffee personality" aparece 3 veces de forma independiente

Los patrones no son opiniones de Claude. Son convergencias en los datos que se hacen visibles solo cuando se mira todo al mismo tiempo.

---

## 2. Modelo de orquestacion: PM -> Paralelo -> Sintesis

Este es el "cheat code" de la orquestacion agentic:

### Fase 1: Planning / Project Management (secuencial)

**Que haces:** Defines el trabajo, identificas las fuentes, decides como dividirlo.

- Mapeas los archivos/fuentes disponibles
- Decides cuantos agents necesitas
- Defines el prompt de cada agent (que debe analizar, que debe devolver)
- Estableces el formato de output esperado

**Esto es secuencial** porque cada decision depende de entender el contexto completo.

### Fase 2: Ejecucion paralela con agents

**Que haces:** Lanzas todos los agents al mismo tiempo. Cada uno trabaja en su tarea.

- Cada agent recibe su prompt y sus archivos
- Todos trabajan simultaneamente
- No se comunican entre si
- Devuelven resultados independientes

**Ejemplo de la clase:**
- 10 agents, cada uno analizando 1 campana
- 4 agents especializados: datos CSV, competidores vs campanas, feedback vs competidores, gaps

### Fase 3: Sintesis final (conversacion principal)

**Que haces:** Recoges los resultados de todos los agents y construyes la imagen completa.

- Identificas patrones cruzados
- Detectas contradicciones o confirmaciones
- Construyes el diagnostico unificado
- Generas el documento final

**Esto no se delega a un agent** porque requiere vision global y juicio integrador.

### Flujo visual

```
[Planning]          ->  [Agent 1]  ->
(secuencial)            [Agent 2]  ->   [Sintesis]
                        [Agent 3]  ->   (secuencial)
                        [Agent N]  ->
```

---

## 3. Tabla rapida de decision

| Tipo de trabajo | Enfoque recomendado | Por que |
|-----------------|---------------------|---------|
| 10 archivos similares, mismo analisis | Agents paralelos (1 por archivo) | Independientes, misma tarea, maximo speedup |
| 4 fuentes distintas, analisis especializado | Agents paralelos (1 por especialidad) | Cada uno necesita expertise diferente pero trabajan en paralelo |
| Tarea compleja que depende de pasos previos | Conversacion secuencial | Cada paso necesita el resultado anterior |
| Necesitas feedback desde un rol especifico | Custom sub-agent (1.6) | Requiere personalidad y perspectiva persistente |
| Un solo documento largo para analizar | Conversacion directa | No hay que dividir, un solo flujo basta |
| Comparar resultados de multiples analisis | Sintesis en conversacion principal | Requiere vision global, no se puede paralelizar |
| Generar N variantes de un mismo output | Agents paralelos (1 por variante) | Independientes, misma estructura, diferente contenido |
| Investigar un tema con multiples fuentes web | Agents paralelos (1 por fuente) | Cada busqueda es independiente |
| Refinar iterativamente un documento | Conversacion secuencial | Cada iteracion depende de la anterior |
| Validar N outputs contra criterios | Agents paralelos (1 por validacion) | Cada validacion es independiente |

---

## 4. Orchestration patterns practicos

### Fan-out

**Que es:** Lanzar N agents con la misma tarea pero diferentes inputs.

**Ejemplo de la clase:** 10 agents, cada uno analizando 1 archivo de campana con las mismas instrucciones ("analiza mecanica, intencion, fallo, valor salvable").

**Cuando usarlo:** Tienes muchos items similares que necesitan el mismo tipo de analisis.

### Specialized roles

**Que es:** Lanzar N agents con diferentes tareas especializadas sobre el mismo conjunto de datos.

**Ejemplo de la clase:** 4 agents con roles distintos:
- Agent 1: Analista de datos (CSV)
- Agent 2: Analista competitivo (competidores vs campanas)
- Agent 3: Analista de feedback (clientes vs competidores)
- Agent 4: Analista de gaps (oportunidades no exploradas)

**Cuando usarlo:** Necesitas multiples perspectivas analiticas sobre el mismo problema.

### Cross-source analysis

**Que es:** Cruzar datos de fuentes heterogeneas para encontrar conexiones.

**Ejemplo de la clase:** Conectar feedback de clientes con features de competidores para descubrir que los clientes piden cosas que los competidores ya ofrecen (pero Basecamp no).

**Cuando usarlo:** Tienes datos de diferentes origenes y necesitas encontrar patrones que solo emergen al cruzarlos.

### Batch generation

**Que es:** Generar multiples outputs similares en paralelo.

**Aplicacion fuera de la clase:** 10 agents generando cada uno un email personalizado para un segmento diferente. O 5 agents creando variantes de copy para A/B testing.

**Cuando usarlo:** Necesitas N versiones de algo con la misma estructura pero diferente contenido.

### Validation pipeline

**Que es:** Usar agents para verificar outputs contra criterios independientes.

**Aplicacion:** Un agent valida precision tecnica, otro valida tono, otro valida completitud. Cada validacion es independiente.

**Cuando usarlo:** Tienes un output que necesita pasar multiples controles de calidad independientes.

### Synthesis

**Que es:** Combinar los resultados de multiples agents en un diagnostico unificado.

**Ejemplo de la clase:** Tomar los 10 analisis de campana y encontrar el patron comun ("todas son transaccionales, ninguna genera identidad"). Tomar los 4 analisis especializados y construir el documento `comprehensive-research-synthesis.md`.

**Cuando usarlo:** Siempre. Cada ejecucion paralela necesita una fase de sintesis. Sin ella, tienes datos sueltos, no conocimiento.

---

## 5. Aplicaciones fuera del escenario de la clase

| Escenario real | Pattern | Agents |
|----------------|---------|--------|
| Analizar 10 ofertas de empleo | Fan-out | 1 por oferta, mismas instrucciones |
| Evaluar 5 proveedores | Fan-out + Sintesis | 1 por proveedor, luego comparativa |
| Resumir 20 articulos guardados | Fan-out + Sintesis | 1 por articulo, luego insights clave |
| Buscar departamento (8 listings) | Fan-out | 1 por listing, pros/contras/red flags |
| Analisis competitivo (6 empresas) | Fan-out + Specialized roles | 1 por empresa + 1 cruzado |
| Planificar viaje | Specialized roles | Vuelos / hoteles / actividades / restaurantes |
| Revisar documentacion tecnica | Validation pipeline | Precision / completitud / claridad |
| Crear contenido multicanal | Batch generation | 1 por canal (email, social, blog) |

---

## 6. Errores comunes al usar agents

1. **Usar agents para trabajo secuencial.** Si el paso 2 necesita el resultado del paso 1, no paralelices.
2. **Olvidar la sintesis.** 10 informes separados no son un analisis. La sintesis es donde esta el valor.
3. **Prompts vagos.** Cada agent necesita instrucciones claras: que leer, que analizar, que formato de output.
4. **Paralelizar cuando no hay volumen.** Un solo archivo no necesita un agent. Leelo directamente.
5. **Esperar que los agents se comuniquen entre si.** No lo hacen. Son independientes.
6. **Delegar la sintesis a un agent.** La sintesis requiere vision global. Hazla en la conversacion principal.

---

## 7. Takeaway

La habilidad no es "usar agents". La habilidad es **pensar como orquestador**:

1. Descomponer el problema en partes independientes
2. Definir que necesita cada parte
3. Ejecutar en paralelo
4. Sintetizar con vision global

Esto aplica igual con Claude Code, con un equipo de personas, o con cualquier sistema de trabajo distribuido. El patron es el mismo: divide, ejecuta, sintetiza.
