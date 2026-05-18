# Phase 1 Vial Clearance Test Note v0.6

> **Exploratory print-test geometry — not a final tolerance recommendation**

## Purpose

`uvvis_carousel_adapter_v0_6_vial_clearance_test.scad` is a print-test version used to determine which circular-vial bore diameter allows practical insertion/removal before choosing the final holder clearance.

## Test diameters by position

| Position | Pair | Bore diameter |
| --- | --- | ---: |
| 1 | 1-4 | 16.2 mm |
| 4 | 1-4 | 16.2 mm |
| 2 | 2-5 | 16.4 mm |
| 5 | 2-5 | 16.4 mm |
| B | 3-B | 16.6 mm |
| 3 | 3-B | 16.8 mm |

## How to evaluate after printing

For each position, record:

- whether the vial enters without force
- whether the vial can be removed without sticking
- whether the vial feels too loose
- whether seating depth appears consistent
- whether the central screw still allows the mechanism to move correctly

## Important

The selected diameter after this test should become a future design parameter. It should not be called a validated tolerance until print testing and fit review are documented.

