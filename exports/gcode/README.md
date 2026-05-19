# G-code Output Directory

> **Local manufacturing outputs — printer-specific**

Save generated `.gcode` files here after slicing in Cura.

Recommended filename pattern:

`uvvis_carousel_adapter_<cad-version>_<printer>_<material>_<date>.gcode`

Example:

`uvvis_carousel_adapter_v0_7_ender3_pla_2026-05-19.gcode`

## Important

G-code is printer-specific and should not be treated as a universal manufacturing artifact.

Before sharing or publishing any `.gcode`, confirm:

- printer model
- firmware assumptions
- nozzle size
- filament type
- temperatures
- bed dimensions
- start/end code safety

Current repository policy keeps `.gcode` ignored by Git unless a future reviewed release intentionally includes it.

