# Phase 1 Integrated Carousel Tester v0.1 Note

> **Preliminary integrated tester — review before print**

## Purpose

`openscad/integrated_carousel_tester_v0_1_preliminary.scad` combines the lower indexing-base geometry and upper circular-vial holder geometry into a single preliminary tester.

This is the first integrated review model. It should be inspected before printing.

## Integrated constraints

| Item | Value / behavior |
| --- | --- |
| total base/platform height before vial holders | 14.94 mm |
| preferred vial bore diameter | 16.4 mm |
| vial holder projection | starts above 14.94 mm platform |
| position labels | raised, 3 mm text size |
| paired position logic | `1-4`, `3-B`, `5-2` |
| internal alignment key | aligned with `1-4` |
| central screw hole | 3.2 mm |
| central receiver | preliminary conical clearance |

## Important assumptions

The internal key is modeled as a positive rib protruding into the central receiver after the receiver cutout is made.

Current key parameters:

```scad
internal_key_axis_angle = 180;
internal_key_width = 2;
internal_key_radial_projection = 1.2;
internal_key_height = 7;
internal_key_z_center = integrated_platform_height / 2;
internal_key_receiver_radius_at_center =
    (central_receiver_top_diameter + central_receiver_bottom_diameter) / 4;
```

The key is radially positioned from the conical receiver radius at mid-height so it behaves like an internal wall rib rather than a detached floating marker. These values are exploratory and should be checked visually/mechanically before print.

## Review before printing

Inspect:

1. whether the 14.94 mm platform height is correct
2. whether holders begin at the correct upper surface
3. whether the internal key is on the correct side/wall of the receiver
4. whether the `1-4` key alignment is correct
5. whether position labels are readable and not interfering with holders
6. whether the conical receiver clearance should be larger/smaller
7. whether index slots still align with the lower detector/indexing system

## Not yet validated

This file does not claim:

- instrument compatibility
- final mechanical fit
- optical alignment
- production readiness
