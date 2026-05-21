# Phase 1 Integrated Carousel Tester v0.10 Note

> **Exploratory correction — self-supported central boss for FDM printing**

## Purpose

`openscad/integrated_carousel_tester_v0_10_self_supported_center.scad` corrects the printability issue observed when v0.8 was started on the Ender 3 V2 and the central cylinder/boss did not begin printing as expected.

The issue was that the central visible boss was effectively a late-starting feature and could appear to the slicer/printer as unsupported or dependent on a long bridge/support region.

## Correction

v0.10 adds a central printable support collar from the build/base region up to the center/index ring reference height.

```scad
show_central_print_support_collar = true;
central_print_support_collar_z_min = 0;
central_print_support_collar_height = central_visible_boss_z_min - central_print_support_collar_z_min;
central_print_support_collar_diameter = central_coupling_outer_bottom_diameter;
```

Current values:

| Feature | Value |
| --- | ---: |
| support collar starts | z = 0 mm |
| support collar ends | z = 14 mm |
| support collar height | 14 mm |
| visible central boss starts | z = 14 mm |
| visible central boss ends | z = 22.18 mm |
| visible central boss height | 8.18 mm |

The support collar and visible boss meet at the same Z height, so the center feature has continuous material during FDM printing.

## What remains subtracted

The following subtractive features are still applied after the collar/boss are unioned:

- central screw clearance
- conical central receiver clearance
- indexing slots

This means the center is supported for printing while still preserving the screw/receiver pathway for mechanical testing.

## Relationship to v0.9

v0.9 improved the stepped lower ring architecture but could still leave the central feature insufficiently supported. v0.10 keeps the v0.9 stepped-ring correction and adds the central print-support collar.

## Status

Exploratory correction for print testing only. No final compatibility, validation, or production claim is made.
