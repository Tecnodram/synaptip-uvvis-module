# Phase 1 Single Vial Adapter v0.7.1 Note

> **Exploratory single-vial functional variant derived from v0.7**

## Source

Created from:

`openscad/uvvis_carousel_adapter_v0_7_clearance_wall_label_fix.scad`

The original file was not modified.

## New file

`openscad/uvvis_carousel_adapter_v0_7_1_single_vial_16_4.scad`

## Changes

- reduced holder count from 6 to 1
- retained a single vial/cuvette holder position
- set functional bore diameter to 16.4 mm
- updated labels to one single-vial label
- set `show_reference_axis = false` to avoid exporting visual reference axes
- preserved v0.7 exploratory adapter logic otherwise

## Key parameters

```scad
holder_count = 1;
single_vial_bore_diameter_mm = 16.4;
max_test_bore_diameter_mm = single_vial_bore_diameter_mm;
test_bore_diameters_mm = [single_vial_bore_diameter_mm];
```

## Status

Exploratory prototype geometry only. No final compatibility, validation, or production claim is made.
