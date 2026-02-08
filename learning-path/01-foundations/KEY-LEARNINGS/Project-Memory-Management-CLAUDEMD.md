# Project Memory Management: CLAUDE.md Reference

## 1. Qué es Project Memory y qué NO es

**Project Memory** es el mecanismo de Claude Code que inyecta contexto persistente del repositorio en cada interacción con el agente. Vive en `CLAUDE.md` en la raíz del proyecto.

**Lo que SÍ es:**
- Un archivo de metadatos del proyecto que define cómo Claude debe operar
- Instrucciones que sobrescriben comportamientos por defecto
- Un contrato entre el proyecto y el agente sobre convenciones y restricciones
- Persistente entre sesiones
- Controlado por el usuario (versionado en git)

**Lo que NO es:**
- Un lugar para almacenar conocimiento del dominio (eso va en docs/)
- Un archivo de configuración de herramientas (eso va en .env, .config/)
- Documentación del usuario final (eso va en README.md, docs/)
- Un lugar para guardar estado o variables (sin estado entre sesiones)
- Un sustituto para una arquitectura clara del proyecto

**Alcance real:** Define el "cómo trabaja el agente en este proyecto", no "qué es este proyecto".

---

## 2. Rol específico de CLAUDE.md dentro de un sistema agentic

CLAUDE.md actúa como el **contrato de interacción** entre usuario y agente en contexto de proyecto.

**Función en la arquitectura:**
- **Restricciones operacionales:** Qué acciones son permitidas, cuáles requieren confirmación
- **Convenciones de estructura:** Dónde van los archivos, cómo se organizan
- **Reglas de decisión:** Criterios para cuando el agente está en duda
- **Estándares de salida:** Cómo debe redactar, qué debe incluir, qué debe evitar
- **Contexto ejecutable:** Información que cambia cómo el agente interpreta tareas

**Relación con otros componentes:**
```
CLAUDE.md (instrucciones al agente)
  ↓
[Agent internal behavior]
  ↓
Proyecto (código, archivos, estructura)
  ↓
Resultados (commits, cambios, decisiones)
```

CLAUDE.md es el **punto único de control** que garantiza que los resultados del agente alinean con las expectativas del proyecto.

---

## 3. Principios de diseño de Project Memory

**Principio de autoridad única:**
Cada decisión del proyecto debe tener una fuente de verdad única. Si está en CLAUDE.md, no debe estar también en README.md o comentarios de código.

**Principio de mutabilidad selectiva:**
Las instrucciones al agente (CLAUDE.md) cambian frecuentemente. El conocimiento del dominio (docs/) cambia lentamente. Separarlos permite iteración rápida sin contaminar la documentación estable.

**Principio de lectura anticipada:**
CLAUDE.md se inyecta al inicio de cada sesión. Si información no está aquí, el agente no la verá. Por lo tanto, lo crítico debe estar aquí; lo secundario, en documentación externa.

**Principio de resolución sin ambigüedad:**
Cuando el agente está en duda sobre cómo proceder, CLAUDE.md debe resolverlo sin interpretación. Si requiere interpretación, falla el principio.

**Principio de costo de contexto:**
Cada línea de CLAUDE.md consume tokens en cada sesión. No toda la información es igual de valiosa. Priorizar signal-to-noise.

**Principio de supervivencia temporal:**
Todo lo que entra en CLAUDE.md debe ser válido indefinidamente o explícitamente marcado como temporal. Si cambiarás la instrucción en 2 semanas, aún no debería estar aquí.

---

## 4. Qué información debe vivir en CLAUDE.md y qué fuera

### Debe estar en CLAUDE.md:

- **Restricciones operacionales del agente:** "No fuerces push a main", "Siempre pide confirmación antes de eliminar"
- **Convenciones estructurales:** "Los agentes van en /agents, los prompts en /prompts, etc."
- **Criterios de decisión irrenunciables:** "Prefiere editar archivo existente sobre crear nuevo", "No generes código sin leer primero"
- **Limitaciones reales del proyecto:** "No acceso a API externa", "Base de datos read-only en prod"
- **Estándares de interacción esperados:** "Respuestas concisas", "Markdown con formato específico", "Sin emojis"
- **Definición de éxito para agentes:** Qué significa "completado" en este proyecto

### No debe estar en CLAUDE.md:

