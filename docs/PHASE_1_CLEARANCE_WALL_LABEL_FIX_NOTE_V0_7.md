# Phase 1 Clearance Wall and Label Fix Note v0.7

> **Exploratory print-test geometry — not final production geometry**

## Purpose

`uvvis_carousel_adapter_v0_7_clearance_wall_label_fix.scad` corrects two review issues from `v0_6`:

1. holder outer diameter now references the largest bore diameter in the test set
2. recessed labels are moved farther from the vial holders to reduce overlap in preview and print

## Wall correction

The holder outer diameter is now based on:

```scad
max_test_bore_diameter_mm = 16.8;
holder_outer_diameter_mm = max_test_bore_diameter_mm + 2 * holder_wall_thickness_mm;
```

This keeps the wall envelope consistent across the clearance-test positions.

## Label correction

Labels are moved inward from each vial position using:

```scad
label_radial_offset_mm = 15;
pair_label_tangential_offset_mm = -4.2;
```

This keeps labels close enough to identify each position but farther from the cylindrical holder geometry.

## Preview controls

To hide ghost vials and inspect the printed geometry more clearly:

```scad
show_ghost_vials = false;
```

For faster preview:

```scad
$fn = 32;
show_reference_axis = false;
show_ghost_vials = false;
```

For STL export, keep ghost vials off:

```scad
show_ghost_vials = false;
show_reference_axis = false;
```

