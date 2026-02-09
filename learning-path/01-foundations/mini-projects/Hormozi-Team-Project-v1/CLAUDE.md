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
Primary agent: `/agent hormozi-main-agent`
- Applies INFUSE methodology to business strategy questions
- References knowledge base for offer creation, lead generation, funnel building
- Systematic approach: Identity → Navigation → Flow → User Guidance → Signals → End Instructions

## Operating Rules
- Knowledge files are canonical reference (always read before generating outputs)
- NO case exercises or practical examples (Exercise 1 scope)
- NO sibling agents yet (Exercise 2 scope)
- Project-scoped agents stay local to mini-project (not global .claude/agents/)
- Follow SUBAGENT-TEMPLATE.md patterns for consistency

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
