# CONTEXT.md

Master project knowledge document. Fill this completely at kickoff — agents will only be as useful as what is written here. Every section marked REQUIRED must be filled before involving any LLM tool in substantive work.

Update this file only when scope, product, ICP, or objectives change. It is not a task log.

---

## 1. Project goal (REQUIRED)

One sentence: what outcome does this project produce, and for whom?

> Example: Build an automated client proposal pipeline for a B2B consulting firm, reducing proposal creation time from 3 hours to 30 minutes.

[Your goal here]

---

## 2. Product / Service (REQUIRED)

What is the product or service this project builds, improves, or supports?

**What it is:**
[Describe the product or service in 2-4 sentences. Include: what it does, how it delivers value, what form it takes (SaaS, service, content, tool, API, physical product, etc.).]

**Current state:**
[Is this greenfield, an MVP, a mature product, or an internal tool? What exists today?]

**Key features or capabilities:**
- [Feature / capability 1]
- [Feature / capability 2]
- [Feature / capability 3]

**What makes it different:**
[One paragraph on the core differentiator — what does this product do that alternatives don't, or do better?]

---

## 3. Business model (REQUIRED)

How does this project generate or support revenue?

**Revenue model:**
[Subscription / transactional / usage-based / one-time / freemium / professional services / advertising / marketplace / other]

**Pricing (if known):**
[Price points, tiers, or pricing philosophy — e.g., "$99/mo per seat", "value-based pricing, avg. deal $15k", "free + paid add-ons"]

**Unit economics (if relevant):**
[LTV, CAC, margin, payback period — only fill if known and relevant to this project's decisions]

**Key metric this project moves:**
[The one number this project is designed to improve — e.g., conversion rate, churn, MRR, NPS, time-to-close, ROAS]

---

## 4. ICP — Ideal Customer Profile (REQUIRED)

The single most important context for agents writing any content, copy, or strategy.

**Who they are:**
[Job title / role, company type, company size, industry, geography]

> Example: Head of Sales or VP Revenue at B2B SaaS companies with 20-200 employees, Series A–C, primarily US and Western Europe.

**What they struggle with (pain):**
[The specific problem they feel urgently — described in their language, not yours]

> Example: They're losing deals to cheaper alternatives because their proposals take too long to produce and look generic. They know the problem but don't have the headcount to fix it.

**Job-to-be-done:**
[What outcome are they hiring this product/service to achieve?]

> Example: Close more enterprise deals faster without adding headcount.

**Buying trigger:**
[What event or situation makes them ready to buy now? What shifts them from "aware" to "actively looking"?]

> Example: They just lost a deal they should have won, or a new VP Sales is auditing the sales process.

**Objections they raise:**
[The 2-3 most common reasons they don't buy or delay]

- [Objection 1]
- [Objection 2]
- [Objection 3]

**Where they live (channels they trust):**
[LinkedIn / email / communities / events / podcasts / influencers / referrals / search]

---

## 5. Audience segments (OPTIONAL — fill if ICP has meaningful sub-segments)

Secondary or adjacent audiences that matter for this project.

| Segment | Who they are | How they differ from ICP | Why they matter |
|---|---|---|---|
| [Segment A] | [description] | [difference] | [why relevant] |
| [Segment B] | [description] | [difference] | [why relevant] |

---

## 6. Competitive context (REQUIRED if any competitive framing is in scope)

**Main alternatives:**
[What do people use instead? List 3-5: direct competitors, adjacent tools, DIY approaches, doing nothing]

| Alternative | What it does well | Where we win | Where we lose |
|---|---|---|---|
| [Alt 1] | [strength] | [our advantage] | [our weakness vs them] |
| [Alt 2] | [strength] | [our advantage] | [our weakness vs them] |
| [Alt 3] | [strength] | [our advantage] | [our weakness vs them] |

**Our positioning in one sentence:**
[For {ICP}, {product name} is the {category} that {key differentiation}, unlike {main alternative} which {their limitation}.]

---

## 7. Strategic objectives (REQUIRED)

What does success look like at the end of this project? Be specific enough that an agent can judge whether an output moves toward or away from these goals.

| Objective | Metric | Target | Timeframe |
|---|---|---|---|
| [Objective 1] | [how measured] | [specific number or state] | [by when] |
| [Objective 2] | [how measured] | [specific number or state] | [by when] |
| [Objective 3] | [how measured] | [specific number or state] | [by when] |

**Current phase:**
[ ] Discovery — defining the problem and solution
[ ] Build — creating the product or system
[ ] Launch — taking it to market
[ ] Growth — scaling what works
[ ] Optimize — improving metrics on a running system

---

## 8. Tech stack / Tools (REQUIRED for projects with a technical component)

**Languages and frameworks:**
[e.g., Python 3.11, FastAPI, React 18, TypeScript, Next.js 14]

**Infrastructure:**
[e.g., AWS (Lambda + RDS), Vercel, Supabase, self-hosted]

**Key SaaS tools in scope:**
[e.g., HubSpot CRM, Stripe, PostHog, OpenAI API, Anthropic API]

**AI tools and models used:**
[e.g., Claude Sonnet for drafting, Codex for implementation, Antigravity for research, claude-haiku for classification]

**Constraints the tech stack creates:**
[e.g., "Must stay within Vercel free tier", "CRM data cannot leave EU", "Must work without a database for v1"]

---

## 9. Channels (OPTIONAL — fill if relevant to deliverables)

How the product or service reaches customers, and through what channels this project operates.

**Acquisition channels:**
[Where customers come from — e.g., outbound SDR, LinkedIn organic, SEO, paid search, partnerships, referrals]

**Distribution / delivery channels:**
[How the product or service is delivered — e.g., web app, email, Slack bot, PDF, live workshop]

**Communication channels in use for this project:**
[e.g., Slack workspace #project-name, Linear for tasks, Notion for shared docs, email with client]

---

## 10. Team / Collaborators (REQUIRED if more than solo)

| Person | Role | Responsibilities | Tools they use | Contact |
|---|---|---|---|---|
| [Name] | [Lead / PM / Dev / Designer / Client] | [what they own] | [Claude / Codex / Antigravity / none] | [Slack / email] |
| [Name] | [role] | [responsibilities] | [tools] | [contact] |

**Decision-making protocol:**
[Who approves final deliverables? Who can unblock blockers? Who is the escalation point?]

---

## 11. Scope (REQUIRED)

What is explicitly included in this project:

- [Deliverable or capability 1]
- [Deliverable or capability 2]
- [Deliverable or capability 3]

## Out of scope

What is explicitly excluded:

- [Excluded item 1 — and why, if not obvious]
- [Excluded item 2]

---

## 12. Assumptions and constraints (REQUIRED)

**Assumptions** — facts treated as given without requiring proof:
- [Assumption 1]
- [Assumption 2]

**Constraints** — hard limits that shape implementation:
- [Technical, time, resource, or compliance constraint]
- [Another constraint]

---

## 13. Links and references

- [Primary doc, brief, or spec — link]
- [Related project or repo]
- [External reference — market research, competitor URL, client doc]
- [docs/DECISIONS.md] — decisions made during this project
- [docs/SPECS.md] — detailed requirements and acceptance criteria

---

Last updated: [YYYY-MM-DD]
Updated by: [name or tool]
