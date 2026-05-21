# Phase 1 Integrated Carousel Tester v0.2 Note

> **Preliminary integrated tester — visible lower indexing rings**

## Purpose

`openscad/integrated_carousel_tester_v0_2_visible_indexing_rings.scad` is the second fused upper/lower tester version. It corrects the v0.1 integration issue where the lower concentric lamina/ring geometry was mathematically present but visually/functionally absorbed inside the full-height upper platform cylinder.

This version preserves the integrated tester concept while keeping the lower indexing rings exposed for visual and mechanical review.

## Key changes from v0.1

| Area | v0.1 behavior | v0.2 behavior |
| --- | --- | --- |
| lower rings | embedded inside full-height platform | visible lower annular ribs |
| platform body | full solid cylinder from 0 to 14.94 mm | upper cap starts at 8.8 mm |
| structural connection | implicit full solid | 2 mm lower floor + overlapping upper cap |
| internal key | positive wall rib aligned with 1-4 | preserved |
| labels | raised 3 mm position labels | preserved |

## Current dimensional controls

```scad
integrated_platform_height = 14.94;
base_floor_height = 2;
lower_ring_reveal_height = 8.8;
top_cap_height = integrated_platform_height - lower_ring_reveal_height;

internal_key_axis_angle = 180;
internal_key_width = 2;
internal_key_radial_projection = 1.2;
internal_key_height = 7;
internal_key_z_center = integrated_platform_height / 2;
```

## Lower ring geometry retained

| Feature | Effective diameter | Width / thickness | Height |
| --- | ---: | ---: | ---: |
| ring 1 | 63.5 mm | 1.52 mm | 9 mm |
| ring 2 / slot lamina | 83.5 mm | 1.21 mm | 14 mm |
| ring 3 / outer ring | 105.5 mm | 2.48 mm | 10 mm |

The ring diameters include the previously introduced `post_print_diameter_offset = 2.5` from post-print fit observations.

## Review notes before print

Inspect in OpenSCAD:

1. lower annular rings should now be visible from the side/lower region
2. position slots should remain cut through the ring-2 lamina
3. internal key should remain aligned with the `1-4` axis
4. the screw hole should remain open through the center
5. total platform height before vial holders remains 14.94 mm

## Status

Exploratory prototype documentation only. This is not a final compatibility, validation, or production claim.
