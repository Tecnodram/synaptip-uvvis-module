/*
SynAptIp Scientific Interoperability Platform - UV-VIS Module
Assembly validation v0.1 - visual overlay of upper carousel and lower indexing base

Purpose:
- Visualize how the upper circular-vial carousel and lower indexing base align.
- Add optional ghost hardware for the lower seating cylinder and upper screw.
- Keep this as a validation/inspection model, not a print-ready integrated part.

Status:
- Exploratory geometric validation aid.
- Does not modify upper or lower production/test files.
*/

$fn = 72;

// ---------- Visibility toggles ----------
show_lower_indexing_base = true;
show_upper_carousel_proxy = true;
show_vial_ghosts = true;
show_lower_seating_cylinder = true;
show_upper_screw = true;
show_center_axis = true;
show_home_reference = true;
show_cutaway_preview = false;

// ---------- Assembly alignment controls ----------
// Increase/decrease this if the upper part sits too high/low over the base.
upper_z_offset = 15;

// Rotate upper assembly if position labels/openings do not align.
upper_rotation_deg = 0;

// Rotate lower indexing base if HOME/index slot alignment needs checking.
lower_rotation_deg = 0;

// ---------- Shared measured/exploratory values ----------
base_diameter = 103;
post_print_diameter_offset = 2.5;
base_diameter_effective = base_diameter + post_print_diameter_offset;
base_height = 15;
base_floor_height = 2;

center_hole_diameter = 3.2;

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

// Position relationship: 1-4, 3-B, 5-2.
position_angles = [180, 0, 300, 120, 60, 240];
position_labels = ["1", "4", "3", "B", "5", "2"];
position_slot_widths = [small_slot_width, small_slot_width, large_slot_width, small_slot_width, small_slot_width, small_slot_width];
home_angle = 300;

// ---------- Upper carousel proxy values ----------
upper_disc_diameter = 108;
upper_disc_thickness = 4;
vial_bore_diameter = 16.4; // preferred measured clearance after print test
vial_outer_diameter = 16;
vial_height = 50;
holder_wall_thickness = 2;
holder_outer_diameter = vial_bore_diameter + 2 * holder_wall_thickness;
holder_height = 50;
upper_holder_pitch_radius = upper_disc_diameter / 2 - vial_outer_diameter / 2 - 2;

// ---------- Hardware proxy values ----------
lower_seating_cylinder_diameter = 7;
lower_seating_cylinder_length = 16.5;
lower_seating_cylinder_height = 12;
upper_screw_diameter = 3.2;
upper_screw_head_diameter = 7;
upper_screw_length = 22;

// ---------- Lower indexing base modules ----------
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

module slot_window(slot_width, angle) {
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

module lower_center_clearance() {
    translate([0, 0, -0.1])
        linear_extrude(height = base_height - 3 + 0.2)
            rounded_slot_2d(lower_seating_cylinder_length, lower_seating_cylinder_diameter);
}

module lower_indexing_base_proxy() {
    difference() {
        union() {
            cylinder(h = base_floor_height, d = base_diameter_effective);
            annular_rib(ring_1_diameter_effective, ring_1_width, ring_1_height);
            annular_rib(ring_2_diameter_effective, index_lamina_width, ring_2_height);
            annular_rib(ring_3_diameter_effective, outer_ring_width, ring_3_height);
        }
        cylinder(h = base_height + 0.4, d = center_hole_diameter);
        lower_center_clearance();
        for (i = [0 : len(position_angles) - 1]) {
            slot_window(position_slot_widths[i], position_angles[i]);
        }
    }
}

// ---------- Upper carousel proxy modules ----------
module upper_base_disc_proxy() {
    difference() {
        cylinder(h = upper_disc_thickness, d = upper_disc_diameter);
        translate([0, 0, -0.1]) cylinder(h = upper_disc_thickness + 0.2, d = center_hole_diameter);
    }
}

module vial_holder_proxy() {
    difference() {
        cylinder(h = holder_height, d = holder_outer_diameter);
        translate([0, 0, -0.1]) cylinder(h = holder_height + 0.2, d = vial_bore_diameter);
    }
}

module upper_carousel_proxy() {
    color([0.2, 0.75, 0.2, 0.42]) upper_base_disc_proxy();
    for (i = [0 : len(position_angles) - 1]) {
        rotate([0, 0, position_angles[i]])
            translate([upper_holder_pitch_radius, 0, upper_disc_thickness])
                color([0.2, 0.75, 0.2, 0.42]) vial_holder_proxy();
    }
}

module vial_ghosts() {
    for (i = [0 : len(position_angles) - 1]) {
        rotate([0, 0, position_angles[i]])
            translate([upper_holder_pitch_radius, 0, upper_disc_thickness])
                color([0.1, 0.45, 1.0, 0.28]) cylinder(h = vial_height, d = vial_outer_diameter);
    }
}

// ---------- Hardware proxy modules ----------
module lower_cylinder_proxy() {
    color([1.0, 0.55, 0.1, 0.55])
        translate([0, 0, -lower_seating_cylinder_height])
            cylinder(h = lower_seating_cylinder_height + 1, d = lower_seating_cylinder_diameter);
}

module upper_screw_proxy() {
    color([0.75, 0.75, 0.75, 0.65]) {
        translate([0, 0, upper_z_offset + upper_disc_thickness])
            cylinder(h = upper_screw_length, d = upper_screw_diameter);
        translate([0, 0, upper_z_offset + upper_disc_thickness + upper_screw_length])
            cylinder(h = 3, d = upper_screw_head_diameter);
    }
}

module center_axis() {
    color([1, 0, 0, 0.6]) cylinder(h = upper_z_offset + holder_height + 20, d = 0.8);
}

module home_reference() {
    color([1, 0, 0, 0.55])
        rotate([0, 0, home_angle])
            translate([base_diameter_effective / 2 + 5, 0, 0])
                cube([12, 1.2, base_height + 4], center = true);
}

// ---------- Assembly ----------
if (show_lower_indexing_base) {
    rotate([0, 0, lower_rotation_deg])
        color([0.2, 0.2, 0.2, 0.85]) lower_indexing_base_proxy();
}

if (show_upper_carousel_proxy) {
    translate([0, 0, upper_z_offset])
        rotate([0, 0, upper_rotation_deg])
            upper_carousel_proxy();
}

if (show_vial_ghosts) {
    translate([0, 0, upper_z_offset])
        rotate([0, 0, upper_rotation_deg])
            vial_ghosts();
}

if (show_lower_seating_cylinder) lower_cylinder_proxy();
if (show_upper_screw) upper_screw_proxy();
if (show_center_axis) center_axis();
if (show_home_reference) home_reference();

if (show_cutaway_preview) {
    // Reserved toggle for future section-view helpers.
}