- **Tutoriales o clases:** Eso va en /docs
- **Ejemplos de código largos:** Eso va en ejemplos/ o archivos separados
- **Guías del usuario final:** Eso va en README.md
- **Configuración técnica:** Eso va en .env, scripts, configuración
- **Historias de producto o visión:** Eso va en docs/VISION.md
- **Listados de herramientas o dependencias:** Eso va en package.json, requirements.txt
- **Detalles de implementación específica:** A menos que sea crítico para decisiones del agente
- **Información que cambia más de una vez por mes:** Es demasiado volátil

### Zona gris (evaluar caso a caso):

- **Contexto sobre arquitectura:** Si el agente necesita entenderlo para tomar decisiones → CLAUDE.md. Si es solo información → docs/ARCHITECTURE.md
- **Estándares de código:** Si es un no-negociable del agente → CLAUDE.md. Si es en la linter → .eslintrc
- **Procesos de QA:** Si el agente debe ejecutarlos siempre → CLAUDE.md. Si es opcional → docs/

---

## 5. Jerarquía de memoria y resolución de conflictos

Cuando el agente necesita información, consulta en este orden (la primera que encuentra, gana):

```
1. CLAUDE.md (proyecto local)
   ↓ (si no está)
2. Sesión anterior (contexto de la conversación actual)
   ↓ (si no está)
3. Archivos del repo mencionados explícitamente por usuario
   ↓ (si no está)
4. Búsqueda automática en el codebase (si el agente la realiza)
   ↓ (si no está)
5. Conocimiento general de Claude
```

**Resolución de conflictos:**

- **Conflicto entre CLAUDE.md y README.md:** CLAUDE.md gana. Es una instrucción directa al agente.
- **Conflicto entre CLAUDE.md y código existente:** Se assume que el código es incorrecto. CLAUDE.md debe actualizarse si las instrucciones son obsoletas.
- **Conflicto entre CLAUDE.md v1 y CLAUDE.md v2:** La versión en git HEAD es la autoridad. Versiones anteriores son referencia histórica.
- **Conflicto entre instrucción global y local:** La más específica (la que cita el archivo/contexto concreto) prevalece.

**Implicación:** CLAUDE.md requiere versionado en git. Cambios sin commit son "cambios no autorizados".

---

## 6. Impacto del tamaño de CLAUDE.md en tokens, coste y calidad

### Análisis de tokens:

- **Baseline:** Un CLAUDE.md típico de 50 líneas ≈ 200-300 tokens
- **Rango profesional:** 100-300 líneas ≈ 400-1200 tokens
- **Antipatrón:** > 500 líneas ≈ 2000+ tokens (excesivo)

Cada sesión, estos tokens se consumen automáticamente.

### Impacto en coste:

- Proyecto con 20 sesiones/semana × 600 tokens/sesión × costo = costo acumulado
- Un CLAUDE.md mal optimizado puede representar 10-15% de costo total innecesario
- Proyectos de larga duración amplían este efecto

### Impacto en calidad:

- **Demasiado pequeño:** El agente toma malas decisiones por falta de contexto
- **Tamaño óptimo:** El agente tiene exactamente lo que necesita, nada más
- **Demasiado grande:**
  - El agente se pierde en detalles irrelevantes
  - Dilución del signal importante con ruido
  - Mayor latencia (más contexto a procesar)
  - Mayor probabilidad de que el agente olvide instrucciones críticas

### Trade-off recomendado:

Optimizar para **máxima claridad con mínima verbosidad**. Una instrucción ambigua que requiere re-lectura es más costosa que una más larga pero inequívoca.

### Señales de CLAUDE.md mal dimensionado:

- Agente pide "confirmación" repetidamente en tareas que ya aclaraste
- Agente comete errores que violarían instrucciones en CLAUDE.md
- CLAUDE.md tiene secciones que nunca son consultadas
- Necesitas actualizar CLAUDE.md más de 1 vez por semana

---

## 7. Estilo de redacción recomendado

### Lenguaje:

- **Activo, imperativo:** "Siempre lee el archivo primero" (no "Los archivos deberían ser leídos")
- **Directo, sin marketing:** "No crees archivos sin necesidad" (no "Valoramos la excelencia minimalista")
- **Técnico, sin jerga innecesaria:** Usa términos que serían comprensibles en una review de código
- **Sin narrativa:** "Estructura: /src/agents → agentes, /src/prompts → prompts" (no "Nuestro hermoso viaje organizacional...")

