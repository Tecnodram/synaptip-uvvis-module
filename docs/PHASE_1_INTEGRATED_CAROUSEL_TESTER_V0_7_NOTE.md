# Phase 1 Integrated Carousel Tester v0.7 Note

> **Preliminary integrated tester — central opening referenced to center ring height**

## Purpose

`openscad/integrated_carousel_tester_v0_7_center_ring_reference.scad` clarifies the reference system for the central conical screw/receiver opening.

The prior v0.6 corrected the vertical interpretation by using the vial-base plane as the reference for the portion that projects upward and the portion that extends below. v0.7 keeps that geometric split but adds the center/index lamina ring height as an explicit mechanical reference for configuring and auditing the central opening.

## Reference planes

| Plane / feature | Parameter | Value |
| --- | --- | ---: |
| center/index lamina ring height | `central_ring_reference_z = ring_2_height` | 14.00 mm |
| vial-base plane where vial holders begin | `vial_base_reference_z = integrated_platform_height` | 14.94 mm |
| offset from center ring reference to vial-base plane | `central_ring_to_vial_base_offset` | 0.94 mm |

## Central opening/coupling measurements

| Feature | Parameter | Value |
| --- | --- | ---: |
| total central conical path | `central_coupling_total_height` | 18.91 mm |
| projection above vial-base plane | `central_coupling_projection_above_vial_base` | 7.24 mm |
| portion below vial-base plane | `central_coupling_below_vial_base` | 11.67 mm |
| lower Z of central path | `central_coupling_z_min` | 3.27 mm |
| upper Z of central path | `central_coupling_z_max` | 22.18 mm |
| height above center-ring reference | `central_coupling_height_above_center_ring` | 8.18 mm |
| height below center-ring reference | `central_coupling_height_below_center_ring` | 10.73 mm |

## Internal wall notch/key

The internal wall notch/key remains placed at the midpoint of the full central conical path and aligned with the vial position pair `1-4`.

| Feature | Value |
| --- | ---: |
| key/notch width | 2 mm |
| key/notch height | 7 mm |
| key/notch center Z | 12.725 mm |
| key/notch lower Z | 9.225 mm |
| key/notch upper Z | 16.225 mm |

## Optional visual audit planes

v0.7 adds a non-export-intended visual helper:

```scad
show_center_reference_planes = false;
```

Set it temporarily to `true` in OpenSCAD to display two translucent planes:

- orange: center/index lamina ring reference height
- blue: vial-base plane where vial holders begin

Keep it `false` for STL export.

## Status

Exploratory prototype documentation only. No final compatibility, validation, or production claim is made.
