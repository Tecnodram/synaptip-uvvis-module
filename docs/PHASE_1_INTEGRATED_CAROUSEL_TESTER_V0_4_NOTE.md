# Phase 1 Integrated Carousel Tester v0.4 Note

> **Preliminary integrated tester — extended center coupling and 108.10 mm integrated diameter**

## Purpose

`openscad/integrated_carousel_tester_v0_4_extended_center_coupling.scad` builds on v0.3, which established the open lower indexing-base architecture. This version adds the newly measured/observed central coupling projection and resizes the integrated upper/lower outer geometry to a shared `108.10 mm` diameter.

## New measurements integrated

| Feature | Value / interpretation |
| --- | ---: |
| integrated outer diameter | 108.10 mm |
| total center coupling / receiver height | 18.91 mm |
| center coupling projection below lower face | 7.24 mm |
| embedded coupling/receiver height | 11.67 mm |
| internal key width | 2 mm |
| internal key alignment | position axis `1-4` |

## Important modeling assumption

The central coupling projection is modeled as projecting below the lower indexing face. Its total conical receiver path runs from `z = -7.24 mm` to `z = 11.67 mm`, giving a total of `18.91 mm`.

The internal key is centered at the midpoint of that total coupling path:

```scad
internal_key_z_center = -central_coupling_projection + central_coupling_total_height / 2;
```

With the current values, the key center is approximately:

```text
z = 2.215 mm
```

The key remains `2 mm` wide and is positioned away from the central screw clearance so the screw path remains open.

## Diameter correction

The v0.4 file introduces a shared integrated diameter:

```scad
integrated_outer_diameter = 108.10;
```

The outer ring and upper platform both use this value. The lower indexing rings are proportionally resized from the earlier 103 mm reference:

```scad
integrated_resize_factor = integrated_outer_diameter / base_diameter_reference;
```

This is intended to reduce the visible step/mismatch between the upper and lower geometry while preserving the relative indexing-ring layout.

## Review controls

```scad
show_center_coupling_projection = true;
show_lower_indexing_rings = true;
open_lower_indexing_base = true;
show_internal_key = true;
```

## Review checklist

1. Confirm the lower indexing base remains open between rings.
2. Confirm the outer integrated diameter looks unified at 108.10 mm.
3. Confirm the central coupling projects below the lower face.
4. Confirm the internal key is centered along the coupling path and aligned with `1-4`.
5. Confirm the screw path remains visibly open.
6. Confirm there is no unwanted step or non-functional fusion between the upper platform and lower rings.

## Status

Exploratory prototype documentation only. No final compatibility, validation, or production claim is made.
