# ⚠️ GitHub Project Setup Required

Tu token de GitHub CLI **no tiene los scopes necesarios** para crear el proyecto.

## La Solución (3 comandos, 2 minutos)

### 1️⃣ En tu terminal local, ejecuta:

```bash
gh auth refresh -s project,read:project
```

**Qué pasará:**
- Se abrirá tu navegador
- Verás un código de 6 caracteres (ej: `DE77-81A6`)
- Copias el código
- Pegas en GitHub
- Autorizas los permisos
- Listo ✓

### 2️⃣ Una vez autorizado, en la carpeta del proyecto, ejecuta:

```bash
./scripts/setup_github_project.sh
```

**Qué hará:**
- ✓ Crear el proyecto "Learning Path Progress"
- ✓ Agregar las 10 issues automáticamente
- ✓ Organizarlas por fase

### 3️⃣ Verifica que se creó:

```bash
gh project list --owner RaulAM7
```

O abre en navegador:

```bash
gh project view <numero> --owner RaulAM7 --web
```

---

## Por Qué Es Necesario

Los scopes adicionales requeridos son:
- `project` — Permiso para crear y modificar proyectos
- `read:project` — Permiso para leer datos de proyectos

GitHub los requiere por seguridad. Solo necesitas hacerlo **una sola vez**.

---

## Scripts Disponibles

Están listos y esperan tus scopes:

| Script | Qué hace | Requerimientos |
|--------|----------|----------------|
| `scripts/one-time-auth-setup.sh` | Guía paso-a-paso para actualizar scopes | Interactividad del navegador |
| `scripts/setup_github_project.sh` | Crea proyecto y agrega issues | Scopes actualizados ✓ |
| `scripts/bootstrap_github_tracking.sh` | Crea labels, milestones, issues | ✓ Ya completado |

---

## Estado Actual

✓ **Completado:**
- 13 labels creadas (phase, type, status)
- 5 milestones creados (Phase 01-05)
- 10 issues creados (#11-20)
- Tracking system operativo en PROGRESS.md

⏳ **Pendiente:**
- GitHub Project creado
- Issues organizadas en el proyecto

---

## Troubleshooting

### "Stuck on authorization screen"
- Espera 30 segundos
- Si no avanza, cierra navegador y reintenta

### "Command not found: gh"
- GitHub CLI no está instalado: https://cli.github.com

### "Personal access token cannot be used"
- Tu token es demasiado antiguo
- Crea uno nuevo en: https://github.com/settings/tokens

---

## Próximos Pasos

Una vez ejecutes los 3 comandos anteriores, tendrás:
- ✓ Project "Learning Path Progress" visible en GitHub
- ✓ 10 issues organizadas por fase
- ✓ Sistema completo de tracking funcionando
- ✓ Ready para empezar a marcar checkboxes en PROGRESS.md

**Tiempo estimado:** 2 minutos

---

**¿Necesitas ayuda?** Todos los scripts tienen mensajes de error claros que dicen exactamente qué falta.
