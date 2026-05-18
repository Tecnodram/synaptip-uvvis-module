# Phase 1 Measured Notes v0.2

> **Exploratory prototype documentation**

## Confirmed measurements

All dimensions below were reported as measured with a caliper by the project author.

| Feature | Confirmed value | Note |
| --- | ---: | --- |
| central fastening hole | 3.0 mm | intended for the central retaining screw |
| total base height | 15.0 mm | original base |
| concentric ring 1 outer diameter | 61.0 mm | measured outer diameter |
| concentric ring 2 outer diameter | 81.0 mm | measured outer diameter |
| concentric ring 3 outer diameter | 103.0 mm | measured outer diameter |
| common narrow opening width | 2.0 mm | approximate |
| special wider opening width | 5.0 mm | aligned with position `3` |
| vial outer diameter | 16.0 mm | target circular vial |
| vial height | 50.0 mm | target circular vial |
| vial optical window | 13.0 mm high × 7.0 mm wide | target circular vial |
| vial optical window lower edge | 13.0 mm from vial base | target circular vial |

## Functional mapping

- six vial positions are used
- opposite pairs are `1–4`, `2–5`, and `3–B`
- `B` means blank
- the special wider opening aligns with position `3`

## Immediate design consequence

The next print-oriented artifact should be an **intermediate mechanical test piece**:

- simple disc
- central screw hole
- six vial positions
- minimal geometry needed to test fit and movement

This is intentionally not the final refined geometry.

## Fit note for circular vials

The earlier starter geometry used placeholder holder dimensions that were not yet suitable for a 16 mm vial fit check. From this revision onward:

- the model keeps a dedicated `holder_inner_diameter_mm`
- the nominal starting value is linked to the vial diameter
- any added clearance must be treated as a **future test variable**, not as a validated tolerance

This keeps vial insertion/removal under explicit engineering review rather than hiding it inside an arbitrary assumed tolerance.

## CAD lineage note

Following author instruction, prior OpenSCAD states are now preserved as separate versioned files rather than being overwritten in place. This revision corresponds to:

- `uvvis_carousel_adapter_v0_4_measured_refinement.scad`
- `uvvis_carousel_mechanism_test_v0_1.scad`

The next design branch adds an internal seating recess in:

- `uvvis_carousel_adapter_v0_5_seating_recess.scad`
