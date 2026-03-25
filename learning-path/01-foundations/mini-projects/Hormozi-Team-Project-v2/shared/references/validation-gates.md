# Validation Gates — Proposal Formatting

Definicion de los 2 gates obligatorios para la skill template-formatting.

## GATE 1 — Metodologia (despues de Seccion 4.3)

### Cuando se activa
Despues de redactar Secciones 1 a 4.3 (Objeto, Contexto, Objetivos, Metodologia hasta implementacion).

### Que se valida
1. **Principio rector** (4.1): Esta claro cual es la filosofia del proyecto?
2. **Mecanismo de control** (4.2): El cliente entiende como mantiene el control?
3. **Enfoque progresivo** (4.3): Las fases son claras y cada una se valida antes de avanzar?

### Preguntas al usuario
- "El enfoque metodologico (Secciones 4.1-4.3) refleja como realmente vas a trabajar?"
- "Hay algun principio que deberia anadir o cambiar antes de disenar el programa?"
- "Aprobado para continuar al diseno del programa (Seccion 5)? (Y/N)"

### Si NO pasa
- El usuario indica que cambios necesita
- Se revisan Secciones 4.1-4.3
- Se vuelve a presentar para aprobacion
- NO se avanza a Seccion 5 sin aprobacion

---

## GATE 2 — Garantia + Pricing (en Seccion 8.1)

### Cuando se activa
Despues de redactar Secciones 4.4 a 8.0, incluyendo el diseno completo del programa, resultados esperados, y la seccion de condiciones con garantia y pricing.

### Que se valida

#### Stress Test de Garantia
La garantia debe cumplir estos 5 criterios:

| # | Criterio | Check |
|---|----------|-------|
| 1 | **Objetiva**: Los criterios de validacion son medibles, no subjetivos | Si/No |
| 2 | **Performable**: El equipo puede realmente entregar lo que promete la garantia | Si/No |
| 3 | **Deliverable**: Los criterios se pueden demostrar en un test real | Si/No |
| 4 | **Fear-addressing**: La garantia aborda el miedo principal del cliente | Si/No |
| 5 | **Risk-reducing**: Reduce significativamente el riesgo percibido de la decision | Si/No |

#### Pricing
- Todos los campos de precio estan completos (ninguno MISSING)
- Hay value anchoring (valor total vs precio final)
- Upgrade path esta claro y sin penalizacion
- Costes operativos estimados si aplican

### Preguntas al usuario
- "La garantia pasa el stress test? (5 criterios arriba)"
- "Los precios son correctos y finales?"
- "Hay alguna condicion especial que anadir?"
- "Aprobado para completar la propuesta? (Y/N)"

### Si NO pasa
- El usuario indica que ajustar (garantia, pricing, o ambos)
- Se revisan las secciones afectadas
- Se vuelve a presentar para aprobacion
- NO se completa la propuesta sin aprobacion
