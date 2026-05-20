# Phase 1 Indexing Base V0 Note

> **Exploratory reverse-engineering documentation**

## Purpose

`openscad/indexing_base.scad` creates an independent lower indexing/mounting template. It intentionally does **not** include the upper circular-vial holder.

The goal is to print and test only the underside/base indexing concept before integrating it with the functional upper carousel.

## Confirmed update

The vial clearance test identified **16.4 mm** as the currently preferred circular-vial bore diameter.

This value should inform the next upper-carousel revision, but the current indexing-base V0 does not modify the upper vial-holder geometry.

## Known geometry inputs

| Feature | Value |
| --- | ---: |
| base diameter | 103 mm |
| approximate total base height | 15 mm |
| central screw hole | 3.2 mm exploratory print-test value |
| ring 1 outer diameter | 61 mm |
| ring 2 outer diameter | 81 mm |
| ring 3 outer diameter | 103 mm |
| ring width | 2 mm |
| ring 1 height | 9 mm |
| ring 2 height | 14 mm |
| ring 3 height | 10 mm |
| small indexing opening | 2 mm |
| large HOME opening | 5 mm |
| index positions | 6 |

## Interpretation

The middle ring contains six angular indexing marks/openings:

- five smaller openings
- one larger HOME/reference opening

The larger opening is placed at `home_angle`.

## Important limitation

This model is a **V0 fit/indexing template**. It is not a final base and should not be described as validated compatibility geometry.

## Suggested export

Open:

`openscad/indexing_base.scad`

Versioned snapshot:

`openscad/indexing_base_v0_1.scad`

Then:

1. Preview with F5.
2. Render with F6.
3. Export STL to:

`exports/indexing_base_v0.stl`

Generated STL/G-code files remain local by default and are ignored by Git until reviewed.
