# Template Rules and Conventions

## Purpose

This document defines the rules, conventions, and validation gates for using the three document templates in the Hormozi Team Project agent system.

---

## Document Naming Conventions

### Production Documents

When creating documents from templates, use this naming pattern:

```
[Template Number].- [Document Type]_[ClientName].md
```

**Examples:**
- `00.- Context_Client_Document_RaulLopez.md`
- `1.- Offer_Design_Document_RaulLopez.md`
- `2.- Proposal_Design_Document_RaulLopez.md`

**Rules:**
- Use PascalCase for client names (no spaces): `RaulLopez`, `MariaGarcia`, `JohnSmith`
- Preserve the template number prefix: `00.-`, `1.-`, `2.-`
- Use underscore `_` to separate document type from client name
- All production documents go in `outputs/` folder

---

## Formatting Standards

### Emoji Markers

Preserve these emoji markers exactly as shown in templates:

| Emoji | Meaning | Usage |
|-------|---------|-------|
| 1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ | Section numbers | Main section headers in Context Document |
| 🎯 | Target/Goal | Dream outcomes, objectives |
| 💰 | Value/Pricing | Financial elements, pricing tables |
| ⚠️ | Warning/Important | Critical notes, cautions |
| 🔵 | Plan 1/Foundation | Foundation tier in offers |
| 🟢 | Plan 2/Intelligence | Advanced tier in offers |
| 🔴 | Plan 3/Premium | Optional premium tier |
| 🔒 | Guarantee | Guarantee sections |
| 👉 | Insight/Key Point | Synthesized insights, critical takeaways |
| 🚀 | Launch/Offer | Offer title headers |

**Rules:**
- Never replace emojis with text equivalents
- Use emojis consistently across all documents
- Don't add emojis not present in original templates

### Section Numbering

**Context Document:**
- Use emoji numbers: `## 1️⃣ Section Name`
- Subsections use `###` without emoji numbers

**Offer Document:**
- Use numeric prefixes: `## 00. ONE SENTENCE PITCH`, `## 0. NOMBRE`, `## 1. AVATAR`
- Optional sections can be omitted (e.g., Section 7 TOOLKIT)

**Proposal Document:**
- Use standard numbers: `## 1. Objeto`, `## 2. Contexto`
- Subsections use decimal notation: `### 3.1.`, `### 3.2.`
- Section 6 is optional

### Tables

Use Markdown pipe syntax for all tables:

```markdown
| Column 1 | Column 2 |
|----------|----------|
| Data 1   | Data 2   |
```

**Rules:**
- Align headers using pipes
- Use `---` for separator row
- For emphasis in cells, use `**bold**` within table cells
- Center alignment: `|:---:|` (optional, for comparison tables)

### Quotation Marks

**Direct client quotes** (Context Document Section 1):
```markdown
"This is a direct client quote"
```

**Emphasized statements** (throughout all documents):
```markdown
**"Strategic statement in bold quotes"**
```

**Rules:**
- Use standard double quotes `"`, not smart quotes `""`
- Client voice must always use quotation marks
- Bold quotes for emphasis in strategic sections

### Bold and Italic Emphasis

**Bold** for:
- Key concepts: `**infraestructura mínima imprescindible**`
- Strategic statements: `**No se promete. Se habilita.**`
- Important boundaries: `**nunca decide de forma autónoma**`

**Italic** for:
- Root causes: `*el conocimiento vive en la cabeza del fundador*`
- Subtle emphasis within sentences

**Rules:**
- Use `**text**` for bold, `*text*` for italic
- Don't overuse - reserve for genuinely critical elements
- Never use ALL CAPS for emphasis (except section headers if in original)

---

## Placeholder System

### Placeholder Format

All placeholders use this format:

```markdown
[PLACEHOLDER: Description of what goes here]
```

**Rules:**
- Always use ALL CAPS for `PLACEHOLDER`
- Always include colon after `PLACEHOLDER`
- Description should be specific enough to guide content creation
- Never leave placeholders in production documents

### Example Structures

Templates include example structures to guide content:

```markdown
**Example Structure:**
- Point 1
- Point 2
```

**Rules:**
- Examples are illustrative, not required verbatim
- Use examples to understand format and tone
- Remove `**Example Structure:**` sections from production documents

---

## Validation Gates

### Gate Format

Validation gates are marked as HTML comments:

```markdown
<!-- VALIDATION GATE: requirement description -->
```

**Rules:**
- Gates are agent checkpoints, not user-facing content
- Remove gate comments from final deliverables (optional)
- Some gates trigger mandatory user approval (see below)

### Context Document Gates

| Location | Gate | Type |
|----------|------|------|
| Section 1 | Must include at least 3 direct client quotes per subsection | Automated check |
| Section 2 | Must identify at least 3 distinct structural problems | Automated check |
| Final | Context Document must be approved before proceeding to Offer Design | User approval |

### Offer Document Gates

