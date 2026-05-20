# Phase 1 Indexing Base v0.3 Print-Ready Note

> **Exploratory print-test geometry**

## Purpose

`openscad/indexing_base_v0_3_print_ready.scad` is the print-ready version of the lower indexing base after `v0_2` review.

## Changes from v0.2

The geometry of the indexing base is preserved, but visual/debug aids are disabled:

```scad
debug = false;
show_position_labels = false;
```

This removes floating debug marks, position indicators, and raised labels that were useful for review but should not be printed in this test.

## File to export

Use:

`openscad/indexing_base_v0_3_print_ready.scad`

Suggested STL path:

`exports/indexing_base_v0_3_print_ready.stl`

Suggested G-code path:

`exports/gcode/indexing_base_v0_3_<printer>_<material>_<date>.gcode`

## Print-test goal

Validate the lower indexing/base geometry only:

- central screw clearance
- seating in the mechanism
- angular/indexing behavior
- HOME/reference slot behavior

Do not use this print to claim final compatibility or optical validation.

