# Print Profiles Output Directory

> **Local slicing/profile outputs — printer-specific**

Save Cura-exported print profiles here when you want to keep the exact settings used for a print test.

Recommended filename pattern:

`<slicer>_<printer>_<material>_<nozzle>_<purpose>_<date>.curaprofile`

Example:

`cura_ender3_pla_0p4_uvvis_clearance_test_2026-05-19.curaprofile`

## What belongs here

- Cura `.curaprofile` files exported from your local Cura setup
- printer/material-specific slicing profiles
- test profiles linked to a specific print run

## What does not belong here

- raw `.gcode`
- STL/3MF model exports
- confidential printer/network settings

## Repository policy

Actual exported profiles may contain machine-specific or user-specific configuration. They are treated as local manufacturing artifacts unless reviewed for publication.

The directory README is versioned, but generated profile files should remain local unless intentionally reviewed and added.

