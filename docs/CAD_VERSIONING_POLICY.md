# CAD Versioning Policy

> **Exploratory prototype documentation**

## Rule

OpenSCAD design evolution must be preserved as separate versioned files. New iterations should create new files instead of overwriting prior design states.

## Naming convention

Use:

`uvvis_carousel_adapter_vMAJOR_MINOR_description.scad`

Examples:

- `uvvis_carousel_adapter_v0_1_initial_starter.scad`
- `uvvis_carousel_adapter_v0_2_reverse_engineering_reference.scad`
- `uvvis_carousel_adapter_v0_3_six_position_layout.scad`
- `uvvis_carousel_adapter_v0_4_measured_refinement.scad`

Special-purpose prototypes may use their own clear branch name, for example:

- `uvvis_carousel_mechanism_test_v0_1.scad`

## Rationale

This preserves:

- chronological design evolution
- authorship and rationale
- side-by-side comparison of decisions
- reproducibility of historical outputs

## Working-file rule

Do not use an unnumbered convenience working file for active CAD development.

The authoritative design history is the sequence of explicit versioned files. New CAD changes must create a new numbered OpenSCAD file.
