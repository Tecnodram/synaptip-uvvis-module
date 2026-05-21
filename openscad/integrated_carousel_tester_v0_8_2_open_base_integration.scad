/*
SynAptIp Scientific Interoperability Platform - UV-VIS Module
Integrated carousel tester v0.8.2 - open local base integration from v0.8.1

Purpose:
- Fuse the lower indexing base and upper circular-vial holder into one
  preliminary tester geometry while preserving the lower indexing base open between annular rings.
- Keep total base/platform height at 14.94 mm before the vial holders project up.
- Add internal central key/tab aligned with vial-position axis 1-4.
- Add an extended conical central coupling/receiver projection for mechanical review.
- Refine the lower indexing-ring radial layout from post-integration caliper measurements.
- Reference the central coupling to the upper vial-base plane: part projects above
  that plane and part extends below it.
- Make the center ring/index lamina height an explicit mechanical reference for
  configuring the central conical opening.
- Freeze review helpers off for STL export and exploratory print testing.
- Preserve v0.8 geometry while correcting only the upper cap height reference so lower ring heights remain visible like indexing_base_v0_3_print_ready.
- Replace the full upper cap with local integration pads under vial holders so the lower indexing circles remain open rather than fully covered.

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
show_lower_indexing_rings = true;
show_integrated_top_cap = true;
show_internal_key = true;
open_lower_indexing_base = true;
show_center_coupling_projection = true;
show_center_reference_planes = false;
print_ready_export = true;
use_full_upper_cap = false;
show_local_vial_base_pads = true;

// ---------- Global integrated tester dimensions ----------
integrated_platform_height = 14.94;
integrated_outer_diameter = 108.10;
base_floor_height = 2;
lower_ring_reveal_height = 14; // v0.8.1: match center/index ring height from indexing_base_v0_3_print_ready so 9/14/10 mm ring steps are not masked
top_cap_height = integrated_platform_height - lower_ring_reveal_height;

// ---------- Lower indexing base parameters ----------
// v0.5 ring layout is reconstructed from radial measurements taken on the
// integrated piece, not by uniform scaling. Heights are intentionally unchanged.
base_diameter_effective = integrated_outer_diameter;

outer_to_second_total_radial = 13.51;
outer_ring_width = 2.87;
second_ring_width_outer_measure = 1.20;

second_to_third_total_radial = 11.15;
second_ring_width_inner_measure = 1.24;
inner_ring_width = 1.57;

// Same second/index lamina measured from two adjacent spans; use an editable
// average while preserving both raw measured values above for auditability.
index_lamina_width = (second_ring_width_outer_measure + second_ring_width_inner_measure) / 2;

outer_to_second_gap =
    outer_to_second_total_radial - outer_ring_width - second_ring_width_outer_measure;
second_to_inner_gap =
    second_to_third_total_radial - second_ring_width_inner_measure - inner_ring_width;

outer_radius = integrated_outer_diameter / 2;
ring_3_outer_radius = outer_radius;
ring_3_inner_radius = ring_3_outer_radius - outer_ring_width;
ring_2_outer_radius = ring_3_inner_radius - outer_to_second_gap;
ring_2_inner_radius = ring_2_outer_radius - index_lamina_width;
ring_1_outer_radius = ring_2_inner_radius - second_to_inner_gap;
ring_1_inner_radius = ring_1_outer_radius - inner_ring_width;

ring_1_diameter_effective = ring_1_outer_radius * 2;
ring_2_diameter_effective = ring_2_outer_radius * 2;
ring_3_diameter_effective = integrated_outer_diameter;

ring_1_width = inner_ring_width;

ring_1_height = 9;
ring_2_height = 14;
ring_3_height = 10;

small_slot_width = 2.09;
large_slot_width = 5.91;
slot_radial_clearance = 0.4;
slot_height = ring_2_height;
tolerance = 0.25;
slot_fit_tolerance = tolerance; // exploratory clearance added to indexing slot widths
vial_clearance_target = 0.4; // 16.4 mm bore for nominal 16.0 mm vial/cuvette body
center_screw_clearance_note = 0.2; // 3.2 mm screw opening for nominal 3.0 mm screw observation

// ---------- Upper carousel / vial holder parameters ----------
upper_disc_diameter = integrated_outer_diameter;
upper_disc_thickness = integrated_platform_height;
vial_bore_diameter = 16.4;
vial_outer_diameter = 16;
vial_height = 50;
holder_wall_thickness = 2;
holder_outer_diameter = vial_bore_diameter + 2 * holder_wall_thickness;
holder_height = 50;
upper_holder_pitch_radius = upper_disc_diameter / 2 - vial_outer_diameter / 2 - 2;
local_vial_base_pad_diameter = holder_outer_diameter + 5;
local_vial_base_pad_overlap = 0.1;
local_vial_base_pad_z = lower_ring_reveal_height - local_vial_base_pad_overlap;
local_vial_base_pad_height = integrated_platform_height - local_vial_base_pad_z;
local_center_pad_diameter = 18;

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
central_ring_reference_z = ring_2_height; // height of the center/index lamina ring
vial_base_reference_z = integrated_platform_height; // plane where vial holders begin
central_ring_to_vial_base_offset = vial_base_reference_z - central_ring_reference_z;

central_receiver_top_diameter = 4;
central_receiver_bottom_diameter = 7;
central_coupling_total_height = 18.91;
central_coupling_projection_above_vial_base = 7.24;
central_coupling_below_vial_base = central_coupling_total_height - central_coupling_projection_above_vial_base;
central_coupling_z_min = vial_base_reference_z - central_coupling_below_vial_base;
central_coupling_z_max = vial_base_reference_z + central_coupling_projection_above_vial_base;
central_coupling_height_above_center_ring = central_coupling_z_max - central_ring_reference_z;
central_coupling_height_below_center_ring = central_ring_reference_z - central_coupling_z_min;
central_receiver_depth = central_coupling_total_height;

// Positive central coupling boss around the screw/receiver opening.
// Outer dimensions are exploratory and intentionally editable after visual/mechanical review.
central_coupling_outer_top_diameter = 10.5;
central_coupling_outer_bottom_diameter = 8.5;

// Internal key/tab/rib aligned with the 1-4 axis. This is modeled as a
// protruding internal line on the receiver wall to help engage the mechanism.
internal_key_axis_angle = 180; // aligned with 1-4
internal_key_width = 2;
internal_key_radial_projection = 1.2;
internal_key_height = 7;
internal_key_z_center = central_coupling_z_min + central_coupling_total_height / 2;
internal_key_z_min = internal_key_z_center - internal_key_height / 2;
internal_key_z_max = internal_key_z_center + internal_key_height / 2;
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
                slot_width + slot_fit_tolerance,
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
    if (show_lower_indexing_rings) {
        // Visible lower indexing geometry: these ribs reproduce the concentric ring/lamina system observed in the reference base.
        annular_rib(ring_1_diameter_effective, ring_1_width, min(ring_1_height, integrated_platform_height));
        annular_rib(ring_2_diameter_effective, index_lamina_width, min(ring_2_height, integrated_platform_height));
        annular_rib(ring_3_diameter_effective, outer_ring_width, min(ring_3_height, integrated_platform_height));
    }
}

module optional_lower_structural_floor() {
    /*
    Optional review-only floor. The real indexing-base logic is open between
    rings, so open_lower_indexing_base defaults to true and this floor is not
    generated unless deliberately enabled for a structural comparison.
    */
    if (!open_lower_indexing_base) {
        cylinder(h = base_floor_height, d = ring_3_diameter_effective);
    }
}

