# Phase 1 Integrated Carousel Tester v0.8.2 Note

> **Active continuation from v0.8.1 — open local base integration**

## Purpose

`openscad/integrated_carousel_tester_v0_8_2_open_base_integration.scad` continues from the active v0.8/v0.8.1 design direction. It does **not** continue from v0.9/v0.10.

The goal is to improve integration between the vial/cuvette holder base and the lower indexing base without creating a full cap that covers the lower indexing circles.

## Main change from v0.8.1

v0.8.1 fixed the upper cap height reference, but still used a full circular cap when enabled. v0.8.2 disables the full cap by default and uses local pads instead.

```scad
use_full_upper_cap = false;
show_local_vial_base_pads = true;
```

## Local integration geometry

Local pads are added under the vial holders and at the center only. The spaces between the lower indexing circles remain open.

```scad
local_vial_base_pad_diameter = holder_outer_diameter + 5;
local_vial_base_pad_overlap = 0.1;
local_vial_base_pad_z = lower_ring_reveal_height - local_vial_base_pad_overlap;
local_vial_base_pad_height = integrated_platform_height - local_vial_base_pad_z;
local_center_pad_diameter = 18;
```

Current values:

| Feature | Value |
| --- | ---: |
| ring 1 height | 9 mm |
| ring 2 / center-index lamina height | 14 mm |
| ring 3 height | 10 mm |
| local pad start Z | 13.9 mm |
| local pad overlap into ring-2 height | 0.1 mm |
| vial-base plane | 14.94 mm |
| local pad height | 1.04 mm |
| full upper cap | disabled |

## What remains unchanged from v0.8.1

- ring heights from `indexing_base_v0_3_print_ready.scad`
- radial ring layout
- vial bore diameter
- central screw clearance
- conical central receiver
- internal 1-4 key
- labels
- indexing slots and tolerance parameters

## Why this version exists

This version tries to solve the integration problem without repeating the v0.9/v0.10 design direction. It keeps the part close to v0.8 while avoiding a complete cap that masks the lower indexing circles.

## Status

Exploratory print-test geometry only. No final compatibility, validation, or production claim is made.
