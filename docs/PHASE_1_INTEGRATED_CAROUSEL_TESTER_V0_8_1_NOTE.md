# Phase 1 Integrated Carousel Tester v0.8.1 Note

> **Official continuation from v0.8 — ring height reference fix only**

## Purpose

`openscad/integrated_carousel_tester_v0_8_1_ring_height_reference_fix.scad` continues from `integrated_carousel_tester_v0_8_print_ready.scad`, because v0.8 is the closest geometry to the intended part.

The v0.9/v0.10 branch is not used as the active design direction. Those files remain versioned for audit history only.

## Correction made

Only the upper cap height reference was changed so the lower ring height differences from `indexing_base_v0_3_print_ready.scad` are not visually/functionally masked.

### Source height reference

From `openscad/indexing_base_v0_3_print_ready.scad`:

| Ring | Height |
| --- | ---: |
| ring 1 | 9 mm |
| ring 2 / center-index lamina | 14 mm |
| ring 3 | 10 mm |

These same heights were already present in v0.8 and are preserved in v0.8.1:

```scad
ring_1_height = 9;
ring_2_height = 14;
ring_3_height = 10;
```

### Actual fix

v0.8 used:

```scad
lower_ring_reveal_height = 8.5;
```

That caused the integrated upper cap to begin too low and mask the stepped ring heights.

v0.8.1 uses:

```scad
lower_ring_reveal_height = 14;
```

This matches the center/index ring height and leaves the 9/14/10 mm ring height relationship visible before the upper cap begins.

## Resulting vertical values

| Feature | Value |
| --- | ---: |
| ring 1 height | 9 mm |
| ring 2 height | 14 mm |
| ring 3 height | 10 mm |
| upper cap starts | 14 mm |
| vial-base plane | 14.94 mm |
| upper cap thickness | 0.94 mm |

## Unchanged from v0.8

- central geometry
- screw clearance
- conical receiver
- ring diameters and radial layout
- vial bore diameter
- labels
- indexing slot tolerances
- open lower indexing base setting

## Status

Exploratory print-test geometry only. No final compatibility, validation, or production claim is made.
