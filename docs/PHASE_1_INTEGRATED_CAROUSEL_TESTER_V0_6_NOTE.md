# Phase 1 Integrated Carousel Tester v0.6 Note

> **Preliminary integrated tester — corrected central top-referenced coupling**

## Purpose

`openscad/integrated_carousel_tester_v0_6_center_top_projection.scad` corrects the vertical interpretation of the central cylinder/coupling geometry.

In v0.4/v0.5, the central coupling projection was interpreted as projecting below the lower face. The clarified interpretation is that the central feature is referenced to the upper vial-base plane: part of the central cylinder projects upward from the same level where the vial holders begin, and the remaining portion extends below that level into the integrated body.

## Corrected central reference

| Feature | Value |
| --- | ---: |
| vial-base plane / top platform level | 14.94 mm |
| total central cylinder/receiver path | 18.91 mm |
| projection above vial-base plane | 7.24 mm |
| portion below vial-base plane | 11.67 mm |
| central feature lower Z | 3.27 mm |
| central feature upper Z | 22.18 mm |

## Internal wall notch/key

The internal wall feature is placed at the midpoint of the central conical receiver path and aligned with the vial position pair `1-4`.

| Feature | Value |
| --- | ---: |
| key/notch axis | aligned with `1-4` |
| key/notch width | 2 mm |
| key/notch height | 7 mm |
| key/notch center Z | 12.725 mm |
| key/notch lower Z | 9.225 mm |
| key/notch upper Z | 16.225 mm |

The central screw clearance is still subtracted through the full central feature so the screw path remains open.

## Conical center opening

The internal receiver/screw passage remains conical toward the lower direction:

```scad
central_receiver_bottom_diameter = 7;
central_receiver_top_diameter = 4;
```

This means the lower side of the internal receiver is wider than the upper side.

## Preserved from v0.5

- refined radial indexing-ring layout
- open lower indexing base
- 108.10 mm integrated outer diameter
- ring heights unchanged
- vial bore diameter unchanged
- raised position labels unchanged

## Status

Exploratory prototype documentation only. No final compatibility, validation, or production claim is made.
