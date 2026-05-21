# Phase 1 Integrated Carousel Tester v0.3 Note

> **Preliminary integrated tester — open lower indexing base**

## Purpose

`openscad/integrated_carousel_tester_v0_3_open_indexing_base.scad` corrects the integrated tester so the lower indexing system remains open between the concentric rings, following the logic of `openscad/indexing_base_v0_3_print_ready.scad`.

The lower circular lamina/ring geometry is not decorative. It is treated as the exploratory indexing interface, so the openings between rings and the rectangular slot features must remain visible and accessible for mechanical review.

## Main correction from v0.2

v0.2 included a thin lower structural floor. That helped visually fuse the object but partially contradicted the observed indexing-base logic. In v0.3, the lower floor is disabled by default:

```scad
open_lower_indexing_base = true;
```

The optional floor remains available only for structural comparison:

```scad
open_lower_indexing_base = false;
```

## Current review controls

```scad
show_lower_indexing_rings = true;
show_integrated_top_cap = true;
show_internal_key = true;
open_lower_indexing_base = true;
```

## Key dimensions retained

| Feature | Value |
| --- | ---: |
| integrated platform height before vial holders | 14.94 mm |
| lower ring reveal height | 8.5 mm |
| upper cap height | 6.44 mm |
| internal key width | 2 mm |
| internal key height | 7 mm |
| internal key center Z | 7.47 mm |
| vial bore diameter | 16.4 mm |

## Lower indexing rings retained

| Feature | Effective diameter | Width / thickness | Height |
| --- | ---: | ---: | ---: |
| ring 1 | 63.5 mm | 1.52 mm | 9 mm |
| ring 2 / slot lamina | 83.5 mm | 1.21 mm | 14 mm |
| ring 3 / outer ring | 105.5 mm | 2.48 mm | 10 mm |

## Review instructions

Open the file in OpenSCAD and inspect from below or from an angled side view. The spaces between rings should now appear open below the upper cap, and the ring-2 rectangular indexing slots should remain visible.

If a temporary solid comparison is needed, set:

```scad
open_lower_indexing_base = false;
```

For the intended indexing-base review, keep it as:

```scad
open_lower_indexing_base = true;
```

## Status

Exploratory prototype documentation only. No final compatibility, validation, or production claim is made.
