# RULES

Restricciones siempre activas para el Hormozi Team Project v2.

## Verdad y desconocidos

- No inventar hechos, citas textuales ni datos de negocio del cliente.
- Si falta informacion en las fuentes, marcar como `Unknown`.
- Hacer preguntas concretas solo cuando sean necesarias para avanzar.

## Disciplina de templates

- Los templates en `shared/templates/` son referencia de solo lectura.
- Nunca modificar un archivo de template directamente.
- Los documentos de produccion siguen la estructura del template exactamente.
- Preservar marcadores emoji, numeracion de secciones y convenciones de formato.

## Cadena documental

- Contexto -> Customer Map -> Offer -> Proposal -> Critique
- Cada documento requiere que el anterior este completo y aprobado.
- Nunca saltar documentos en la cadena.
- Referenciar documentos fuente cuando el contenido derive de ellos.

## Disciplina de outputs

- Entregables finales van a `deals/[NombreDeal]/[stage]/`.
- Archivos de trabajo y borradores intermedios van a `deals/[NombreDeal]/scratch/`.
- Usar nombres predecibles (ver convenciones de naming abajo).

## Base de conocimiento

- Los archivos de conocimiento en `shared/knowledge/` son referencia canonica.
- Siempre leer los archivos de conocimiento relevantes antes de generar outputs.
- No generar contenido de frameworks Hormozi/Brunson de memoria.

## QA gate antes de cerrar

- Ejecutar la skill `qa-gate` antes de declarar cualquier documento completo.
- Verificar cada criterio de aceptacion explicitamente.
- Listar items `Unknown` no resueltos.

## Disciplina de interaccion

- Skills con interactividad ALTA (customer-mapping, offer-design) deben pausar para validacion del usuario.
- Skills con interactividad BAJA producen outputs y los presentan.
- Nunca forzar interaccion donde la spec de la skill dice que no se requiere.
- Respetar la decision del usuario de saltar iteraciones opcionales.

## Convenciones de naming

- Carpetas de deal: `[CodigoEmpresa]_[NombreCliente]` (ej: IA360_Yanira_Leyva)
- Documentos: minusculas con guiones, sin espacios
- Versiones: sufijo `-v2`, `-v3` si se necesita revision

## Etiquetado de confianza

En documentos interpretativos (customer-map, offer-design), toda afirmacion lleva etiqueta:
- `stated` — el cliente lo dijo explicitamente (del contexto)
- `inferred` — derivado logicamente de lo que dijo
- `hypothesis` — plausible pero sin confirmar

## Idioma

- Responder en el mismo idioma que use el usuario.
- Los documentos de deal se escriben en el idioma de la propuesta final.
- Los archivos de sistema (harness, skills, templates) estan en espanol donde sea natural.
