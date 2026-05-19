# Phase 1 STL Export Note v0.8

> **Exploratory manufacturing note**

## Problem observed

The reference axes were exported into the STL because `show_reference_axis` was enabled. In OpenSCAD, reference axes are real geometry when defined with cubes/cylinders, so they must be disabled before export.

## Export-ready file

Use:

`openscad/uvvis_carousel_adapter_v0_8_export_ready.scad`

This version has:

```scad
show_reference_axis = false;
show_ghost_vials = false;
```

## Before exporting STL

Confirm these settings:

```scad
show_reference_axis = false;
show_ghost_vials = false;
show_position_labels = true;
```

Then:

1. Preview with **F5**.
2. Render with **F6**.
3. Export STL.

## Cura placement

If the model appears tilted or not attached to the build plate in Cura:

1. Select the model.
2. Use **Lay Flat** / **Lay selected face flat**.
3. Click the large circular bottom face.
4. Use **Drop Down Model** / **Automatically drop models to build plate** if available.
5. Confirm the disc bottom sits on `Z = 0`.

## Do not export

Do not export with:

```scad
show_reference_axis = true;
show_ghost_vials = true;
```

Those are visual aids only and should not be present in manufacturing STL files.

