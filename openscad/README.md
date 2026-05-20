# OpenSCAD Files

This directory preserves design evolution as explicit versions.

## Adapter series

- `uvvis_carousel_adapter_v0_1_initial_starter.scad`
- `uvvis_carousel_adapter_v0_2_reverse_engineering_reference.scad`
- `uvvis_carousel_adapter_v0_3_six_position_layout.scad`
- `uvvis_carousel_adapter_v0_4_measured_refinement.scad`
- `uvvis_carousel_adapter_v0_5_seating_recess.scad`
- `uvvis_carousel_adapter_v0_6_vial_clearance_test.scad`
- `uvvis_carousel_adapter_v0_7_clearance_wall_label_fix.scad`
- `uvvis_carousel_adapter_v0_8_export_ready.scad`

## Current print-test candidate

Use `uvvis_carousel_adapter_v0_8_export_ready.scad` for STL export and the next clearance-test print.

Use `indexing_base.scad` for the standalone lower indexing-base V0 test print.

For preview/export, hide ghost vials:

```scad
show_ghost_vials = false;
show_reference_axis = false;
```

## Prototype branch

- `uvvis_carousel_mechanism_test_v0_1.scad`
- `indexing_base.scad`
- `indexing_base_v0_1.scad`
- `indexing_base_v0_2_slot_lamina_labels.scad`
- `indexing_base_v0_3_print_ready.scad`
- `indexing_base_v0_4_post_print_fit_adjustment.scad`
- `assembly_validation_v0_1.scad`

`indexing_base.scad` is the requested standalone module filename. `indexing_base_v0_1.scad` preserves the first versioned snapshot of that module.

Use `indexing_base_v0_2_slot_lamina_labels.scad` for the next lower-indexing-base review.

Use `indexing_base_v0_3_print_ready.scad` for the lower-indexing-base print test.

Use `indexing_base_v0_4_post_print_fit_adjustment.scad` for the next post-print fit correction review.

Use `assembly_validation_v0_1.scad` to visually inspect overlap between the upper carousel proxy, lower indexing base, lower seating cylinder, and upper screw.

## Active workflow

Use only numbered version files for CAD work.

The previous convenience file `uvvis_carousel_adapter_starter.scad` has been retired from the active workflow to avoid accidental overwrites. New iterations should continue as:

- `uvvis_carousel_adapter_v0_5_*.scad`
- `uvvis_carousel_adapter_v0_6_*.scad`
- and so on.
