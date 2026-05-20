# Phase 1 Indexing Base v0.4 Post-Print Note

> **Exploratory post-print correction**

## Purpose

`openscad/indexing_base_v0_4_post_print_fit_adjustment.scad` integrates the first physical print observations for the lower indexing base.

## Observations integrated

### 1. Base/ring fit undersize

The printed base appeared approximately **2–3 mm undersized** when compared against the upper part and the positioning system.

The v0.4 model introduces:

```scad
post_print_diameter_offset = 2.5;
```

This is applied to:

- base diameter
- ring 1 diameter
- ring 2 diameter
- ring 3 diameter

The goal is to help the ring geometry, especially the middle indexing ring, better engage the observed positioning/detection feature.

### 2. Lower central clearance

The upper screw opening was acceptable, but the underside/inner center requires a larger opening for the cylindrical screw-retention feature.

The v0.4 model adds an underside oblong clearance:

```scad
lower_center_clearance_width = 7;
lower_center_clearance_length = 16.5;
upper_screw_guidance_depth = 3;
```

This preserves the upper screw guidance region while opening the lower portion of the base.

## Important limitation

This is a post-print correction based on observation. It is not yet a validated final fit.

## Suggested file to review/export

`openscad/indexing_base_v0_4_post_print_fit_adjustment.scad`

Suggested STL path:

`exports/indexing_base_v0_4_post_print_fit_adjustment.stl`

