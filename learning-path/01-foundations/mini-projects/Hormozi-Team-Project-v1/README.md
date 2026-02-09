# Hormozi Team Project v1

Mini-project for applying Hormozi/Brunson business strategy frameworks using agentic systems.

## What This Is

Learning exercise (Phase 01 - Foundations) combining:
- Alex Hormozi: $100M Offers, $100M Leads, Course Theory
- Russell Brunson: DotCom Secrets, Expert Secrets, Traffic Secrets, Lead Funnels
- Valdo: Product Validation Guide
- INFUSE methodology for systematic strategic thinking

## Quick Start

### Option 1: Strategic Consulting (Exercise 1)

1. Navigate to this directory:
   ```bash
   cd learning-path/01-foundations/mini-projects/Hormozi-Team-Project-v1/
   ```

2. Invoke the strategic agent:
   ```
   /agent hormozi-main-agent
   ```

3. Ask strategic questions about:
   - Offer creation and value stacking
   - Lead generation and traffic sources
   - Funnel architecture and optimization
   - Product validation and market signals

### Option 2: Document Production Workflow (Exercise 2)

1. Navigate to this directory (same as above)

2. Invoke the orchestrator:
   ```
   /agent hormozi-orchestrator
   ```

3. Run the document production workflow:
   ```
   /run step1-context    # Create Context Document
   /run step2-offer      # Create Offer Design Document (requires Context)
   /run step3-proposal   # Create Proposal Document (requires Context + Offer)
   ```

4. Check workflow status:
   ```
   /status               # See current state and next steps
   ```

See "How to Use the Agent Team" section below for detailed workflow instructions.

## Structure

```
knowledge/          # 10 .md files (~2.1 MB) - Hormozi/Brunson/Valdo knowledge base
templates/          # 3 document templates + rules + source DOCX files
  ├── 00.- Context_Client_Document_TEMPLATE.md
  ├── 1.- Offer_Design_Document_TEMPLATE.md
  ├── 2.- Proposal_Design_Document_TEMPLATE.md
  ├── TEMPLATE-RULES.md
  └── source-docx/  # Original DOCX files used to create templates
outputs/            # Production documents created by agent team
.claude/agents/     # 5 agent specifications
  ├── hormozi-main-agent.md           (Exercise 1 - strategic advisor)
  ├── hormozi-context-client-agent.md (Exercise 2 - Context synthesis)
  ├── hormozi-offer-design-agent.md   (Exercise 2 - Offer design)
  ├── hormozi-proposal-design-agent.md (Exercise 2 - Proposal drafting)
  └── hormozi-orchestrator.md         (Exercise 2 - Workflow coordinator)
CLAUDE.md           # Project memory and operating rules
README.md           # This file
```

## Knowledge Base

10 markdown files covering:
- Offer design and pricing (Hormozi $100M Offers)
- Lead generation and Core Four (Hormozi $100M Leads)
- Funnel building and value ladder (Brunson DotCom Secrets)
- Narrative psychology and belief shifting (Brunson Expert Secrets)
- Traffic strategies organic/paid (Brunson Traffic Secrets)
- Product validation signals (Valdo)

Total: ~34,830 lines of synthesized frameworks

## How to Use the Agent Team

### Workflow Overview

The document production pipeline follows this dependency chain:

```
Step 1: Context → Step 2: Offer → Step 3: Proposal
```

Each step **requires** the previous step to be completed.

### Step 1: Create Context Document

**Purpose:** Synthesize client inputs (transcripts, notes, discovery calls) into structured Context Document

**Command:**
```
/agent hormozi-orchestrator
/run step1-context
```

**You'll need to provide:**
- Client name (e.g., "RaulLopez", "MariaGarcia")
- Client source materials (transcripts, notes, discovery call recordings)

**Agent will produce:**
- `outputs/00.- Context_Client_Document_[ClientName].md`
- 5 sections: Transcripción literal, Problemas reales, Requisitos funcionales, Creencias profundas, Resultado deseado

**Next step:** Once approved, run `/run step2-offer`

---

### Step 2: Create Offer Design Document

**Purpose:** Design high-value offer using Hormozi Value Equation based on Context insights

**Prerequisites:** Context Document must be complete

**Command:**
```
/run step2-offer
```

**Workflow:** Iterative (automatic)
1. Agent produces v1 Offer Document
2. Agent self-critiques with scoring rubric (6 criteria)
3. Agent proposes v2 improvements
4. You decide: Proceed to v2? (Y/N)
5. Agent produces final version (v2 if approved, v1 if declined)

**Agent will produce:**
- `outputs/1.- Offer_Design_Document_[ClientName].md`
- 12 sections: ONE SENTENCE PITCH, NOMBRE, AVATAR DAY 1, OBSTÁCULOS, DREAM OUTCOME, TABLA RESUMEN, STACK, ARQUITECTURA (Plans), TOOLKIT, ESCALERA, GARANTÍA, VISIÓN, FRASE DE CIERRE

**Next step:** Once approved, run `/run step3-proposal`

---

### Step 3: Create Proposal Document

**Purpose:** Formalize Context + Offer into professional business proposal

**Prerequisites:** Both Context and Offer Documents must be complete

**Command:**
```
/run step3-proposal
```

**Workflow:** Section-by-section with validation gates
1. Agent drafts each section (1-9)
2. After each section: "Proceed to next section? (Y/N)"
3. **Mandatory Gate 1 (after Section 4.3):** Methodology approval required
4. **Mandatory Gate 2 (Section 8.1):** Guarantee stress test + pricing approval required

**Agent will produce:**
- `outputs/2.- Proposal_Design_Document_[ClientName].md`
- 9 sections: Objeto, Contexto, Objetivos, Metodología, Diseño, Resultados, Condiciones (pricing + guarantee), Contacto

**Completion:** All 3 documents saved to `outputs/` folder

---

### Checking Status

At any time, check workflow state:

```
/status               # Show status for all clients
/status [ClientName]  # Show status for specific client
```

Output shows:
- Which documents are complete (✓) or missing (✗)
- Current workflow state
- Progress (X/3 documents complete)
- Next step command

---

### Parallel Execution (Multiple Clients)

For processing multiple clients simultaneously:

```
/run parallel-all [client1,client2,client3]
```

Example:
```
/run parallel-all RaulLopez,MariaGarcia,JohnSmith
```

Orchestrator will dispatch appropriate agents for each client based on their current state.

---

### Troubleshooting

**"Cannot run step2-offer: Context Document not found"**
- Run `/run step1-context` first
- Verify Context Document saved to `outputs/` folder

**"Cannot run step3-proposal: Missing Offer Document"**
- Run `/run step2-offer` first
- Verify Offer Document saved to `outputs/` folder

**"Document already exists. Overwrite? (Y/N)"**
- Y: Proceed with new version (overwrites existing)
- N: Cancel, keep existing document

**Agent failed or produced incomplete document**
- Review agent output for specific errors
- Fix issues (missing inputs, invalid data)
- Re-run the step command

---

## Usage Notes

- **Exercise 1:** Strategic advisor (hormozi-main-agent) for methodology questions
- **Exercise 2:** Document production team (orchestrator + 3 sibling agents) ✓
- **Exercise 3-4:** Case execution and parallel client processing (future scope)
- Project-scoped (agents stay local to mini-project)
- Templates are read-only (never modified by agents)

## Exercise Progression

- **Exercise 1** (complete): Hormozi Main Agent + knowledge base ✓
- **Exercise 2** (complete): Agent team + templates + orchestrator ✓
- **Exercise 3** (future): Single client case execution
- **Exercise 4** (future): Parallel multi-client processing