### Estructura:

- **Encabezados jerárquicos:** H1 para categorías, H2 para subcategorías, máximo H3
- **Bullets para listas:** Más legible que párrafos numerados
- **Máximo 1-2 párrafos por punto:** Si necesitas más, es demasiada información
- **Código inline para ejemplos cortos:** `git rebase -i` en lugar de bloques de código

### Convenciones de secciones:

```markdown
## [Categoría]

[Párrafo introductorio si es necesario]

- **Punto 1:** Descripción breve
- **Punto 2:** Descripción breve

[Subsecciones solo si hay 5+ puntos relacionados]
```

### Tono:

- **Profesional sin ser formal:** "Colabora" (no "Ruega" ni "Colabórese")
- **Asertivo:** "X es así" (no "X podría ser considerado como potencialmente")
- **Sin amenazas sutiles:** "Confirma antes de push" (no "O habrá caos")

### Antipatrones de estilo:

- Párrafos largos (> 3 líneas)
- Enumeraciones > 5 items sin agrupar
- Viñetas con más de 20 palabras
- Ejemplos de código largos (> 5 líneas)
- Referencias a documentación sin indicar dónde está

---

## 8. Modularización y escalado en proyectos reales

### Limitaciones del enfoque monolítico:

CLAUDE.md es un archivo único. A mayor escala:
- Aumentan conflictos de merge
- Contexto general se vuelve ruido para tareas específicas
- Cambios frecuentes generan invalidación innecesaria en caché

### Estrategias de escalado:

**Para equipos pequeños (1-3 personas):**
- Un único CLAUDE.md que cubre todo
- Máximo 200 líneas
- Actualización semanal, no diaria

**Para proyectos medianos (múltiples directorios):**
- CLAUDE.md global en raíz (principios, restricciones globales)
- Archivos de contexto específico en subdirectorios (ej: agents/CLAUDE.md, docs/CLAUDE.md)
- El agente consulta jerárquicamente: local → raíz

**Para grandes sistemas (multi-proyecto):**
- Plantilla base (proyecto template con CLAUDE.md estándar)
- Sobreescrituras por subproyecto (solo lo que cambia)
- Control de versiones de CLAUDE.md como parte del proceso de CI/CD

### Patrón escalable:

```
CLAUDE.md (raíz)
  - Restricciones universales
  - Convenciones de carpetas
  - Reglas de decisión

learning-path/CLAUDE.md (opcional, si suficientemente diferente)
agents/CLAUDE.md (opcional, solo si agentes tienen restricciones especiales)
```

**Regla:** Cada CLAUDE.md adicional debe justificarse. Si es menor variación, va comentado en el principal.

---

## 9. Errores comunes y anti-patterns

### Anti-pattern 1: CLAUDE.md como documentación

**Síntoma:** "Este proyecto usa React con Redux y tres capas de servicios..."

**Problema:** El agente no necesita saber la arquitectura interna. Necesita saber cómo tomar decisiones sobre ella.

**Corrección:** Mover a docs/ARCHITECTURE.md. En CLAUDE.md: "Al editar código, mantén la arquitectura actual (ver docs/ARCHITECTURE.md)".

### Anti-pattern 2: Instrucciones contradictorias

**Síntoma:** "Siempre pide confirmación antes de cambios" + "Trabaja de forma autónoma sin preguntas"

**Problema:** El agente no puede satisfacer ambas. Fallará o ignorará una.

**Corrección:** Ser explícito sobre contexto: "Pide confirmación para: [lista]. Autónomo para: [lista]".

### Anti-pattern 3: CLAUDE.md obsoleto

**Síntoma:** "No uses TypeScript" (pero el proyecto usa TypeScript desde hace 6 meses)

**Problema:** El agente seguirá una instrucción muerta. Debería fallar ruidosamente.

**Corrección:** Auditar CLAUDE.md trimestralmente. Archivar cambios viejos en git, no en comentarios.

### Anti-pattern 4: Niveles de detalle inconsistentes

**Síntoma:** Sección 1 es vaga, sección 2 es hiperespecífica.

**Problema:** El agente no puede calibrar niveles de autonomía. Sobre-pregunta en algunos temas, asume mal en otros.

**Corrección:** Revisar CLAUDE.md por consistencia. Cada sección debe tener mismo "nivel de resolución".

### Anti-pattern 5: CLAUDE.md como caja negra

