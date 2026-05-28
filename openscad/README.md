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
- `uvvis_carousel_adapter_v0_7_1_single_vial_16_4.scad`
- `uvvis_carousel_adapter_v0_8_export_ready.scad`

## Current print-test candidate

Use `uvvis_carousel_adapter_v0_8_export_ready.scad` for STL export and the next clearance-test print.

Use `uvvis_carousel_adapter_v0_7_1_single_vial_16_4.scad` for the exploratory single-vial functional variant derived directly from v0.7 with one 16.4 mm bore.

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
- `assembly_validation_v0_2_conical_tabs.scad`
- `integrated_carousel_tester_v0_1_preliminary.scad`
- `integrated_carousel_tester_v0_2_visible_indexing_rings.scad`
- `integrated_carousel_tester_v0_3_open_indexing_base.scad`
- `integrated_carousel_tester_v0_4_extended_center_coupling.scad`
- `integrated_carousel_tester_v0_5_refined_radial_rings.scad`
- `integrated_carousel_tester_v0_6_center_top_projection.scad`
- `integrated_carousel_tester_v0_7_center_ring_reference.scad`
- `integrated_carousel_tester_v0_8_print_ready.scad`
- `integrated_carousel_tester_v0_8_1_ring_height_reference_fix.scad`
- `integrated_carousel_tester_v0_8_2_open_base_integration.scad`
- `integrated_carousel_tester_v0_8_3_vial_base_zero_reference.scad`
- `integrated_carousel_tester_v0_8_4_vial_base_floor.scad`
- `integrated_carousel_tester_v0_9_stepped_ring_center_fix.scad`
- `integrated_carousel_tester_v0_10_self_supported_center.scad`

`indexing_base.scad` is the requested standalone module filename. `indexing_base_v0_1.scad` preserves the first versioned snapshot of that module.

Use `indexing_base_v0_2_slot_lamina_labels.scad` for the next lower-indexing-base review.

Use `indexing_base_v0_3_print_ready.scad` for the lower-indexing-base print test.

Use `indexing_base_v0_4_post_print_fit_adjustment.scad` for the next post-print fit correction review.

Use `assembly_validation_v0_1.scad` to visually inspect overlap between the upper carousel proxy, lower indexing base, lower seating cylinder, and upper screw.

Use `assembly_validation_v0_2_conical_tabs.scad` to inspect the updated conical lower cylinder and 2 mm positioning tabs aligned with pair `1-4`.

Use `integrated_carousel_tester_v0_1_preliminary.scad` to review the first fused upper/lower carousel tester before print.

Use `integrated_carousel_tester_v0_2_visible_indexing_rings.scad` to review the fused tester with the lower concentric indexing rings exposed instead of absorbed into a full-height platform body.

Use `integrated_carousel_tester_v0_3_open_indexing_base.scad` to review the fused tester with the lower indexing base open between rings, matching the intended indexing logic from `indexing_base_v0_3_print_ready.scad`.

Use `integrated_carousel_tester_v0_4_extended_center_coupling.scad` to review the fused tester with 108.10 mm integrated outer diameter, open lower indexing base, and extended central conical coupling projection.

Use `integrated_carousel_tester_v0_5_refined_radial_rings.scad` to review the fused tester with lower indexing-ring positions reconstructed from post-integration radial caliper measurements rather than proportional scaling.

Use `integrated_carousel_tester_v0_6_center_top_projection.scad` to review the fused tester with the central conical receiver/coupling referenced to the upper vial-base plane: 7.24 mm above that plane and 11.67 mm below it.

Use `integrated_carousel_tester_v0_7_center_ring_reference.scad` to review the same central conical opening with the center/index lamina ring height explicitly defined as a mechanical reference plane and optional visual reference planes for audit.

Use `integrated_carousel_tester_v0_8_print_ready.scad` as the current exploratory print-ready tester export file. Visual helpers are disabled, fit tolerances are documented, and the model remains marked as unvalidated prototype geometry.

Use `integrated_carousel_tester_v0_8_1_ring_height_reference_fix.scad` as the active continuation from v0.8 when preserving the intended lower-ring height relationship from `indexing_base_v0_3_print_ready.scad`. This changes only the upper cap/reveal height reference so the 9/14/10 mm ring steps are not masked.

Use `integrated_carousel_tester_v0_8_2_open_base_integration.scad` as the active continuation when the vial-base integration needs local pads instead of a full upper cap. It keeps the lower indexing circles open while tying the vial holder bases into the lower structure.

Use `integrated_carousel_tester_v0_8_3_vial_base_zero_reference.scad` to review the active v0.8-line model with the vial/cuvette base plane treated as the shared mechanical zero/joint plane: vial holders project upward and lower indexing rings project downward from that plane with their reference heights.

Use `integrated_carousel_tester_v0_8_4_vial_base_floor.scad` to review the active v0.8-line model with a complete thin floor only at the vial/cuvette base joint plane, while lower indexing rings still project downward from that plane with different heights.

Use `integrated_carousel_tester_v0_9_stepped_ring_center_fix.scad` to review the corrected architecture after v0.8 print observations: lower ring height differences are preserved by replacing the full low cap with local support pads/spokes, and the visible central boss emerges from the center/index ring height.

Use `integrated_carousel_tester_v0_10_self_supported_center.scad` to review/print the corrected self-supported central boss variant after the v0.8 print abort: a central collar runs from the base/build region to the center/index ring height so the boss no longer starts as an unsupported late feature.

## Active workflow

Use only numbered version files for CAD work.

The previous convenience file `uvvis_carousel_adapter_starter.scad` has been retired from the active workflow to avoid accidental overwrites. New iterations should continue as:

- `uvvis_carousel_adapter_v0_5_*.scad`
- `uvvis_carousel_adapter_v0_6_*.scad`
- and so on.
