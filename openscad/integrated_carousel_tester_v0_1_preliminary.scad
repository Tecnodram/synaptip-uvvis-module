/*
SynAptIp Scientific Interoperability Platform - UV-VIS Module
Integrated carousel tester v0.1 - preliminary review before print

Purpose:
- Fuse the lower indexing base and upper circular-vial holder into one
  preliminary tester geometry.
- Keep total base/platform height at 14.94 mm before the vial holders project up.
- Add internal central key/tab aligned with vial-position axis 1-4.

Status:
- Exploratory integrated tester.
- Not validated for compatibility, optical alignment, or production use.
*/

$fn = 96;

// ---------- Export / review toggles ----------
show_vial_ghosts = false;
show_reference_axis = false;
show_cutaway_preview = false;
show_position_labels = true;

// ---------- Global integrated tester dimensions ----------
integrated_platform_height = 14.94;
base_floor_height = 2;

// ---------- Lower indexing base parameters ----------
base_diameter = 103;
post_print_diameter_offset = 2.5;
base_diameter_effective = base_diameter + post_print_diameter_offset;

ring_1_diameter = 61;
ring_2_diameter = 81;
ring_3_diameter = 103;
ring_1_diameter_effective = ring_1_diameter + post_print_diameter_offset;
ring_2_diameter_effective = ring_2_diameter + post_print_diameter_offset;
ring_3_diameter_effective = ring_3_diameter + post_print_diameter_offset;

ring_1_width = 1.52;
index_lamina_width = 1.21;
outer_ring_width = 2.48;

ring_1_height = 9;
ring_2_height = 14;
ring_3_height = 10;

small_slot_width = 2.09;
large_slot_width = 5.91;
slot_radial_clearance = 0.4;
slot_height = ring_2_height;
tolerance = 0.25;

// ---------- Upper carousel / vial holder parameters ----------
upper_disc_diameter = 108;
upper_disc_thickness = integrated_platform_height;
vial_bore_diameter = 16.4;
vial_outer_diameter = 16;
vial_height = 50;
holder_wall_thickness = 2;
holder_outer_diameter = vial_bore_diameter + 2 * holder_wall_thickness;
holder_height = 50;
upper_holder_pitch_radius = upper_disc_diameter / 2 - vial_outer_diameter / 2 - 2;

// Optical window is retained as exploratory geometry.
optical_window_width = 7;
optical_window_height = 13;
optical_window_base_offset = 13;

// ---------- Angular position mapping ----------
// Preserve paired relationship: 1-4, 3-B, 5-2.
position_angles = [180, 0, 300, 120, 60, 240];
position_labels = ["1", "4", "3", "B", "5", "2"];
position_slot_widths = [small_slot_width, small_slot_width, large_slot_width, small_slot_width, small_slot_width, small_slot_width];
home_angle = 300;

// ---------- Label parameters ----------
label_radius = upper_holder_pitch_radius - 12;
label_size = 3;
label_height = 0.8;
label_z = integrated_platform_height;

// ---------- Central screw / rotating mechanism interface ----------
center_screw_hole_diameter = 3.2;

// Central underside receiving bore for equipment rotation cylinder.
// Preliminary values derived from post-print observations.
central_receiver_top_diameter = 4;
central_receiver_bottom_diameter = 7;
central_receiver_depth = integrated_platform_height;

// Internal key/tab/rib aligned with the 1-4 axis. This is modeled as a
// protruding internal line on the receiver wall to help engage the mechanism.
internal_key_axis_angle = 180; // aligned with 1-4
internal_key_width = 2;
internal_key_radial_projection = 1.2;
internal_key_height = 7;
internal_key_z_center = integrated_platform_height / 2;
internal_key_receiver_radius_at_center =
    (central_receiver_top_diameter + central_receiver_bottom_diameter) / 4;

// ---------- Utility geometry ----------
module annular_rib(outer_diameter, rib_width, rib_height) {
    difference() {
        cylinder(h = rib_height, d = outer_diameter);
        translate([0, 0, -0.1])
            cylinder(h = rib_height + 0.2, d = max(outer_diameter - 2 * rib_width, 0.1));
    }
}

module rounded_slot_2d(slot_length, slot_width) {
    hull() {
        translate([-(slot_length - slot_width) / 2, 0]) circle(d = slot_width);
        translate([(slot_length - slot_width) / 2, 0]) circle(d = slot_width);
    }
}

