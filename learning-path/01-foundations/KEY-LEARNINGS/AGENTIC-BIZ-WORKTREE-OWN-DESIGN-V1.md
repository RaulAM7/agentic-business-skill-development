# Registry Global + Manifest por Proyecto

Architecture design for managing Claude Code sub-agents across multiple projects using a single source of truth and per-project selection manifests.

**Version:** 1.0
**Date:** 2026-02-08
**Status:** Reference design

---

## Table of Contents

1. [Overview + Why This Pattern](#1-overview--why-this-pattern)
2. [Registry Repo Structure (Source of Truth)](#2-registry-repo-structure-source-of-truth)
3. [Project Repo Structure (Selection Layer)](#3-project-repo-structure-selection-layer)
4. [Manifest Format (.claude/agents.manifest.yaml)](#4-manifest-format-claudeagentsmanifestyaml)
5. [Sync Script (scripts/sync-claude-agents.sh)](#5-sync-script-scriptssync-claude-agentssh)
6. [Naming and Governance Rules](#6-naming-and-governance-rules)
7. [Operational Protocol (5 Lines)](#7-operational-protocol-5-lines)
8. [Optional Variants (Submodule, Symlink)](#8-optional-variants-submodule-symlink)

---

## 1) Overview + Why This Pattern

### The Problem

When working with Claude Code sub-agents across multiple projects, three failure modes emerge quickly:

- **Agent sprawl.** Each project accumulates its own copy of agents with no shared lineage. Improvements in one project never propagate.
- **Inconsistency.** The same conceptual agent (e.g., "risk analyst") drifts into incompatible variants across projects without anyone noticing.
- **Selection bloat.** A project loads every available agent instead of the minimal set it actually needs, degrading context quality and increasing noise.

### The Solution

Split the concern into two layers:

| Layer | Responsibility | Lives in |
|---|---|---|
| **Registry (global)** | Single source of truth for all agent definitions. Versioned, categorized, canonical. | Dedicated repo: `agentic-subagents-registry/` |
| **Manifest (per-project)** | Declares which agents from the registry this project actually uses. Minimal, declarative, auditable. | Each project repo: `.claude/agents.manifest.yaml` |

A lightweight sync script bridges the two: it reads the manifest, copies the selected agents from the registry into the project's `.claude/agents/` directory, and nothing else.

### Why This Works

- **One place to improve agents.** Fix a prompt in the registry, sync all projects.
- **Minimal surface per project.** Each project declares only what it needs. No dead agents polluting context.
- **Reproducible.** The manifest is committed. Anyone cloning the project can see exactly which agents it depends on.
- **No runtime dependency.** After sync, the project is self-contained. The registry does not need to be present at execution time.
- **Auditable.** `git log` on the registry shows agent evolution. `git log` on the manifest shows when a project adopted or dropped an agent.

---

## 2) Registry Repo Structure (Source of Truth)

```text
agentic-subagents-registry/
├── README.md                            # What this registry is, how to contribute
├── CHANGELOG.md                         # Versioned history of agent changes
├── agents/                              # All agent definitions, organized by domain
│   ├── advisory/
│   │   ├── risk-analyst.md              # Identifies risks, rates severity, suggests mitigations
│   │   ├── assumption-checker.md        # Surfaces hidden assumptions in plans/proposals
│   │   └── contrarian.md               # Argues the opposite position to stress-test reasoning
│   ├── delivery/
│   │   ├── spec-writer.md              # Converts requirements into structured specifications
│   │   └── qa-reviewer.md             # Reviews deliverables against acceptance criteria
│   ├── research/
│   │   ├── evidence-extractor.md       # Pulls structured evidence from source material
│   │   └── source-triage.md           # Rates source reliability and relevance
│   └── domain/
│       ├── procurement-lcsp.md         # Specialist in LCSP procurement regulations
│       └── public-sector-compliance.md # Public sector regulatory compliance checker
└── packs/                               # Predefined agent bundles for common use cases
    ├── core-advisory.yaml               # risk-analyst + assumption-checker + contrarian
    ├── product-build.yaml               # spec-writer + qa-reviewer
    └── public-sector.yaml               # procurement-lcsp + public-sector-compliance
```

### Key Rules for the Registry

- Each agent is a single `.md` file inside `agents/<category>/`.
- The file name is the agent's canonical identifier: `<category>/<name>` (without `.md`).
- Each agent file is self-contained: it includes the system prompt, role description, constraints, and any examples.
- Packs (`packs/*.yaml`) are convenience groupings. They list agent paths and are informational, not authoritative. The manifest in each project is what determines selection.
- The registry is a **standalone git repo**. It has its own commit history, tags, and (optionally) releases.

### Agent File Conventions

Each `.md` file in the registry follows this internal structure:

```markdown
# <Agent Name>

## Role
<One-line description of what this agent does>

## System Prompt
<The full system prompt used when invoking this agent>

## Constraints
- <Constraint 1>
- <Constraint 2>

## Examples
<Optional: input/output examples demonstrating expected behavior>

## Metadata
- Category: <category>
- Version: <semver or date>
- Author: <who created/maintains this agent>
```

---

## 3) Project Repo Structure (Selection Layer)

Any project that uses Claude Code sub-agents follows this layout. Example using `agentic-business-skill-development/`:

```text
agentic-business-skill-development/
├── .claude/
│   ├── agents/                          # Generated by sync script. Do not edit manually.
│   │   ├── risk-analyst.md              # Copied from registry: advisory/risk-analyst
│   │   ├── assumption-checker.md        # Copied from registry: advisory/assumption-checker
│   │   ├── spec-writer.md              # Copied from registry: delivery/spec-writer
│   │   ├── qa-reviewer.md             # Copied from registry: delivery/qa-reviewer
│   │   └── .gitkeep                    # Placeholder if agents/ is initially empty
│   ├── agents.manifest.yaml            # Declarative: which agents this project uses
│   └── settings.local.json             # Optional: Claude Code local settings
├── scripts/
│   └── sync-claude-agents.sh           # Reads manifest, copies from registry
├── CLAUDE.md                            # Project-level instructions for Claude Code
├── README.md
├── agents/                              # Project-specific agent implementations (code, not prompts)
├── prompts/                             # Project-specific prompt templates
├── skills/                              # Reusable skill modules
├── templates/                           # Task/structure templates
├── docs/                                # Architecture decisions, references
├── experiments/                         # Temporary exploration work
└── learning-path/
    └── ...
```

### What Gets Committed

| Path | Committed? | Reason |
|---|---|---|
| `.claude/agents.manifest.yaml` | Yes | Declares agent selection. Core to reproducibility. |
| `.claude/agents/*.md` | Optional | Commit if you want full reproducibility without local registry. Add to `.gitignore` if you prefer sync-on-clone. |
| `scripts/sync-claude-agents.sh` | Yes | Must be available to anyone cloning the project. |

### Separation of Concerns

- `.claude/agents/` contains **prompt-based sub-agent definitions** synced from the global registry. These are consumed by Claude Code at invocation time.
- `agents/` (project root) contains **code-level agent implementations** -- orchestration logic, API wrappers, tool definitions. These are project-specific and not part of the registry.

Do not confuse the two directories. They serve different purposes.

---

## 4) Manifest Format (.claude/agents.manifest.yaml)

### Full Example

```yaml
# .claude/agents.manifest.yaml
# Declares which sub-agents this project uses from the global registry.
# Consumed by scripts/sync-claude-agents.sh to populate .claude/agents/.

manifest_version: 1
project: agentic-business-skill-development

registry:
  # Relative path from this project's root to the registry repo root.
  # Adjust based on your local directory layout.
  path: ../agentic-subagents-registry

  # Directory inside the registry where agent .md files live.
  agents_dir: agents

# Agents to include. Paths are relative to registry's agents_dir, without .md extension.
include:
  - advisory/risk-analyst
  - advisory/assumption-checker
  - delivery/spec-writer
  - delivery/qa-reviewer

# Optional: per-project overrides for specific agents.
# Use sparingly. If an override becomes permanent, consider upstreaming to the registry.
# overrides:
#   delivery/spec-writer:
#     add_context_files:
#       - docs/00-project/vision.md
#     prepend_to_prompt: |
#       This project follows a specific spec format. See vision.md for context.
```

### Format Rules

- `manifest_version`: Integer. Currently `1`. Increment on breaking format changes.
- `project`: String. The project name. Informational, used in sync output.
- `registry.path`: Relative path from the project root to the registry root. Resolved at sync time.
- `registry.agents_dir`: Subdirectory within the registry containing agent files. Almost always `agents`.
- `include`: List of agent identifiers. Format: `<category>/<agent-name>`. No `.md` extension. Order does not matter.
- `overrides`: Optional map. Keys are agent identifiers matching `include` entries. Values are project-specific modifications. Keep these minimal and document why they exist.

### What the Manifest Does NOT Do

- It does not specify agent execution order or orchestration logic.
- It does not define inter-agent communication patterns.
- It does not replace the registry. If an agent is not in the registry, it cannot be referenced here.

---

## 5) Sync Script (scripts/sync-claude-agents.sh)

### Full Script

```bash
#!/usr/bin/env bash
# scripts/sync-claude-agents.sh
#
# Reads .claude/agents.manifest.yaml and copies the declared agents
# from the global registry into .claude/agents/.
#
# Usage: bash scripts/sync-claude-agents.sh
#
# Requirements:
#   - The registry repo must exist at the path specified in the manifest.
#   - The manifest must have at least one include entry.
#
# This script is intentionally simple. It uses grep/sed/awk instead of
# a YAML parser to avoid external dependencies. This works because the
# manifest format is constrained and predictable.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST="$ROOT/.claude/agents.manifest.yaml"
OUT_DIR="$ROOT/.claude/agents"

# ─── Validate manifest exists ───────────────────────────────────────

if [[ ! -f "$MANIFEST" ]]; then
  echo "ERROR: Manifest not found: $MANIFEST" >&2
  exit 1
fi

# ─── Extract registry config from manifest ──────────────────────────

REG_PATH="$(grep -E '^\s*path:\s*' "$MANIFEST" | head -n1 | sed -E 's/^\s*path:\s*//')"
AGENTS_DIR="$(grep -E '^\s*agents_dir:\s*' "$MANIFEST" | head -n1 | sed -E 's/^\s*agents_dir:\s*//')"

if [[ -z "$REG_PATH" ]]; then
  echo "ERROR: registry.path not found in manifest." >&2
  exit 1
fi

if [[ -z "$AGENTS_DIR" ]]; then
  echo "ERROR: registry.agents_dir not found in manifest." >&2
  exit 1
fi

# ─── Resolve absolute paths ─────────────────────────────────────────

REG_ABS="$(cd "$ROOT" && cd "$REG_PATH" && pwd)"
SRC_BASE="$REG_ABS/$AGENTS_DIR"

if [[ ! -d "$SRC_BASE" ]]; then
  echo "ERROR: Registry agents directory not found: $SRC_BASE" >&2
  exit 1
fi

# ─── Prepare output directory ───────────────────────────────────────

mkdir -p "$OUT_DIR"

# Clean previously synced agent files (preserve .gitkeep and non-.md files)
find "$OUT_DIR" -type f -name "*.md" -delete

# ─── Parse include list from manifest ───────────────────────────────

INCLUDE_LINES=$(awk '
  $1=="include:" { in_include=1; next }
  in_include==1 && $0 ~ /^\s*-\s*/ { print $0; next }
  in_include==1 && $0 !~ /^\s*-\s*/ { exit }
' "$MANIFEST")

if [[ -z "$INCLUDE_LINES" ]]; then
  echo "ERROR: No include entries found in manifest." >&2
  exit 1
fi

# ─── Copy each declared agent ───────────────────────────────────────

echo "Syncing agents from: $SRC_BASE"
echo "  Output: $OUT_DIR"
echo ""

COUNT=0

while IFS= read -r line; do
  # Extract the agent path (strip leading whitespace, dash, and whitespace)
  rel=$(echo "$line" | sed -E 's/^\s*-\s*//')

  # Skip empty lines
  [[ -z "$rel" ]] && continue

  src="$SRC_BASE/$rel.md"

  if [[ ! -f "$src" ]]; then
    echo "ERROR: Agent not found in registry: $src" >&2
    echo "  Referenced in manifest as: $rel" >&2
    exit 1
  fi

  cp "$src" "$OUT_DIR/"
  echo "  + $rel"
  COUNT=$((COUNT + 1))
done <<< "$INCLUDE_LINES"

echo ""
echo "Done. $COUNT agent(s) synced to .claude/agents/"
```

### Script Behavior Summary

| Step | Action |
|---|---|
| 1 | Locate manifest at `.claude/agents.manifest.yaml` |
| 2 | Extract `registry.path` and `registry.agents_dir` |
| 3 | Resolve the absolute path to the registry's agents directory |
| 4 | Clean `.claude/agents/*.md` (remove stale agents from previous syncs) |
| 5 | Parse the `include:` list from the manifest |
| 6 | For each included agent, copy `<registry>/agents/<path>.md` into `.claude/agents/` |
| 7 | Fail hard on any missing agent (no partial syncs) |

### Why Not a YAML Parser?

The manifest format is deliberately constrained. A full YAML parser (like `yq`) adds an external dependency. The `grep`/`sed`/`awk` approach works reliably for this specific, predictable format. If the manifest format grows more complex in future versions, migrate to `yq` or a Python script.

---

## 6) Naming and Governance Rules

### Naming Policy

| Rule | Example | Rationale |
|---|---|---|
| **kebab-case for file names** | `risk-analyst.md`, not `RiskAnalyst.md` | Consistent, filesystem-safe, URL-friendly |
| **kebab-case for categories** | `advisory/`, `delivery/` | Matches file naming convention |
| **No spaces, no underscores** | `spec-writer`, not `spec_writer` | Single convention, no ambiguity |
| **Descriptive, role-based names** | `assumption-checker`, not `checker-v2` | Name describes what the agent does, not its version |
| **No version suffixes in names** | Use git history for versioning | Avoids `risk-analyst-v2` proliferating alongside `risk-analyst` |

### Collision Prevention

When an agent is copied from `registry/agents/advisory/risk-analyst.md` into `.claude/agents/`, it lands as `.claude/agents/risk-analyst.md` (flat, no subdirectories). This means:

- **Agent names must be globally unique across all categories.**
- If `advisory/risk-analyst.md` and `research/risk-analyst.md` both exist, the sync script will overwrite one with the other.
- **Rule:** Before adding an agent to the registry, check that no other category already has an agent with the same file name.

If a collision is unavoidable, prefix with the category: `advisory-risk-analyst.md`. But prefer unique names first.

### Governance Rules

1. **Registry is the canonical source.** If an agent definition exists in both the registry and a project, the registry version wins on next sync.

2. **Overrides are project-local and temporary.** If a project needs a modified version of a registry agent, use the `overrides` section in the manifest. If the override becomes permanent, upstream it to the registry.

3. **No orphan agents in projects.** Every agent in `.claude/agents/` must trace back to either:
   - An `include` entry in the manifest (synced from registry), or
   - A documented project-local agent (stored elsewhere and explicitly noted).

4. **One agent, one file.** Do not combine multiple agent definitions in a single `.md` file. Each agent gets its own file.

5. **Description required.** Every agent `.md` file must include a `## Role` section with a one-line description. This serves as both documentation and quick-scan index.

6. **Deletion protocol.** To remove an agent from the registry:
   - Check all project manifests that reference it (search across repos).
   - Remove from manifests first.
   - Then delete from registry.
   - Document the removal in `CHANGELOG.md`.

7. **Priority order for conflicts:**
   1. Project manifest `overrides` (highest priority, project-specific)
   2. Registry agent definition (canonical baseline)
   3. Pack definitions (informational groupings, lowest priority)

---

## 7) Operational Protocol (5 Lines)

```text
1. Add or update agents in agentic-subagents-registry/agents/ (source of truth).
2. In each project, edit .claude/agents.manifest.yaml (include only what the project needs).
3. Run: bash scripts/sync-claude-agents.sh
4. Commit .claude/agents.manifest.yaml (and optionally .claude/agents/ for full reproducibility).
5. Avoid collisions: project-specific agent variants go in overrides, documented and temporary.
```

This is the entire operational loop. Steps 1-2 are design-time. Step 3 is a mechanical bridge. Steps 4-5 are discipline.

---

## 8) Optional Variants (Submodule, Symlink)

### Variant A: Git Submodule

Instead of a sync script, embed the registry as a git submodule inside each project.

```bash
git submodule add ../agentic-subagents-registry .claude/registry
```

Then `.claude/agents/` either symlinks or copies from `.claude/registry/agents/`.

**Pros:**

- Version-locked. Each project pins a specific commit of the registry.
- No external script needed for the basic case.
- `git submodule update --init` is a well-known pattern.

**Cons:**

- Submodules add cognitive overhead. Many developers find them confusing.
- Still need a selection mechanism (the submodule brings ALL agents, not just the ones you want).
- Nested git repos complicate CI/CD pipelines.
- `git clone --recursive` is easy to forget, leading to broken clones.

**Verdict:** Viable for teams already comfortable with submodules. Adds complexity without solving the selection problem. The manifest + sync approach is simpler and more explicit.

### Variant B: Symlinks

Instead of copying files, the sync script creates symlinks from `.claude/agents/` to the registry.

```bash
ln -sf "$SRC_BASE/$rel.md" "$OUT_DIR/"
```

**Pros:**

- Zero duplication. Changes in the registry are immediately visible.
- No need to re-run sync after editing an agent in the registry.

**Cons:**

- Symlinks break if the registry path changes or is not present on the machine.
- Not portable across machines with different directory layouts.
- Some tools and CI environments do not follow symlinks correctly.
- Harder to commit `.claude/agents/` for offline reproducibility.
- The "immediacy" is also a risk: untested registry changes propagate instantly.

**Verdict:** Convenient during active development on a single machine. Not recommended for shared or CI environments. Use copy-based sync as the default; symlinks as an opt-in for local dev speed.

### Variant C: Pack-Based Include

Instead of listing individual agents, reference a pack from the registry.

```yaml
include_packs:
  - core-advisory
  - product-build
```

The sync script resolves packs to individual agents before copying.

**Pros:**

- Shorter manifests for projects that use standard agent groupings.
- Encourages standardization of agent bundles across projects.

**Cons:**

- Adds indirection. Reading the manifest no longer tells you exactly which agents are present.
- Pack changes in the registry silently affect all projects using that pack.
- Requires the sync script to parse an additional file format.

**Verdict:** Useful as a convenience layer on top of explicit includes. Never use packs as the only inclusion mechanism. Always allow explicit `include` to override or supplement packs. Implement only after the basic manifest + sync pattern is stable.

### Comparison Table

| Variant | Portability | Simplicity | Reproducibility | Selection Control |
|---|---|---|---|---|
| **Copy (recommended)** | High | High | High (if committed) | Explicit |
| Submodule | Medium | Low | High (pinned commit) | Requires additional layer |
| Symlink | Low | Medium | Low | Explicit |
| Pack-based | High | Medium | Medium (pack can change) | Indirect |

---

## Appendix: Applying This to agentic-business-skill-development

To adopt this architecture in the current repo, the minimum changes are:

1. Create `.claude/agents.manifest.yaml` with the desired agent selection.
2. Create `.claude/agents/.gitkeep` as a placeholder.
3. Create `scripts/sync-claude-agents.sh` with the script from section 5.
4. Add to `CLAUDE.md`: "Project sub-agents are managed via `.claude/agents.manifest.yaml` and synced from the global registry using `scripts/sync-claude-agents.sh`."
5. Create the registry repo `agentic-subagents-registry/` as a sibling directory with at least one agent to test the sync.

After these steps, the operational protocol from section 7 applies.
