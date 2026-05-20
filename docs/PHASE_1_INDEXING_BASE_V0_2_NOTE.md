# Phase 1 Indexing Base v0.2 Note

> **Exploratory reverse-engineering documentation**

## Purpose

`openscad/indexing_base_v0_2_slot_lamina_labels.scad` refines the lower indexing-base model after review of the first V0 geometry.

This version still models only the lower indexing/mounting structure. It does not modify the upper circular-vial carousel.

## Key corrections from v0.1

- preserves the observed opposite-pair relationship:
  - `1-4`
  - `3-B`
  - `5-2`
- assigns one indexing opening below each vial position
- places the larger indexing opening below position `3`
- changes the indexing openings from partial notches to complete rectangular slot cuts through the middle lamina
- uses differentiated wall/lamina thicknesses
- adds raised top labels for vial-position identification

## Updated dimensions

| Feature | Value |
| --- | ---: |
| base diameter | 103 mm |
| base reference height | 15 mm |
| central hole | 3.2 mm |
| ring 1 outer diameter | 61 mm |
| ring 2 outer diameter | 81 mm |
| ring 3 outer diameter | 103 mm |
| ring 1 wall width | 1.52 mm |
| middle indexing lamina width | 1.21 mm |
| outer ring wall width | 2.48 mm |
| small indexing slot width | 2.09 mm |
| large indexing slot width | 5.91 mm |
| ring 1 height | 9 mm |
| ring 2 height | 14 mm |
| ring 3 height | 10 mm |

## Angular mapping

| Label | Angle | Slot width |
| --- | ---: | ---: |
| 1 | 180° | 2.09 mm |
| 4 | 0° | 2.09 mm |
| 3 | 300° | 5.91 mm |
| B | 120° | 2.09 mm |
| 5 | 60° | 2.09 mm |
| 2 | 240° | 2.09 mm |

## Important limitations

This is still a reverse-engineering fit/indexing template. It is not a validated compatibility claim.

The rectangular slot geometry should be physically checked against the actual underside detection/indexing system before integration.

