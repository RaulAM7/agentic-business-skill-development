# skills/

Reusable cognitive modules for this project. A skill is a scoped, documented capability that can be invoked repeatedly across tasks without reinvention.

## When to create a skill

Create a skill only when:
1. You have performed the same cognitive task manually at least twice
2. The task is stable enough to encode (inputs, outputs, and steps do not change per invocation)
3. The skill can be reused in a different project with minimal modification

Do not create skills for one-off tasks. Inline handling is fine for tasks you do once.

## Skill structure

Each skill lives in its own subdirectory:

```
skills/
└── skill-name/
    ├── skill.md          # Required: purpose, inputs, outputs, steps, DOD
    ├── examples/         # Required: at least one worked example
    └── assets/           # Optional: reference files, templates, or data used by the skill
```

## Naming convention

- Lowercase with hyphens: `update-progress`, `extract-decisions`, `write-brief`
- Verb-first: names describe an action, not a thing
- No version suffixes in the name (use git history for versioning)

## skill.md required sections

Every `skill.md` must include:

- **Purpose** — what this skill does and when to invoke it
- **Inputs** — what the caller must provide
- **Outputs** — what the skill produces
- **Steps** — ordered list of actions (tool calls, prompts, or sub-agent invocations)
- **Definition of Done** — testable conditions that confirm the skill completed correctly

## Definition of Done format

```
A skill run is complete when:
- [ ] [Testable condition 1]
- [ ] [Testable condition 2]
- [ ] [Testable condition 3]
```

## Future work: MCP integration

Skills defined here are currently Claude Code-native (prompt-based, run via sub-agents or inline). A future block (Phase 02: Skills and Orchestration) will cover:
- Wrapping skills as MCP tools
- Exposing skills to browser automation agents
- Skill registries and manifest-based selection

Do not build MCP wrappers now. Design skills as if they might become MCP tools later (clear inputs/outputs, no side effects beyond the documented scope), but do not add that complexity prematurely.

## Example skill

See `skill-example/` for a minimal working example: the `update-progress` skill.
