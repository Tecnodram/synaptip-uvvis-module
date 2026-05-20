/*
SynAptIp Scientific Interoperability Platform - UV-VIS Module
Indexing base v0.4 - post-print fit adjustment

Purpose:
- Apply first physical-print observations to the lower indexing base.
- Increase effective base/ring diameters to compensate observed 2-3 mm undersize.
- Add a lower central clearance opening while preserving the upper screw hole.

Status:
- Exploratory post-print correction.
- Not a validated compatibility or tolerance claim.
- Do not merge with the upper vial carousel until fit/indexing behavior is tested.
*/

// ---------- Global display controls ----------
$fn = 96;
debug = false;
show_position_labels = false;

// ---------- Editable measured / exploratory parameters ----------
base_diameter = 103;
post_print_diameter_offset = 2.5; // exploratory correction from first print: observed 2-3 mm undersize
base_diameter_effective = base_diameter + post_print_diameter_offset;
base_height = 15;
center_hole_diameter = 3.2;

// Lower central clearance observed after first print.
// Upper screw opening remains narrow; underside opens into an oblong clearance.
lower_center_clearance_width = 7;
lower_center_clearance_length = 16.5;
upper_screw_guidance_depth = 3;
lower_center_clearance_depth = base_height - upper_screw_guidance_depth;

ring_1_diameter = 61;
ring_2_diameter = 81;
ring_3_diameter = 103;
ring_1_diameter_effective = ring_1_diameter + post_print_diameter_offset;
ring_2_diameter_effective = ring_2_diameter + post_print_diameter_offset;
ring_3_diameter_effective = ring_3_diameter + post_print_diameter_offset;

// Updated measured/observed wall or lamina thicknesses.
ring_1_width = 1.52;
index_lamina_width = 1.21;
outer_ring_width = 2.48;

// Ring heights were reported in cm and converted to mm.
ring_1_height = 9;
ring_2_height = 14;
ring_3_height = 10;

// Indexing slot widths measured/estimated in mm.
small_slot_width = 2.09;
large_slot_width = 5.91;

// Slot cuts through the complete thin lamina thickness, with slight allowance.
slot_radial_clearance = 0.4;
slot_height = ring_2_height;

// Angular system. Position 3 carries the larger HOME/reference opening.
positions = 6;
home_position_label = "3";
home_angle = 300;
tolerance = 0.25;

// Position labels arranged to preserve opposite pairs:
// 1-4, 5-2, and 3-B.
position_angles = [180, 0, 300, 120, 60, 240];
position_labels = ["1", "4", "3", "B", "5", "2"];
position_slot_widths = [small_slot_width, small_slot_width, large_slot_width, small_slot_width, small_slot_width, small_slot_width];

// Thin foundation floor joining the concentric ribs.
base_floor_height = 2;

// Raised top-label controls.
label_radius = 44 + post_print_diameter_offset / 2;
label_size = 5;
label_height = 0.8;
label_base_z = max(ring_1_height, ring_2_height, ring_3_height);

// Debug helper controls.
debug_mark_radius = ring_2_diameter_effective / 2;
debug_mark_diameter = 1.2;

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

module slot_window(slot_width, angle) {
    /*
    Rectangular indexing window through the full thickness of the middle
    lamina. This represents the observed underside openings as complete slots,
    not shallow decorative notches.

    slot_width is tangential width at the indexed position.
    index_lamina_width is the radial thickness of the lamina being cut.
    */
    rotate([0, 0, angle])
        translate([
            ring_2_diameter_effective / 2 - index_lamina_width - slot_radial_clearance / 2,
            -slot_width / 2,
            -0.1
        ])
            cube([
                index_lamina_width + slot_radial_clearance,
                slot_width + tolerance,
                slot_height + 0.2
            ]);
}

module raised_position_label(label_text, angle) {
    rotate([0, 0, angle])
        translate([label_radius, 0, label_base_z])
            linear_extrude(height = label_height)
                text(
                    label_text,
                    size = label_size,
                    halign = "center",
                    valign = "center"
                );
}

module debug_position_mark(angle) {
    if (debug) {
        rotate([0, 0, angle])
            translate([debug_mark_radius, 0, label_base_z + label_height])
                cylinder(h = 0.8, d = debug_mark_diameter);
    }
}

module rounded_slot_2d(slot_length, slot_width) {
    hull() {
        translate([-(slot_length - slot_width) / 2, 0, 0])
            circle(d = slot_width);
        translate([(slot_length - slot_width) / 2, 0, 0])
            circle(d = slot_width);
    }
}

module lower_center_clearance() {
    /*
    Underside clearance added after print observation. The top retains the
    smaller screw guidance hole, while the lower side opens into an oblong
    clearance for the cylindrical screw-retention feature.
    */
    translate([0, 0, -0.1])
        linear_extrude(height = lower_center_clearance_depth + 0.2)
            rounded_slot_2d(lower_center_clearance_length, lower_center_clearance_width);
}

// ---------- Required project modules ----------
module base_disk() {
    cylinder(h = base_floor_height, d = base_diameter_effective);
}

module concentric_rings() {
    /*
    Three concentric structural/indexing rings with differentiated thicknesses.
    The middle ring is treated as the thin indexing lamina that carries the
    rectangular slot openings.
    */
    annular_rib(ring_1_diameter_effective, ring_1_width, ring_1_height);
    annular_rib(ring_2_diameter_effective, index_lamina_width, ring_2_height);
    annular_rib(ring_3_diameter_effective, outer_ring_width, ring_3_height);
}

module indexing_slots() {
    /*
    Each vial position has an underside slot aligned below it. Position 3 has
    the larger HOME/reference slot. The remaining positions have smaller slots.
    */
    for (i = [0 : len(position_angles) - 1]) {
        slot_window(position_slot_widths[i], position_angles[i]);
    }
}

module center_mount() {
    cylinder(h = base_height + 0.4, d = center_hole_diameter);
}

module home_marker() {
    /*
    External HOME orientation notch aligned with position 3 / large slot.
    */
    rotate([0, 0, home_angle])
        translate([base_diameter_effective / 2 - 1.5, -3, base_floor_height])
            cube([4, 6, 2]);
}

module top_labels() {
    if (show_position_labels) {
        for (i = [0 : len(position_angles) - 1]) {
            raised_position_label(position_labels[i], position_angles[i]);
        }
    }
}

module debug_marks() {
    if (debug) {
        for (i = [0 : len(position_angles) - 1]) {
            debug_position_mark(position_angles[i]);
        }
    }
}

module indexing_base() {
    difference() {
        union() {
            base_disk();
            concentric_rings();
            top_labels();
            debug_marks();
        }
        center_mount();
        lower_center_clearance();
        indexing_slots();
        home_marker();
    }
}

indexing_base();

