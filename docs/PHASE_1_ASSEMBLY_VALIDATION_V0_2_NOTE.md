# Phase 1 Assembly Validation v0.2 Note

> **Exploratory geometric validation aid**

## Purpose

`openscad/assembly_validation_v0_2_conical_tabs.scad` updates the assembly validation overlay with newly observed lower hardware geometry.

This file remains a visual/mechanical validation aid. It is not a print-ready integrated adapter.

## New observations integrated

| Item | Updated value / interpretation |
| --- | --- |
| lower seating cylinder measured reference diameter | 4 mm |
| lower seating cylinder height/protrusion | 16.5 mm |
| lower seating cylinder shape | conical from top to bottom |
| upper screw diameter | retained from previous working models |
| upper screw height | 14 mm |
| indexing lamina/detector clearance | approx. 5 mm |
| positioning tabs | two parallel tabs, 2 mm each |
| tab alignment | aligned with vial-position pair `1-4` |

## Added geometry

The v0.2 assembly model adds:

- conical lower seating cylinder proxy
- two 2 mm positioning tabs
- updated upper screw length
- detector/lamina clearance parameter for future checking

## Toggle controls

Use:

```scad
show_lower_seating_cylinder = true;
show_upper_screw = true;
```

to inspect the new hardware proxies.

## Remaining validation needs

Before making this part final, still confirm:

1. whether the conical lower cylinder should be represented as a cutout in the printed base or only as external hardware clearance
2. exact tab length and vertical start/end position
3. whether the two tabs are centered on the cylinder axis or offset
4. whether tab alignment with `1-4` should be exactly 0/180 degrees or corrected by measured angular offset
5. whether the lower oblong clearance in `indexing_base_v0_4_post_print_fit_adjustment.scad` should be revised into a conical/tabbed clearance

