# Phase 1 Integrated Carousel Tester v0.9 Note

> **Exploratory correction — preserve stepped lower ring heights and center boss emergence**

## Purpose

`openscad/integrated_carousel_tester_v0_9_stepped_ring_center_fix.scad` audits and corrects two issues observed after preparing/printing v0.8:

1. The lower rings had different height parameters, but the full low top cap in v0.8 visually/functionally masked those height differences.
2. The visible central coupling boss did not clearly emerge from the center/index ring height.

## What changed from v0.8

### 1. Stepped ring heights are preserved visually

The ring heights remain:

| Ring | Height |
| --- | ---: |
| inner ring | 9 mm |
| center/index lamina ring | 14 mm |
| outer ring | 10 mm |

v0.8 used a full circular cap starting at `z = 8.5 mm`, which made the lower base appear leveled/fused. v0.9 replaces that full low cap with local support geometry:

```scad
preserve_stepped_ring_heights = true;
upper_support_z = ring_2_height - 0.1;
top_cap_height = integrated_platform_height - upper_support_z;
```

Current values:

| Feature | Value |
| --- | ---: |
| upper support starts | 13.9 mm |
| upper support height | 1.04 mm |
| vial-base plane | 14.94 mm |

Instead of a full disk, v0.9 uses:

- a central upper hub
- six local support pads under vial holders
- six radial spokes

This keeps the tester as one printable integrated piece while reducing masking of the lower indexing-ring steps.

### 2. Visible central boss emerges from center/index ring height

v0.9 keeps the full conical internal receiver path but changes the visible positive central boss so it begins at the center/index ring reference height:

```scad
central_visible_boss_z_min = central_ring_reference_z;
central_visible_boss_height = central_coupling_z_max - central_visible_boss_z_min;
```

Current values:

| Feature | Value |
| --- | ---: |
| center/index ring reference | 14 mm |
| visible central boss starts | 14 mm |
| visible central boss ends | 22.18 mm |
| visible central boss height | 8.18 mm |

The internal conical receiver clearance still spans the full central path for mechanical review.

## Still preserved

- v0.5 refined radial ring measurements
- open lower indexing base
- 108.10 mm outer integrated diameter
- 16.4 mm vial/cuvette bore
- 3.2 mm center screw clearance
- 2 mm internal wall key aligned with `1-4`
- exploratory tolerance documentation from v0.8

## Status

Exploratory correction only. This file is intended for review after observing v0.8 print behavior. No final compatibility, validation, or production claim is made.
