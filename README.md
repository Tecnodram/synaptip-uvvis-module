# SynAptIp Scientific Interoperability Platform — UV-VIS Module

> **Exploratory prototype documentation — Phase 0 / Phase 1 only**

**Repository positioning statement:**  
Exploratory scientific interoperability prototype for UV-VIS laboratory automation and parametric carousel adaptation.

This repository is the initial public-safe scaffold for an exploratory interoperability project focused on reverse-engineering and parametric documentation workflows for a UV-VIS module adapter concept.

At this stage, the repository contains **research organization, traceability, reverse-engineering templates, and a starter OpenSCAD file only**. It does **not** contain validated fitment, validated optical performance, final tolerances, manufacturer endorsement, or finalized compatibility claims.

## Current scope

The repository currently covers:

- **Phase 0 — Research & Traceability**
  - repository organization
  - documentation templates
  - prompt traceability
  - measurement capture templates
  - public-safe legal and safety framing
- **Phase 1 — Reverse Engineering**
  - generalized geometry reconstruction templates
  - indexing-analysis templates
  - an initial parametric OpenSCAD starter file

## Explicitly out of scope for this initial scaffold

- final compatibility claims
- validated tolerances
- optical validation conclusions
- manufacturer logos or branding assets
- sensitive institutional data
- regulated laboratory procedures
- confidential equipment identifiers or unpublished research data

## Source hierarchy

This repository distinguishes between:

1. **Original working source** — `Documents/Proyecto.docx`  
   Local source material containing early notes, rough observations, and contextual information that may require sanitization before any public release.
2. **Authoritative operational source** — `Master plan 1.txt`  
   The Phase-oriented project synthesis used to guide this repository scaffold.
3. **Public repository artifacts** — the files tracked in this scaffold  
   Generalized, public-safe, versioned documentation derived from the project sources.

## Repository map

| Path | Purpose |
| --- | --- |
| `docs/` | public-safe project notes and documentation templates |
| `openscad/` | parametric CAD source |
| `measurements/` | blank measurement templates and future sanitized datasets |
| `prompts/` | AI prompt traceability records |
| `validation/` | placeholder area for future public-safe validation summaries |
| `prototypes/` | future prototype records |
| `reports/` | future public-safe reports |
| `docs/` | public-safe project notes, workflow templates, source governance, and review logs |
| `references/` | future public-safe reference index |
| `legal/` | legal and safety disclaimers |
| `ethics/` | responsible-publication notes |
| `github/` | repository governance templates |
| `exports/`, `stl/` | future generated artifacts |

## Traceability principles

All design work in this repository should remain:

1. **Versioned** — changes tracked through Git.
2. **Auditable** — prompts, measurements, decisions, and model revisions logged.
3. **Reviewable** — AI-assisted outputs remain subject to human engineering review.
4. **Public-safe** — sensitive, confidential, or regulated information is excluded.

## Initial file set

- `VERSION`
- `CHANGELOG.md`
- `docs/PROJECT_SCOPE.md`
- `docs/ENGINEERING_WORKFLOW_TEMPLATE.md`
- `docs/REVERSE_ENGINEERING_TEMPLATE.md`
- `docs/DECISION_LOG_TEMPLATE.md`
- `docs/SOURCE_HIERARCHY.md`
- `docs/DOCUMENT_REGISTER_TEMPLATE.csv`
- `prompts/prompt_traceability_log.csv`
- `measurements/measurement_log_template.csv`
- `docs/PHOTO_REVIEW_LOG_TEMPLATE.csv`
- `legal/SAFETY_AND_LEGAL_DISCLAIMER.md`
- `ethics/PUBLICATION_ETHICS.md`
- `openscad/uvvis_carousel_adapter_v0_1_initial_starter.scad`
- `openscad/uvvis_carousel_adapter_v0_2_reverse_engineering_reference.scad`
- `openscad/uvvis_carousel_adapter_v0_3_six_position_layout.scad`
- `openscad/uvvis_carousel_adapter_v0_4_measured_refinement.scad`
- `openscad/uvvis_carousel_mechanism_test_v0_1.scad`
- `docs/CAD_VERSIONING_POLICY.md`

## Status

- Repository maturity: **initial scaffold**
- Documentation maturity: **template-level**
- CAD maturity: **starter parameterization only**
- Validation maturity: **not yet performed / not claimed**

## Authoritative project source

This scaffold was derived from `Master plan 1.txt`, informed by the original working document in `Documents/Proyecto.docx`, and intentionally limited to the work allowed in **Phase 0** and **Phase 1**.

## Continuity directive

All future work must preserve the following project memory:

- `Master plan 1.txt` is the authoritative operational source.
- `Proyecto.docx` is the original private conceptual source.
- raw photos and raw measurements are private evidence material.
- public repository material is curated, sanitized, and publication-safe only.
