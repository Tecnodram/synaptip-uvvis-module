# Phase 1 Assembly Validation v0.1 Note

> **Exploratory geometric validation aid**

## Purpose

`openscad/assembly_validation_v0_1.scad` is a visual overlay model for checking how the upper circular-vial carousel and lower indexing base may align.

It is **not** a print-ready integrated part.

## Toggle controls

The file includes switches for:

```scad
show_lower_indexing_base = true;
show_upper_carousel_proxy = true;
show_vial_ghosts = true;
show_lower_seating_cylinder = true;
show_upper_screw = true;
show_center_axis = true;
show_home_reference = true;
```

Use these to turn components on/off during review.

## Alignment controls

```scad
upper_z_offset = 15;
upper_rotation_deg = 0;
lower_rotation_deg = 0;
```

Adjust these to inspect:

- vertical seating height
- angular alignment of positions
- HOME slot relation to position 3 / B relationship

## Hardware proxies

The assembly file adds visual proxies for:

- lower seating/retention cylinder
- upper screw shaft
- screw head

These are only inspection aids until the actual hardware dimensions are fully measured.

## What is needed for stronger geometric/mechanical validation

To improve the model, measure or confirm:

1. actual diameter of the lower seating cylinder
2. actual height/protrusion of the lower seating cylinder
3. whether the lower seating feature is circular or oblong in the real mechanism
4. screw shaft diameter and thread type
5. screw head diameter and height
6. vertical distance between lower base seating plane and upper carousel plane
7. angular reference between HOME slot, position 3, and blank position B
8. clearance between the middle indexing lamina and the detector/indexing muesca
9. whether the upper carousel and lower indexing base should be one fused part or mechanically stacked

## Important limitation

The upper carousel in this file is a simplified proxy based on the current measured design logic. It is used for overlap/alignment inspection only.

