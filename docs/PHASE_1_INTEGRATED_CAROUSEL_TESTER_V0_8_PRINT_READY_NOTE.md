# Phase 1 Integrated Carousel Tester v0.8 Print-Ready Note

> **Exploratory print-ready functional tester — not a validated final part**

## Purpose

`openscad/integrated_carousel_tester_v0_8_print_ready.scad` freezes the latest reviewed geometry into a print-ready exploratory tester. It keeps the v0.7 central reference correction and the v0.5 radial ring refinements, with visual helpers disabled for STL export.

## Print/export state

The following toggles are set for export:

```scad
show_vial_ghosts = false;
show_reference_axis = false;
show_cutaway_preview = false;
show_center_reference_planes = false;
print_ready_export = true;
```

The model keeps visible/functional geometry enabled:

```scad
show_position_labels = true;
show_lower_indexing_rings = true;
show_integrated_top_cap = true;
show_internal_key = true;
open_lower_indexing_base = true;
show_center_coupling_projection = true;
```

## Fit/tolerance parameters currently included

| Feature | Parameter | Value | Notes |
| --- | --- | ---: | --- |
| vial/cuvette bore | `vial_bore_diameter` | 16.4 mm | user-confirmed ideal clearance for circular vial/cuvette body |
| nominal vial body reference | `vial_outer_diameter` | 16.0 mm | visual/reference body size |
| target vial clearance | `vial_clearance_target` | 0.4 mm | documented clearance target, not an additional cut beyond the 16.4 mm bore |
| screw hole | `center_screw_hole_diameter` | 3.2 mm | exploratory clearance for observed/nominal 3 mm screw path |
| screw clearance note | `center_screw_clearance_note` | 0.2 mm | documented clearance margin |
| indexing slot clearance | `slot_fit_tolerance` | 0.25 mm | added to slot width cuts |
| internal wall key width | `internal_key_width` | 2 mm | aligned with `1-4` |
| internal wall key projection | `internal_key_radial_projection` | 1.2 mm | protrudes onto conical receiver wall |
| internal wall key height | `internal_key_height` | 7 mm | centered on central conical path |

## Central geometry retained

| Feature | Value |
| --- | ---: |
| center/index lamina reference height | 14.00 mm |
| vial-base reference height | 14.94 mm |
| total central conical path | 18.91 mm |
| central projection above vial-base plane | 7.24 mm |
| central portion below vial-base plane | 11.67 mm |
| internal receiver lower diameter | 7 mm |
| internal receiver upper diameter | 4 mm |

## Ring geometry retained

| Feature | Value |
| --- | ---: |
| integrated outer diameter | 108.10 mm |
| outer ring width | 2.87 mm |
| second/index lamina width | 1.22 mm average from 1.20/1.24 mm observations |
| inner ring width | 1.57 mm |
| ring heights | unchanged from v0.5/v0.7 |

## Recommended pre-print checklist

1. Open the file in OpenSCAD.
2. Confirm `show_cutaway_preview = false`.
3. Confirm `show_center_reference_planes = false`.
4. Render with F6 before STL export.
5. Export STL to `exports/stl/` if using the local export convention.
6. Slice in Cura using the exploratory profile folder under `manufacturing/cura_profiles/` or save new profiles in `exports/print_profiles/`.
7. Save generated `.gcode` in `exports/gcode/`.
8. Record observations in the measurement/print-test log before changing dimensions again.

## Important limitation

This is a print-ready exploratory tester, not a compatibility, validation, safety, or production-ready claim. Fit must be confirmed by controlled test print and inspection.
