# Hormozi Team Project v1

## Purpose
Learning mini-project for applying Hormozi/Brunson business strategy frameworks using agentic systems and the INFUSE methodology.

## Knowledge Base
Located in `knowledge/` directory. 10 markdown files (~2.1 MB, ~34,830 lines total):
- hormozi_100m_leads.md - Lead generation strategies
- hormozi_100m_offers.md - Offer creation framework
- hormozi_and_russell_teoria_unificada.md - Unified theory synthesis
- hormozi_course_theory.md - Course building theory
- hormozi_edukami_angle.md - Education positioning
- russell_clickFunnels_dotcomSecrets_FunnelBuilding.md - Funnel building
- russell_clickfunnels_leadFunnelsBook.md - Lead funnel mechanics
- russell_clickfunnels_narrativepsycho.md - Narrative psychology
- russell_clickfunnels_trafficBook.md - Traffic generation
- valdo_hormozi_product_validation_guide.md - Product validation

## Agent System

### Exercise 1 Agent (Methodology Expert)
**Primary agent:** `/agent hormozi-main-agent`
- Applies INFUSE methodology to business strategy questions
- References knowledge base for offer creation, lead generation, funnel building
- Systematic approach: Identity → Navigation → Flow → User Guidance → Signals → End Instructions
- Scope: Strategic advisor and framework expert

### Exercise 2 Agents (Document Production Team)
**Orchestrator:** `/agent hormozi-orchestrator`
- Coordinates document production workflow
- Runbook commands: `/run step1-context`, `/run step2-offer`, `/run step3-proposal`, `/status`
- Validates dependencies (Context → Offer → Proposal)
- Supports parallel execution for multiple clients

**Sibling agents (dispatched by orchestrator):**
1. `/agent hormozi-context-client-agent` - Synthesizes client inputs into Context Document
2. `/agent hormozi-offer-design-agent` - Designs offers using Value Equation (iterative v1→v2 workflow)
3. `/agent hormozi-proposal-design-agent` - Drafts proposals section-by-section with validation gates

**Templates:** Located in `templates/` folder
- `00.- Context_Client_Document_TEMPLATE.md` (5 sections)
- `1.- Offer_Design_Document_TEMPLATE.md` (12 sections)
- `2.- Proposal_Design_Document_TEMPLATE.md` (9 sections)
- `TEMPLATE-RULES.md` (formatting, validation gates, conventions)

**Outputs:** All production documents saved to `outputs/` folder

## Operating Rules
- Knowledge files are canonical reference (always read before generating outputs)
- Templates are read-only (agents read but never modify)
- Document production follows strict dependency chain: Context → Offer → Proposal
- NO case execution until Exercise 3/4 scope
- Project-scoped agents stay local to mini-project (not global .claude/agents/)

## Deliverable Naming Conventions
Future exercises may create:
- 00-[name].md - Foundational documents
- 01-[name].md - Exercise 1 outputs
- 02-[name].md - Exercise 2 outputs (sibling agents)

Do NOT create these until explicitly requested.

## Context Management
- Use `/clear` when switching between exercises
- Each exercise is self-contained
- Knowledge base persists across exercises
