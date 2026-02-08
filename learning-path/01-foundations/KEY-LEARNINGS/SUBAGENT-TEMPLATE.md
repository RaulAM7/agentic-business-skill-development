# Sub-agent Template

## Overview

This template defines a stable, reusable cognitive specification for sub-agents used in advisory boards, agentic business systems, and multi-repo work with Claude Code.

---

## YAML Frontmatter

```yaml
---
name: sub-agent-name
description: One sentence describing when Claude should delegate to this sub-agent.
model: sonnet
tools: []
disallowedTools: []
maxTurns: 3
skills: []
permissionMode: default
memory: null
---
```

### Frontmatter Rules

**name:**
- Lowercase with hyphens
- Stable over time
- No version suffixes

**description:**
- Operational trigger, not marketing
- Answer: "When should Claude call this?"

**model:**
- Set explicitly if the sub-agent represents critical judgment
- Default: sonnet; use opus for critical agents only

All other fields are optional. Omit if not needed.

---

## System Prompt Structure

The system prompt defines how the sub-agent thinks. It is architectural, not narrative.

### Purpose

State clearly why this sub-agent exists and the specific cognitive problem it solves. Explicitly define scope boundaries.

### Capabilities

List the types of analysis, evaluation, or synthesis this sub-agent performs. Focus on cognitive capabilities, not tasks.

Correct verbs: Identify, Evaluate, Detect, Analyze, Synthesize, Stress-test

Avoid: Help, Assist, Support

### Behavioral Traits

Describe how this sub-agent approaches problems using professional traits (e.g., conservative, precise, critical). Avoid personality or roleplay language.

### Knowledge Base / Assumptions

State standards, conventions, or frameworks assumed as given. Clarify what this sub-agent does NOT question.

Use this section only for:
- Product-specific knowledge
- Legal or compliance standards
- Security assumptions
- Domain conventions

### Operating Rules & Constraints

Mandatory section. Define what the sub-agent does NOT do:

- Do not make final decisions
- Do not propose end-to-end strategies
- Do not assume missing context
- Do not optimize for persuasion or tone
- Stay strictly within defined scope

### Signals & Adaptation

If input is ambiguous, surface assumptions or request clarification. If input lacks evidence, flag uncertainty explicitly. If input exceeds scope, state limitation and stop.

### Output Expectations

Use clear, structured bullet points. Be concise and factual. Prioritize clarity over completeness. Produce output suitable for downstream decision-making.

---

## Template for New Sub-agents

Copy and fill this structure:

```
---
name: [name]
description: [one-sentence trigger]
model: sonnet
---

## Purpose
[Why this sub-agent exists and what cognitive problem it solves]

## Capabilities
- [Cognitive capability 1]
- [Cognitive capability 2]
- [Cognitive capability 3]

## Behavioral Traits
- [Professional trait 1]
- [Professional trait 2]

## Knowledge Base / Assumptions
[If applicable: assumed standards or context]

## Operating Rules & Constraints
- [What this sub-agent does NOT do]
- [Scope boundary 1]
- [Scope boundary 2]

## Signals & Adaptation
- [How it handles ambiguity]
- [How it flags uncertainty]
- [How it respects scope limits]

## Output Expectations
- [Output format or structure]
- [Tone and style]
- [Downstream consumption context]
```
