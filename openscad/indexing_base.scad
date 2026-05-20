/*
SynAptIp Scientific Interoperability Platform - UV-VIS Module
Indexing base V0 - independent lower indexing/mounting template

Purpose:
- Generate only the lower indexing/mounting geometry.
- Do not include or modify the upper circular-vial carousel holder.
- Print as a standalone V0 template to test whether the instrument accepts
  the underside/indexing geometry before integration with the upper module.

Status:
- Exploratory reverse-engineering geometry.
- Not a validated compatibility or tolerance claim.
- Dimensions are editable parameters derived from caliper measurements and
  visual inspection notes.
*/

// ---------- Global display controls ----------
$fn = 96;
debug = true;

// ---------- Editable measured / exploratory parameters ----------
base_diameter = 103;
base_height = 15;
center_hole_diameter = 3.2;

ring_1_diameter = 61;
ring_2_diameter = 81;
ring_3_diameter = 103;
ring_width = 2;

// Ring heights were reported in cm and converted to mm:
// 0.9 cm = 9 mm, 1.4 cm = 14 mm, 1.0 cm = 10 mm.
ring_1_height = 9;
ring_2_height = 14;
ring_3_height = 10;

small_slot_width = 2;
large_slot_width = 5;
slot_depth = 3;
slot_height = 4;
home_angle = 0;
positions = 6;
tolerance = 0.25;

// Thin foundation floor joining the concentric ribs.
// Keep this editable because the real underside may require adjustment.
base_floor_height = 2;

// Debug label controls. Labels are visual/manufacturing aids.
debug_label_size = 4;
debug_label_depth = 0.6;
debug_label_radius = ring_2_diameter / 2 - 8;

// ---------- Utility modules ----------
module annular_rib(outer_diameter, rib_width, rib_height) {
    difference() {
        cylinder(h = rib_height, d = outer_diameter);
        translate([0, 0, -0.1])
            cylinder(
                h = rib_height + 0.2,
                d = max(outer_diameter - 2 * rib_width, 0.1)
            );
    }
}

module radial_slot(slot_width, angle) {
    /*
    The observed underside/indexing system includes six radial marks/openings
    on the middle ring. Five are narrow and one is wider. This module subtracts
    a radial notch from the ring geometry to reproduce that observed indexing
    concept in an editable way.
    */
    rotate([0, 0, angle])
        translate([
            ring_2_diameter / 2 - ring_width - slot_depth / 2,
            -slot_width / 2,
            ring_2_height - slot_height
        ])
            cube([
                slot_depth + tolerance,
                slot_width + tolerance,
                slot_height + tolerance
            ]);
}

module debug_position_label(label_text, angle) {
    rotate([0, 0, angle])
        translate([debug_label_radius, 0, base_floor_height])
            linear_extrude(height = debug_label_depth)
                text(
                    label_text,
                    size = debug_label_size,
                    halign = "center",
                    valign = "center"
                );
}

// ---------- Required project modules ----------
module base_disk() {
    /*
    Low circular foundation. The raised concentric rings define the lower
    positioning structure while this floor keeps the template printable as one
    piece.
    */
    cylinder(h = base_floor_height, d = base_diameter);
}

module concentric_rings() {
    /*
    Three concentric ribs based on measured external diameters. Heights are
    modeled independently because the observed base uses different vertical
    levels in the positioning structure.
    */
    annular_rib(ring_1_diameter, ring_width, ring_1_height);
    annular_rib(ring_2_diameter, ring_width, ring_2_height);
    annular_rib(ring_3_diameter, ring_width, ring_3_height);
}

module indexing_slots() {
    /*
    Six index openings distributed every 60 degrees. The larger HOME slot is
    placed at home_angle and is intended to act as angular reference.
    */
    for (i = [0 : positions - 1]) {
        angle = home_angle + i * 360 / positions;
        radial_slot(i == 0 ? large_slot_width : small_slot_width, angle);
    }
}

module center_mount() {
    /*
    Central pass-through hole for the retaining screw. The nominal measured
    screw/hole reference was approximately 3 mm; this V0 uses 3.2 mm as an
    exploratory print-test value.
    */
    cylinder(h = base_height + 0.4, d = center_hole_diameter);
}

module home_marker() {
    /*
    External HOME orientation notch. This is a small visual/mechanical cue
    separate from the larger indexing slot so the printed template can be
    oriented consistently during tests.
    */
    rotate([0, 0, home_angle])
        translate([base_diameter / 2 - 1.5, -3, base_floor_height])
            cube([4, 6, 2]);
}

module debug_marks() {
    if (debug) {
        for (i = [0 : positions - 1]) {
            angle = home_angle + i * 360 / positions;
            debug_position_label(i == 0 ? "HOME" : str(i + 1), angle);
        }
    }
}

module indexing_base() {
    difference() {
        union() {
            base_disk();
            concentric_rings();
            debug_marks();
        }
        center_mount();
        indexing_slots();
        home_marker();
    }
}

indexing_base();