module rectangular_index_slot(slot_width, angle) {
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
        translate([label_radius, 0, label_z])
            linear_extrude(height = label_height)
                text(
                    label_text,
                    size = label_size,
                    halign = "center",
                    valign = "center"
                );
}

// ---------- Lower + upper integrated solid ----------
module lower_indexing_features() {
    annular_rib(ring_1_diameter_effective, ring_1_width, min(ring_1_height, integrated_platform_height));
    annular_rib(ring_2_diameter_effective, index_lamina_width, min(ring_2_height, integrated_platform_height));
    annular_rib(ring_3_diameter_effective, outer_ring_width, min(ring_3_height, integrated_platform_height));
}

module upper_platform_disc() {
    cylinder(h = integrated_platform_height, d = upper_disc_diameter);
}

module vial_holder() {
    difference() {
        cylinder(h = holder_height, d = holder_outer_diameter);
        translate([0, 0, -0.1])
            cylinder(h = holder_height + 0.2, d = vial_bore_diameter);
        translate([
            -optical_window_width / 2,
            -holder_outer_diameter,
            optical_window_base_offset
        ])
            cube([
                optical_window_width,
                holder_outer_diameter * 2,
                optical_window_height
            ]);
    }
}

module vial_holder_pattern() {
    for (i = [0 : len(position_angles) - 1]) {
        rotate([0, 0, position_angles[i]])
            translate([upper_holder_pitch_radius, 0, integrated_platform_height])
                vial_holder();
    }
}

module position_labels_relief() {
    if (show_position_labels) {
        for (i = [0 : len(position_angles) - 1]) {
            raised_position_label(position_labels[i], position_angles[i]);
        }
    }
}

module vial_ghosts() {
    if (show_vial_ghosts) {
        for (i = [0 : len(position_angles) - 1]) {
            rotate([0, 0, position_angles[i]])
                translate([upper_holder_pitch_radius, 0, integrated_platform_height])
                    color([0.1, 0.45, 1.0, 0.28])
                        cylinder(h = vial_height, d = vial_outer_diameter);
        }
    }
}

// ---------- Subtractive mechanical interface ----------
module center_screw_hole() {
    cylinder(h = integrated_platform_height + holder_height + 1, d = center_screw_hole_diameter);
}

module central_receiver_conical_clearance() {
    translate([0, 0, -0.1])
        cylinder(
            h = central_receiver_depth + 0.2,
            d1 = central_receiver_bottom_diameter,
            d2 = central_receiver_top_diameter
        );
}

module indexing_slots() {
    for (i = [0 : len(position_angles) - 1]) {
        rectangular_index_slot(position_slot_widths[i], position_angles[i]);
    }
}

// ---------- Positive internal key feature ----------
module internal_alignment_key() {
    /*
    Internal rib/key aligned with vial positions 1-4. This is a preliminary
    mechanical engagement feature intended to help the center receiver seat and
    rotate with the instrument mechanism. The radial location is based on the
    conical receiver radius at mid-height so the rib sits on the receiver wall
    instead of only occupying the opening.
    */
    rotate([0, 0, internal_key_axis_angle])
        translate([
            internal_key_receiver_radius_at_center - internal_key_radial_projection / 2,
            -internal_key_width / 2,
            internal_key_z_center - internal_key_height / 2
        ])
            cube([
                internal_key_radial_projection,
                internal_key_width,
                internal_key_height
            ]);
}

module integrated_carousel_tester() {
    difference() {
        union() {
            upper_platform_disc();
            lower_indexing_features();
            vial_holder_pattern();
            position_labels_relief();
        }
        center_screw_hole();
        central_receiver_conical_clearance();
        indexing_slots();
        if (show_cutaway_preview) {
            translate([0, -upper_disc_diameter / 2, -1])
                cube([upper_disc_diameter, upper_disc_diameter, integrated_platform_height + holder_height + 2]);
        }
    }
    // Add key after subtracting the central receiver so it protrudes inward.
    internal_alignment_key();
}

integrated_carousel_tester();
vial_ghosts();

if (show_reference_axis) {
    color("red") cube([130, 0.6, 0.6], center = true);
    color("green") cube([0.6, 130, 0.6], center = true);
    color("blue") translate([0, 0, 25]) cube([0.6, 0.6, 50], center = true);
}
