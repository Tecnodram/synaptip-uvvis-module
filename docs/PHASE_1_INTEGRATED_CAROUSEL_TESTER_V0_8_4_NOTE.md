# Phase 1 Integrated Carousel Tester v0.8.4 Note

> **Active v0.8 continuation — complete floor only at vial-base joint plane**

## Purpose

`openscad/integrated_carousel_tester_v0_8_4_vial_base_floor.scad` continues from v0.8.3 and adds a complete floor only at the shared vial/cuvette base plane.

The floor is not a deep cap over the lower indexing base. It exists only at the plane where the vial/cuvette holders begin and where the lower rings terminate upward.

## Main change from v0.8.3

v0.8.4 disables local pads and enables a single complete thin floor at the vial-base joint plane:

```scad
show_local_vial_base_pads = false;
show_vial_base_joint_floor = true;
```

The floor is defined as:

```scad
vial_base_joint_floor_thickness = 0.94;
vial_base_joint_floor_z = vial_base_joint_z - vial_base_joint_floor_thickness;
```

## Current vertical layout

| Feature | Z / Height |
| --- | ---: |
| vial-base joint plane | z = 14.94 mm |
| complete joint floor starts | z = 14.00 mm |
| complete joint floor ends | z = 14.94 mm |
| complete joint floor thickness | 0.94 mm |
| ring 1 bottom | z = 5.94 mm |
| ring 2 / center-index lamina bottom | z = 0.94 mm |
| ring 3 bottom | z = 4.94 mm |

## Lower rings remain defined downward from joint plane

```scad
annular_rib_down_from(vial_base_joint_z, ring_1_diameter_effective, ring_1_width, ring_1_height);
annular_rib_down_from(vial_base_joint_z, ring_2_diameter_effective, index_lamina_width, ring_2_height);
annular_rib_down_from(vial_base_joint_z, ring_3_diameter_effective, outer_ring_width, ring_3_height);
```

## What this means mechanically

- The cubetillas/cuvettes begin at the shared upper floor.
- The lower indexing rings connect into that floor from below.
- The full floor is only at the joint plane, not throughout the lower indexing structure.
- The lower indexing circles are still modeled as separate downward features with different heights.

## Status

Exploratory print/slicer review geometry only. No final compatibility, validation, or production claim is made.