| Location | Gate | Type |
|----------|------|------|
| Section 00 | Pitch must articulate transformation, not features | Review |
| Section 1 | Avatar Day 1 must connect to Context Document Section 1-2 | Cross-reference |
| Section 3 | Dream Outcome must be specific to Day 90 timeframe | Review |
| Section 4 | Each problem must map to Context Document Section 2 | Cross-reference |
| Section 6 | Each plan must clearly differentiate value | Review |
| Section 9 | Guarantee must reduce risk significantly and be deliverable | Stress test |
| Final | Offer Document must be approved before proceeding to Proposal Design | User approval |

### Proposal Document Gates

| Location | Gate | Type |
|----------|------|------|
| Section 1 | Object must align with Context pain and Offer dream outcome | Cross-reference |
| Section 2 | Context must map to Context Document insights | Cross-reference |
| After 4.3 | **MANDATORY USER APPROVAL** - Section 5 cannot proceed until 4.1-4.3 validated | User approval |
| Section 8.1 | **MANDATORY USER APPROVAL** - Guarantee must pass stress test criteria review | User approval |
| Final | Proposal Document represents complete formalization | User approval |

---

## Cross-Document References

### Source Attribution

When content comes from another document, cite the source:

```markdown
<!-- SOURCE: Context Document Section 2, Problem 3 -->
```

**Rules:**
- Include source comments during drafting
- Optional to remove in final deliverable
- Helps agents maintain traceability

### Dependency Chain

**Strict order:**
1. Context Document (foundation) - MUST complete first
2. Offer Document (design) - REQUIRES completed Context
3. Proposal Document (formalization) - REQUIRES completed Context + Offer

**Rules:**
- Never skip documents in the chain
- Each document builds on insights from previous
- Validate dependencies before proceeding

---

## Prohibited Actions

### For Agents Using Templates

**DO NOT:**
- Create production documents without user request
- Generate placeholder content in production documents
- Skip validation gates
- Modify templates themselves (templates are read-only references)
- Create documents out of sequence (Context → Offer → Proposal)
- Invent case examples or client data
- Copy source DOCX content verbatim without synthesis

**DO:**
- Read templates before starting document production
- Replace all placeholders with real content
- Preserve emoji markers, formatting, and structure
- Request approval at validation gates
- Reference source documents (Context, Offer) when creating Proposal
- Synthesize and transform content, don't just copy

### For Users Managing Templates

**DO NOT:**
- Edit production documents in `templates/` folder
- Remove validation gates from templates
- Change template numbering or structure
- Create new templates without updating this rules document

**DO:**
- Keep templates in sync with `templates/TEMPLATE-RULES.md`
- Document any template changes in CLAUDE.md
- Store source DOCX files in `templates/source-docx/`
- Use `outputs/` folder for all production documents

---

## Version Control

### Template Versions

Current template versions:
- `00.- Context_Client_Document_TEMPLATE.md` - v1.0
- `1.- Offer_Design_Document_TEMPLATE.md` - v1.0
- `2.- Proposal_Design_Document_TEMPLATE.md` - v1.0
- `TEMPLATE-RULES.md` - v1.0

**Rules:**
- Increment version when template structure changes
- Document changes in CLAUDE.md
- Archive previous versions if significant changes made

### Production Document Versions

If a document requires revision:
- Create new version: `1.- Offer_Design_Document_RaulLopez_v2.md`
- Keep previous version for reference
- Document reason for revision in commit message

---

## Quality Checklist

Before finalizing any production document, verify:

### All Documents
- [ ] All placeholders replaced with content
- [ ] Emoji markers preserved
- [ ] Tables formatted correctly
- [ ] Section numbering correct
- [ ] No template example structures remain
- [ ] File named according to convention
- [ ] Saved in `outputs/` folder

### Context Document
- [ ] Minimum 3 client quotes per subsection in Section 1
- [ ] Minimum 3 structural problems identified in Section 2
- [ ] Client voice preserved (quotation marks)
- [ ] All insights (👉) synthesize deeper meaning
- [ ] Transformation stated as From → To

### Offer Document
- [ ] ONE SENTENCE PITCH is transformational, not feature-based
- [ ] AVATAR DAY 1 connects to Context
- [ ] DREAM OUTCOME specific to Day 90
- [ ] All plans clearly differentiated
- [ ] Guarantee objective and deliverable
- [ ] FRASE DE CIERRE is memorable

### Proposal Document
- [ ] Sections 1-2 align with Context and Offer
- [ ] Methodology (Section 4) approved before design (Section 5)
- [ ] Plans match Offer Document plans
- [ ] Pricing table complete and accurate
- [ ] Guarantee section approved (stress test criteria)
- [ ] Contact information correct

---

## Summary

These rules ensure:
- **Consistency** across all documents produced by the agent team
- **Traceability** from client context through to final proposal
- **Quality gates** prevent low-quality rushed outputs
- **Professional formatting** maintains credibility
- **Template integrity** preserves proven structures

When in doubt, consult the source DOCX files in `templates/source-docx/` or reference this document.
