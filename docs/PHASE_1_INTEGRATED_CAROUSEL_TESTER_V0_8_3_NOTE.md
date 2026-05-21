# Phase 1 Integrated Carousel Tester v0.8.3 Note

> **Active v0.8 continuation — vial-base plane as mechanical zero/joint reference**

## Purpose

`openscad/integrated_carousel_tester_v0_8_3_vial_base_zero_reference.scad` continues from the v0.8 active design line. It updates the lower indexing-base integration convention so the vial/cuvette base plane is treated as the common mechanical joint plane where the upper and lower parts meet.

This version does not continue from the discarded v0.9/v0.10 design direction.

## Design convention

The vial/cuvette base plane is the shared mechanical zero/joint plane:

```scad
vial_base_joint_z = integrated_platform_height;
```

In print coordinates, this plane is currently:

```text
z = 14.94 mm
```

From that plane:

- vial/cuvette holders project upward
- lower indexing rings project downward
- each lower ring keeps its own reference height

## Lower rings projected downward from the vial-base plane

| Ring | Height | Top Z / joint plane | Bottom Z |
| --- | ---: | ---: | ---: |
| ring 1 | 9 mm | 14.94 mm | 5.94 mm |
| ring 2 / center-index lamina | 14 mm | 14.94 mm | 0.94 mm |
| ring 3 | 10 mm | 14.94 mm | 4.94 mm |

This is implemented with:

```scad
module annular_rib_down_from(top_z, outer_diameter, rib_width, rib_height)
```

and used as:

```scad
annular_rib_down_from(vial_base_joint_z, ring_1_diameter_effective, ring_1_width, ring_1_height);
annular_rib_down_from(vial_base_joint_z, ring_2_diameter_effective, index_lamina_width, ring_2_height);
annular_rib_down_from(vial_base_joint_z, ring_3_diameter_effective, outer_ring_width, ring_3_height);
```

## Local integration pads

The local pads now act only as a minimal overlap at the shared vial-base plane:

```scad
local_vial_base_pad_overlap = 0.1;
local_vial_base_pad_z = vial_base_joint_z - local_vial_base_pad_overlap;
local_vial_base_pad_height = local_vial_base_pad_overlap;
```

This avoids creating a full cap over the indexing circles.

## Print caution

Because the lower rings are now modeled as projecting downward from the vial-base joint plane, slicer behavior should be reviewed carefully before printing. This version prioritizes mechanical reference correctness and requires Cura layer preview inspection.

## Status

Exploratory geometry for review/slicer validation only. No final compatibility, validation, or production claim is made.
