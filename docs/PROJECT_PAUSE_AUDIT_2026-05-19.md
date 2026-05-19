# Project Pause Audit — 2026-05-19

> **Temporary pause note — exploratory prototype documentation**

## Pause status

The project is paused before physical print-test evaluation.

Current phase:

- **Phase 1 — Reverse Engineering / geometry extraction / first clearance-test manufacturing preparation**

Phase 0 remains closed. Phase 1 is active but should not advance to validation claims until the first printed prototype is evaluated and documented.

## Current recommended CAD file

Use this file for the next STL export / Cura print test:

`openscad/uvvis_carousel_adapter_v0_8_export_ready.scad`

This file has export-safe defaults:

```scad
show_reference_axis = false;
show_ghost_vials = false;
show_position_labels = true;
```

## Current print-test purpose

The next print is a **clearance and mechanism test**, not a final adapter.

It should check:

- whether the central screw hole works mechanically
- whether the carousel sits correctly
- whether the part lays flat in Cura and prints flat
- which vial bore diameter works best
- whether labels are readable
- whether vial insertion/removal is practical

## Clearance-test diameters

| Position | Pair | Bore diameter |
| --- | --- | ---: |
| 1 | 1-4 | 16.2 mm |
| 4 | 1-4 | 16.2 mm |
| 2 | 2-5 | 16.4 mm |
| 5 | 2-5 | 16.4 mm |
| B | 3-B | 16.6 mm |
| 3 | 3-B | 16.8 mm |

## Local manufacturing artifacts observed

The project has local manufacturing outputs under `exports/`, including G-code/profile/image-type artifacts. These are intentionally ignored by Git because they may be printer-specific or publication-sensitive.

Examples of ignored local artifact categories:

- `.gcode`
- `.curaprofile`
- `.jpg`
- `.3mf`
- `.stl`

These are **not backed up to GitHub** by default.

## Governance status

Repository governance is healthy:

- public/private separation is active
- `Documents/` and `Photos/` remain private
- generated manufacturing outputs are ignored
- CAD files are versioned explicitly
- prompt traceability is active
- no final compatibility, validation, manufacturer affiliation, or production-ready claims are present

## GitHub backup status

The public-safe repository state is backed up to GitHub.

Remote:

`https://github.com/Tecnodram/synaptip-uvvis-module.git`

Branch:

`main`

## Next action after rest

After printing, fill or update:

`manufacturing/print_test_record_template.csv`

Record:

- printer model
- material
- nozzle
- layer height
- selected Cura profile
- G-code filename
- fit result for each bore diameter
- screw fit result
- mechanism result
- notes/photos kept private unless reviewed

## Do not do next

Do not claim:

- final compatibility
- validated tolerances
- validated optical alignment
- production readiness
- manufacturer affiliation or endorsement

