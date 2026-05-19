# Cura / 3MF / G-code Workflow

> **Exploratory manufacturing workflow — not validated print settings**

## Current target file

Use:

`openscad/uvvis_carousel_adapter_v0_8_export_ready.scad`

## Step 1 — Export STL from OpenSCAD

1. Open the `.scad` file in OpenSCAD.
2. For faster preview, set:

   ```scad
   $fn = 32;
   show_reference_axis = false;
   show_ghost_vials = false;
   ```

3. Use **F5** for preview.
4. Before export, set:

   ```scad
   show_reference_axis = false;
   show_ghost_vials = false;
   ```

5. Use **F6** to render.
6. Export as STL:

   `File > Export > Export as STL`

Suggested local output path:

`exports/uvvis_carousel_adapter_v0_8_export_ready.stl`

## Step 2 — Create 3MF project in Cura

1. Open Cura.
2. Import the exported STL.
3. Confirm scale is in millimeters.
4. Set printer, material, nozzle, and build plate settings.
5. Save the Cura project:

   `File > Save Project`

Suggested local output path:

`exports/uvvis_carousel_adapter_v0_8_export_ready.3mf`

## Step 3 — Apply or create Cura profile

This repository includes an exploratory profile template:

`manufacturing/cura_profiles/synaptip_uvvis_clearance_test_exploratory.curaprofile`

If Cura refuses to import it because of printer-version mismatch, create a new profile manually using the settings documented in:

`manufacturing/cura_profiles/README.md`

If you export the actual profile used for a print test, save it locally in:

`exports/print_profiles/`

## Step 4 — Slice and export G-code

1. In Cura, inspect layer preview.
2. Confirm that labels are readable enough.
3. Confirm support strategy if Cura proposes support inside vial bores.
4. Slice.
5. Save G-code locally:

`exports/gcode/uvvis_carousel_adapter_v0_8_<printer>_<material>_<date>.gcode`

## Important

Do not treat the generated G-code as universally valid. G-code is printer-specific and depends on:

- printer model
- firmware
- nozzle size
- filament
- bed size
- start/end code
- temperature settings

## After printing

Record results in:

`manufacturing/print_test_record_template.csv`