**Síntoma:** Usuario escribe instrucciones pero nunca verifica si el agente las sigue.

**Problema:** Divergencia entre intención y comportamiento crece. Nadie sabe qué está mal.

**Corrección:** Test ocasional: "¿Confirmarías antes de X?" Observar si el agente lo hace.

### Anti-pattern 6: Demasiadas excepciones y casos especiales

**Síntoma:** "Haz X, a menos que Y, pero si Z, entonces W, excepto cuando..."

**Problema:** Complejidad exponencial. El agente cometerá errores.

**Corrección:** Simplificar a regla base + lista de excepciones explícitas. Si > 3 excepciones, rediseñar la regla.

### Anti-pattern 7: Confundir CLAUDE.md con .gitignore o configuración

**Síntoma:** CLAUDE.md contiene rutas de archivos, comandos de setup, variables de entorno.

**Problema:** Duplica información que pertenece a otros archivos. Rompe separación de concerns.

**Corrección:** Estas van en scripts/, .env.example, .github/workflows/, no en CLAUDE.md.

---

## 10. Diferencia entre uso amateur y profesional

### Indicadores de uso amateur:

- CLAUDE.md crece sin límite (300+ líneas)
- Contiene ejemplos de código o templates
- Actualizado cada 2-3 días (muy volátil)
- Instrucciones son sugerencias ("considera evitar...") en lugar de reglas
- Mezcla contexto del dominio con instrucciones al agente
- No versionado o sin historial claro de cambios
- Redacción narrativa o conversacional
- No hay sincronización entre CLAUDE.md y comportamiento real del agente

### Indicadores de uso profesional:

**Estructura:**
- CLAUDE.md 100-250 líneas
- Cada sección tiene propósito claro y no se sobrelapan
- Información se versionada en git con mensajes de commit explicativos
- Cambios trimestrales, no semanales (estable)

**Contenido:**
- Instrucciones son imperativos no ambiguos: "Haz X" o "No hagas Y"
- Separación neta entre "cómo el agente debe trabajar" y "qué es el proyecto"
- Ejemplos integrados en línea, no bloques separados
- Referencias externas a docs/ cuando aplica

**Proceso:**
- CLAUDE.md se revisa antes de cambios significativos de arquitectura
- Cambios a CLAUDE.md son PR, no commits directos
- Documentación interna (docs/) y CLAUDE.md se mantienen en sincronía
- El agente tiene "validación": pide confirmación en caso de ambigüedad

**Observables:**
- El agente toma decisiones consistentes sin repetir preguntas
- Cuando el agente pregunta, es por ambigüedad real, no por instrucciones incompletas
- Cambios al repo siguen los patrones descrito en CLAUDE.md
- Nuevos colaboradores pueden entender las restricciones leyendo CLAUDE.md

### Test de madurez:

Pregúntate:
1. ¿Podría alguien nuevo entender cómo trabaja el agente leyendo solo CLAUDE.md?
2. ¿Podrías aceptar un PR que cambiar CLAUDE.md sin conflictuar?
3. ¿El agente le pide confirmación menos de una vez por sesión en promedio?
4. ¿CLAUDE.md tiene información que no necesitas en cada sesión?

Si las 4 respuestas son "sí", tienes uso profesional.

---

## Síntesis: Checklist de validación

Antes de "dar por estable" un CLAUDE.md:

- [ ] Cada sección tiene propósito único y claro
- [ ] No hay superposición entre secciones
- [ ] Todas las instrucciones son imperativos (no sugerencias)
- [ ] Menos de 250 líneas
- [ ] Sin ejemplos de código > 2 líneas
- [ ] Sin documentación del dominio
- [ ] Referencias externas cuando aplica
- [ ] Última actualización: hace más de 1 mes (estable)
- [ ] Cambios más recientes están en git con mensaje explicativo
- [ ] Comportamiento del agente observado coincide con instrucciones escritas
- [ ] Información sensible no incluida (API keys, tokens, credenciales)

---

## Referencias externas

- **Claude Code documentation:** Official behavior, model capabilities, tool availability
- **Project structure:** Follow the directory conventions defined locally, not imported from CLAUDE.md
- **Behavioral validation:** Test agente behavior quarterly against CLAUDE.md instructions

---

**Última revisión:** 2026-02-08
**Estabilidad:** Alta (solo actualizaciones si cambios fundamentales en Claude Code)
