# ANTIGRAVITY.md

Coordination protocol for using Antigravity (Gemini-based) in this project.

## Role

Antigravity researches. Claude synthesizes and decides. Codex implements. Do not use Antigravity for output generation or decision-making.

Antigravity is most effective for:
- Fast background research: market context, terminology, prior art, regulatory landscape
- ICP validation: finding evidence of the pain, language patterns, community discussions
- Competitive landscape mapping: feature comparisons, positioning analysis, pricing benchmarks
- Generating alternative framings or comparisons quickly for Claude to select from
- Scaffolding initial document structures from a brief, for Claude to refine

Antigravity is not reliable for:
- Making final decisions or tradeoff judgments (Claude does this)
- Updating project state (PROGRESS.md, DECISIONS.md, CONTEXT.md)
- Implementing code (use Codex)
- Anything requiring sequential, project-specific memory across turns

---

## Prime before researching (REQUIRED)

Unprimed research produces generic output. Always give Antigravity project context before a research task. The output quality difference is significant.

**Unprimed example** (bad):
```
What messaging resonates with sales leaders?
```

**Primed example** (good):
```
PRODUCT:
An automated proposal pipeline for B2B consulting and SaaS companies. It generates personalized, structured proposals in under 30 minutes using client intake data. Key differentiator: proposals match the client's specific industry language and pain profile.

ICP:
Head of Sales or VP Revenue at B2B SaaS, 20-200 employees, Series A-C. Pain: losing deals to competitors because proposals are slow (3+ days) and generic. Trigger: recent lost deal or incoming VP who wants to professionalize the sales process.

RESEARCH QUESTION:
What specific language do sales leaders use to describe the pain of slow, generic proposals? Look for community posts, reviews of alternatives, and job descriptions.

FORMAT REQUESTED:
Bullet list of exact phrases and quotes, sourced if possible. No editorializing.

DO NOT:
Add recommendations, propose solutions, or include general sales leadership content unrelated to the proposal creation pain.
```

### Prime template

```
PRODUCT:
[What it does and what makes it different — from docs/CONTEXT.md §2]

ICP:
[Who the buyer is, their pain, their trigger — from docs/CONTEXT.md §4]

COMPETITIVE CONTEXT (include only if relevant to this query):
[Main alternatives and how we position — from docs/CONTEXT.md §6]

RESEARCH QUESTION:
[Single clear question — not a conversation starter]

FORMAT REQUESTED:
[bullet list / table / brief summary / quotes / structured comparison]

DO NOT:
[List what you don't want — opinions, recommendations, generic content, unrelated topics]
```

---

## How to surface findings without noise

Antigravity output is a research dump, not a recommendation. Process it through Claude before it influences anything.

After receiving Antigravity output:
1. Extract only what is factually useful and specifically relevant to the ICP and product
2. Discard generic content, unsupported claims, and anything that contradicts known facts in CONTEXT.md
3. If the research influences a decision → log the decision in `docs/DECISIONS.md` (Claude writes the entry)
4. If the research changes understanding of ICP or competitive context → update `docs/CONTEXT.md` (Claude updates)
5. If the research surfaces a new task → add it to `docs/PROGRESS.md`
6. Do not commit raw Antigravity dumps to the repo

---

## When to use Antigravity (vs. Claude alone)

| Task | Use Antigravity | Why |
|---|---|---|
| "What do our ICP say about X pain?" | Yes | Needs external evidence, not internal reasoning |
| "How do competitors price?" | Yes | Needs current external data |
| "What should our positioning be?" | No | Requires judgment, not research |
| "Draft an outline for this doc" | Optionally | Claude can do this; use Antigravity only if breadth helps |
| "What are the tradeoffs of option A vs B?" | No | Claude reasons better on known context |
| "Find real customer language for X pain" | Yes | External language patterns need external search |

---

## Rule: state and decisions always go through Claude

Antigravity never writes directly to any SOT file. If Antigravity output influences:
- A design or product decision → log in `docs/DECISIONS.md` (Claude writes)
- Project scope or ICP understanding → update `docs/CONTEXT.md` (Claude updates)
- Task state → update `docs/PROGRESS.md` (Claude updates)

---

## Anti-patterns

- Sending a research question without priming (product + ICP context minimum)
- Trusting Antigravity output for domain-specific facts without validation
- Using Antigravity to generate project memory (CONTEXT.md must be written by a human or Claude with full context)
- Committing raw research dumps as documentation
- Relying on Antigravity for reasoning that depends on project-specific decisions already made
