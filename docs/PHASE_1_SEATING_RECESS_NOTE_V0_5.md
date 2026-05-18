# Phase 1 Seating Recess Note v0.5

> **Exploratory / unvalidated**

## Issue observed

In `uvvis_carousel_adapter_v0_4_measured_refinement.scad`, the vial entry space may not be visually obvious in rendered previews because:

- ghost vials can visually occupy the bore area
- the holder used a straight internal bore without a distinct seating feature
- no internal step or lead-in feature indicated how the vial should settle

## v0.5 response

`uvvis_carousel_adapter_v0_5_seating_recess.scad` adds:

- a shallow internal seating recess
- a slightly wider lower landing region
- a top lead-in preview for easier insertion/removal
- optical-window placement compensated by the seating recess depth
- an optional holder cutaway preview toggle

## Important status

The seating recess dimensions are exploratory print-test variables, not validated tolerances.

Current provisional variables:

| Parameter | Value | Meaning |
| --- | ---: | --- |
| `seat_recess_depth_mm` | 1.5 mm | depth of the internal seating step |
| `seat_recess_extra_diameter_mm` | 1.0 mm | extra diameter at the seating pocket |
| `top_lead_in_depth_mm` | 2.0 mm | height of the upper insertion guide |
| `top_lead_in_extra_diameter_mm` | 2.0 mm | extra top opening diameter |

## Optical-window handling

The lower edge of the holder window is moved by:

`optical_window_base_offset_mm - seat_recess_depth_mm`

This keeps the window aligned to the vial's seated base rather than to the top surface of the printed disc.

