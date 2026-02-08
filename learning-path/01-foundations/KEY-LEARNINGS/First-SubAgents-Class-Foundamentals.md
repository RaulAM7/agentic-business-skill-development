# First Sub-agents Class — Fundamentals

## What a Sub-agent Is (and Is Not)

A sub-agent is a persistent, reusable cognitive specialization that can be invoked by another agent to contribute a specific perspective or type of reasoning.

A sub-agent:
- Provides judgment, analysis, or perspective
- Does not control workflow or make final decisions
- Does not plan end-to-end strategies
- Does not operate autonomously

A sub-agent is NOT:
- A long prompt
- A role-play persona
- A task executor
- An autonomous agent

Sub-agents exist to improve decision quality, not to increase throughput.

---

## Agents vs Sub-agents

Agents:
- Temporary and disposable
- Optimized for execution and volume
- Used for batch work and task completion

Sub-agents:
- Persistent and reusable
- Optimized for judgment and perspective
- Used as advisory components

Think of agents as interns executing tasks, and sub-agents as an advisory board reviewing decisions.

---

## Core Design Principle

A sub-agent encapsulates one type of thinking.

If a sub-agent:
- Mixes multiple cognitive roles
- Both analyzes and decides
- Attempts to guide the overall process

Then it is incorrectly designed.

---

## Specialization and Scope

Sub-agents must have:
- A narrow cognitive scope
- A single dominant reasoning mode
- Explicit boundaries

Good sub-agents answer one recurring question well.
Bad sub-agents try to answer many questions poorly.

---

## Persistence and Reuse

Sub-agents are defined as files and persist across sessions.
They represent institutionalized criteria, not conversation state.

They are:
- Versionable
- Auditable
- Portable across projects

This makes them long-lived assets rather than ad-hoc prompts.

---

## Where Sub-agents Live

Claude Code discovers sub-agents from:
- .claude/agents/ (project-level, versioned)
- ~/.claude/agents/ (user-level, optional)

Project-level sub-agents should be minimal and curated.
Global registries act as source-of-truth libraries.

---

## Sub-agent File Anatomy

Each sub-agent is a markdown file composed of:
1. YAML frontmatter (identity and control)
2. A structured system prompt (cognitive specification)

Only name and description are required, but professional sub-agents usually also fix the model.

---

## YAML Frontmatter Fundamentals

Required:
- name: stable, lowercase, hyphenated identifier
- description: operational trigger describing when to delegate

Common best practice:
- model: fixed when the sub-agent represents judgment or criteria

Other fields are optional and should be added only when justified.

---

## System Prompt Fundamentals

The system prompt defines how the sub-agent thinks.

Effective sub-agents consistently include:
- Purpose: why the sub-agent exists
- Capabilities: types of reasoning it performs
- Constraints: what it must not do
- Output expectations: how results should be delivered

Optional sections may include:
- Behavioral traits (discipline, rigor, conservatism)
- Knowledge base or assumptions (standards taken as given)
- Signals and adaptation (how to react to poor inputs)

---

## Constraints Are Mandatory

Explicit constraints prevent:
- Overreach
- Hallucinated decisions
- Strategic leakage

A sub-agent without constraints is a system liability.

---

## Model Selection

Sub-agents that encode judgment or criteria should fix the model.
This ensures stable behavior independent of parent-agent changes.

Default practice:
- sonnet for most advisory sub-agents
- opus for critical, high-stakes judgment
- inherit only for low-risk or experimental cases

---

## Output Philosophy

Sub-agent outputs should be:
- Structured
- Concise
- Factual
- Suitable for downstream decision-making

They are intermediate artifacts, not final answers.

---

## Professional vs Amateur Usage

Amateur usage:
- Prompt blobs
- Role-play personas
- Mixed responsibilities
- Implicit assumptions

Professional usage:
- Explicit scope
- Single cognitive function
- Clear constraints
- Reusable, versioned assets

---

## Key Mental Shift

Sub-agents are not assistants.
They are institutionalized ways of thinking.

You are not building personalities.
You are encoding judgment.

---

## End of Fundamentals

This class establishes the conceptual foundation.
Design and orchestration come next.
