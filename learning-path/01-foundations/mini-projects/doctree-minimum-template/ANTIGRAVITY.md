# ANTIGRAVITY.md

Coordination protocol for using Antigravity (Gemini-based) in this project.

## Ideal use cases

Antigravity is most effective for:
- Fast background research (market context, terminology, prior art)
- Scaffolding initial document structures from a brief
- Generating alternative framings or comparisons quickly
- Expanding a concept into multiple variants for Claude to select from

Antigravity is not reliable for:
- Making final decisions or tradeoff judgments (Claude does this)
- Updating project state (PROGRESS.md, DECISIONS.md)
- Implementing code (use Codex)
- Anything that requires project-specific memory

## How to surface findings without noise

Structure Antigravity output as a research dump, not a recommendation. Then Claude synthesizes.

Input to Antigravity:
```
RESEARCH QUESTION:
[single clear question — not a conversation]

FORMAT REQUESTED:
[bullet list / structured table / brief summary]

DO NOT:
[list what you don't want — opinions, recommendations, long narrative]
```

After receiving output:
1. Extract only what is factually relevant
2. Log any decision influenced by the research in `docs/DECISIONS.md`
3. Discard the rest — do not commit raw Antigravity dumps to the repo

## Rule: state and decisions always go through Claude

If Antigravity output influences:
- A design decision → log in `docs/DECISIONS.md` (Claude writes the entry)
- Project scope → update `docs/CONTEXT.md` (Claude updates)
- Task state → update `docs/PROGRESS.md` (Claude updates)

Antigravity never writes directly to any SOT file.

## Anti-patterns

- Using Antigravity to generate project memory (CONTEXT.md must be written by you)
- Trusting Antigravity output without validation for domain-specific facts
- Committing raw research dumps as documentation
- Relying on Antigravity for sequential, context-dependent reasoning
