# Phase 1 Integrated Carousel Tester v0.5 Note

> **Preliminary integrated tester — refined radial indexing-ring layout**

## Purpose

`openscad/integrated_carousel_tester_v0_5_refined_radial_rings.scad` refines the lower indexing-ring geometry after the upper and lower pieces were integrated. The prior v0.4 used proportional scaling to reach a common `108.10 mm` outer diameter. v0.5 instead reconstructs the lower ring positions from new caliper measurements taken from the integrated assembly.

## New radial measurements integrated

Measured from outside toward the center:

| Measurement | Value |
| --- | ---: |
| total span from outer edge through outer + second reading borders | 13.51 mm |
| outer border thickness | 2.87 mm |
| second border thickness, outer-side measurement | 1.20 mm |
| total span including second + third borders | 11.15 mm |
| second border thickness, inner-side measurement | 1.24 mm |
| third border thickness | 1.57 mm |

## Derived radial layout

The second/indexing lamina has two close measurements, so v0.5 preserves both raw values and uses an editable average:

```scad
index_lamina_width = (second_ring_width_outer_measure + second_ring_width_inner_measure) / 2;
```

Current derived values:

| Feature | Value |
| --- | ---: |
| integrated outer diameter | 108.10 mm |
| outer ring width | 2.87 mm |
| gap from outer ring to second ring | 9.44 mm |
| second/index lamina width | 1.22 mm |
| gap from second ring to inner ring | 8.34 mm |
| inner ring width | 1.57 mm |
| outer ring OD | 108.10 mm |
| second ring OD | 83.48 mm |
| inner ring OD | 64.36 mm |

## Heights intentionally unchanged

| Ring | Height |
| --- | ---: |
| inner ring | 9 mm |
| second/index lamina | 14 mm |
| outer ring | 10 mm |

## Preserved from v0.4

- open lower indexing-base architecture
- 14.94 mm integrated platform height before vial holders
- 18.91 mm total central conical coupling/receiver path
- 7.24 mm central projection below lower face
- internal 2 mm key aligned with `1-4`
- screw clearance through the center

## Status

Exploratory prototype documentation only. No final compatibility, validation, or production claim is made.