module upper_platform_disc() {
    if (show_integrated_top_cap) {
        if (use_full_upper_cap) {
            // Legacy v0.8/v0.8.1 comparison mode only.
            translate([0, 0, lower_ring_reveal_height])
                cylinder(h = top_cap_height, d = upper_disc_diameter);
        }

        if (show_local_vial_base_pads) {
            /*
            v0.8.2: local integration from the vial-base plane to the lower
            base. Pads sit under each vial holder and a small center pad ties
            the central region, while spaces between lower indexing circles
            remain open.
            */
            translate([0, 0, local_vial_base_pad_z])
                cylinder(h = local_vial_base_pad_height, d = local_center_pad_diameter);

            for (i = [0 : len(position_angles) - 1]) {
                rotate([0, 0, position_angles[i]])
                    translate([upper_holder_pitch_radius, 0, local_vial_base_pad_z])
                        cylinder(h = local_vial_base_pad_height, d = local_vial_base_pad_diameter);
            }
        }
    }
}

module center_coupling_projection() {
    /*
    Exploratory central coupling boss referenced to the upper vial-base plane.
    It projects upward above the plane where vial holders begin and continues
    downward into the platform. The internal conical receiver and screw clearance
    are subtracted later so the screw path remains open while the internal wall
    key can engage the retention/rotation feature.
    */
    if (show_center_coupling_projection) {
        translate([0, 0, central_coupling_z_min])
            cylinder(
                h = central_coupling_total_height,
                d1 = central_coupling_outer_bottom_diameter,
                d2 = central_coupling_outer_top_diameter
            );
    }
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

module center_reference_planes() {
    if (show_center_reference_planes) {
        color([1.0, 0.65, 0.0, 0.25])
            translate([0, 0, central_ring_reference_z])
                cylinder(h = 0.18, d = integrated_outer_diameter);
        color([0.1, 0.7, 1.0, 0.25])
            translate([0, 0, vial_base_reference_z])
                cylinder(h = 0.18, d = integrated_outer_diameter);
    }
}

// ---------- Subtractive mechanical interface ----------
module center_screw_hole() {
    translate([0, 0, central_coupling_z_min - 0.5])
        cylinder(
            h = holder_height + central_coupling_total_height + 1,
            d = center_screw_hole_diameter
        );
}

module central_receiver_conical_clearance() {
    translate([0, 0, central_coupling_z_min - 0.1])
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

// ---------- Positive internal wall key / notch feature ----------
module internal_alignment_key() {
    /*
    Internal wall key/notch aligned with vial positions 1-4. This is a
    preliminary mechanical engagement feature on the inner wall of the conical
    center receiver/screw passage. It is intended to represent the mid-cylinder
    retention feature discussed during reverse engineering while preserving the
    central screw path. The radial location is based on the conical receiver
    radius at mid-height so the feature sits on the receiver wall instead of
    only occupying the opening.
    */
    rotate([0, 0, internal_key_axis_angle])
        translate([
            internal_key_receiver_radius_at_center - internal_key_radial_projection / 2,
            -internal_key_width / 2,
            internal_key_z_min
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
            optional_lower_structural_floor();
            center_coupling_projection();
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
    if (show_internal_key) {
        internal_alignment_key();
    }
}

integrated_carousel_tester();
vial_ghosts();
center_reference_planes();

if (show_reference_axis) {
    color("red") cube([130, 0.6, 0.6], center = true);
    color("green") cube([0.6, 130, 0.6], center = true);
    color("blue") translate([0, 0, 25]) cube([0.6, 0.6, 50], center = true);
}








