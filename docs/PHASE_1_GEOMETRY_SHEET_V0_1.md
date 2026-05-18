# Phase 1 Geometry Sheet v0.1

> **Exploratory / unvalidated design proposal**

## Purpose

Translate the first hand-drawn layout concept into a traceable, parametric geometry proposal without treating it as validated geometry.

## Confirmed design intent from author review

| Item | Confirmed intent |
| --- | --- |
| Number of sample positions | 6 |
| Pairing logic | `1–4`, `2–5`, `3–B` |
| Meaning of `B` | Blank |
| Disc diameter | 108 mm |
| Sample vial outer diameter | 16 mm |
| Sample vial height | 50 mm |
| Optical window | 13 mm high × 7 mm wide |
| Optical window start elevation | 13 mm from vial base |
| Base strategy | Preserve original base logic: central fastening, concentric structure, and indexing concept |

## Derived first-pass layout

### Core assumptions

- disc radius: `54 mm`
- vial radius: `8 mm`
- provisional outer wall margin: `2 mm`
- provisional vial-center radius: `54 - 8 - 2 = 44 mm`
- angular spacing: `360 / 6 = 60°`

### Resulting center coordinates

Using the disc center as `(0, 0)` and placing position `1` at `180°` for a readable left-to-right sketch orientation:

| Position | Angle | X (mm) | Y (mm) |
| --- | ---: | ---: | ---: |
| 1 | 180° | -44.0 | 0.0 |
| 2 | 240° | -22.0 | -38.1 |
| 3 | 300° | 22.0 | -38.1 |
| 4 | 0° | 44.0 | 0.0 |
| 5 | 60° | 22.0 | 38.1 |
| B | 120° | -22.0 | 38.1 |

## Geometric consequences

- Opposite pairs align through the disc center.
- Adjacent vial-center spacing is approximately `44 mm`.
- Adjacent vial edge-to-edge clearance is approximately `28 mm`.
- The handwritten `3.8 cm` note does **not** appear necessary as a primary driving dimension in this first pass; it may correspond to a secondary chord, sector, or visual reference rather than a fixed design constraint.

## Why this is only v0.1

This layout is a controlled first proposal, not a validated design. It still requires:

1. direct measurement against the original base geometry
2. confirmation of required wall thickness around each vial
3. confirmation of optical beam location relative to the proposed vial windows
4. confirmation that the angular zero reference matches the original indexing logic

## Next checks

- compare the 44 mm vial-center radius against physical clearance in the original assembly
- verify whether the proposed center positions align with the instrument beam path
- derive the outer retention wall and local support ribs only after geometry checks

