# Phase 1 Initial Observations

> **Exploratory / unvalidated reverse-engineering notes**

This file records preliminary observations derived from the original working source document. Values are retained as **raw observations**, not as validated design requirements or tolerances.

## Source references

- Original working source: `Documents/Proyecto.docx`
- Operational source: `Master plan 1.txt`

## Preliminary geometry observations

| Observation ID | Feature | Raw observation | Status |
| --- | --- | --- | --- |
| OBS-001 | Base overall height | approximately 1.5 cm | unvalidated |
| OBS-002 | Central fastening feature | approximately 0.3 cm diameter | unvalidated |
| OBS-003 | Concentric ring 1 | approximately 6.1 cm diameter | unvalidated |
| OBS-004 | Concentric ring 2 | approximately 8.1 cm diameter | unvalidated |
| OBS-005 | Concentric ring 3 | approximately 10.3 cm diameter | unvalidated |
| OBS-006 | Ring wall thickness | approximately 0.2 cm | unvalidated |
| OBS-007 | Repeating narrow openings | five openings, approximately 0.2 cm each | unvalidated |
| OBS-008 | Wider opening | one opening, approximately 0.5 cm | unvalidated |
| OBS-009 | Circular sample holder diameter | approximately 1.6 cm | unvalidated |
| OBS-010 | Circular sample holder height | approximately 5.0 cm | unvalidated |
| OBS-011 | Optical window elevation | approximately 1.3 cm above reference surface | unvalidated |
| OBS-012 | Optical window shape | oval opening, approximately 1.3 cm by 0.7 cm | unvalidated |

## Preliminary indexing hypothesis

The source notes describe one wider opening among a sequence of narrower openings. This may indicate an indexing or home-position feature, but that interpretation remains a **hypothesis** pending documented inspection and measurement.

## Required follow-up before any claim

1. Re-measure each feature with a documented method.
2. Link each measurement to a photo or inspection record where public-safe.
3. Log revised values in `measurements/measurement_log_template.csv` or a future measured dataset.
4. Update the OpenSCAD starter parameters only after review.

## Early interpretation from private photo review

- The base appears to use concentric circular regions rather than a single flat disk.
- Radial support ribs are visible and should be modeled independently from the circular walls.
- Repeating narrow slots plus one wider slot remain plausible indexing-related features, but their function is not yet confirmed.
- Side openings suggest that vertical geometry and beam-clearance constraints may need to be modeled separately from the top-view footprint.
