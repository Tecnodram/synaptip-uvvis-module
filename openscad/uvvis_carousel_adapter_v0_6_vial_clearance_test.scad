/*
SynAptIp Scientific Interoperability Platform - UV-VIS Module
Adapter v0.6 - vial clearance test prototype

Purpose:
- print a six-position clearance tester before choosing final vial fit
- preserve paired labels: 1-4, 2-5, 3-B
- test different bore diameters from 16.2 mm to 16.8 mm

Status:
- Phase 1 exploratory print-test geometry
- not a final adapter
- not a validated tolerance set
*/

// ---------- Global display controls ----------
$fn = 96;
show_reference_axis = true;

// ---------- Placeholder parameters ----------
// These values are intentionally non-validated starter values.
disc_diameter_mm = 108;
disc_radius_mm = disc_diameter_mm / 2;
outer_diameter_mm = disc_diameter_mm;
inner_clearance_diameter_mm = 40;
base_thickness_mm = 4;
holder_count = 6;
vial_outer_diameter_mm = 16;
vial_radius_mm = vial_outer_diameter_mm / 2;
provisional_outer_margin_mm = 2;
holder_pitch_radius_mm = disc_radius_mm - vial_radius_mm - provisional_outer_margin_mm;
holder_pitch_diameter_mm = holder_pitch_radius_mm * 2;
provisional_vial_clearance_mm = 0; // retained for lineage; v0.6 uses per-position test diameters
holder_inner_diameter_mm = vial_outer_diameter_mm + provisional_vial_clearance_mm;
holder_wall_thickness_mm = 2;
holder_outer_diameter_mm = holder_inner_diameter_mm + 2 * holder_wall_thickness_mm;
vial_height_mm = 50;
holder_height_mm = vial_height_mm;
optical_window_width_mm = 7;
optical_window_height_mm = 13;
optical_window_base_offset_mm = 13;
seat_recess_depth_mm = 1.5;
seat_recess_extra_diameter_mm = 1.0;
seat_recess_diameter_mm = holder_inner_diameter_mm + seat_recess_extra_diameter_mm;
top_lead_in_depth_mm = 2.0;
top_lead_in_extra_diameter_mm = 2.0;

// Reverse-engineering placeholders from early observations
// Replace only after measurement review.
ring_1_diameter_mm = 61;
ring_2_diameter_mm = 81;
ring_3_diameter_mm = 103;
center_fastener_diameter_mm = 3;
radial_spoke_count = 8;
provisional_slot_count = 6;
show_ghost_vials = true;
show_position_labels = true;
show_holder_cutaway_preview = false;
label_depth_mm = 0.8;
label_size_mm = 3.4;
pair_label_size_mm = 2.4;
position_labels = ["4 / 16.2", "5 / 16.4", "B / 16.6", "1 / 16.2", "2 / 16.4", "3 / 16.8"];
position_pair_labels = ["pair 1-4", "pair 2-5", "pair 3-B", "pair 1-4", "pair 2-5", "pair 3-B"];
test_bore_diameters_mm = [16.2, 16.4, 16.6, 16.2, 16.4, 16.8];

module reference_axis() {
    color("red") cube([140, 0.6, 0.6], center = true);
    color("green") cube([0.6, 140, 0.6], center = true);
    color("blue") cube([0.6, 0.6, 40], center = true);
}

module base_ring() {
    difference() {
        cylinder(h = base_thickness_mm, d = outer_diameter_mm);
        translate([0, 0, -0.1])
            cylinder(h = base_thickness_mm + 0.2, d = inner_clearance_diameter_mm);
    }
}

module concentric_reference_rings() {
    for (d = [ring_1_diameter_mm, ring_2_diameter_mm, ring_3_diameter_mm]) {
        difference() {
            cylinder(h = base_thickness_mm, d = d);
            translate([0, 0, -0.1])
                cylinder(h = base_thickness_mm + 0.2, d = max(d - 4, 0.1));
        }
    }
}

module radial_spokes() {
    for (i = [0 : radial_spoke_count - 1]) {
        rotate([0, 0, i * 360 / radial_spoke_count])
            translate([ring_1_diameter_mm / 4, 0, base_thickness_mm / 2])
                cube([ring_1_diameter_mm / 2, 2, base_thickness_mm], center = true);
    }
}

module central_fastener_reference() {
    cylinder(h = base_thickness_mm + 0.2, d = center_fastener_diameter_mm);
}

function test_bore_diameter(i) = test_bore_diameters_mm[i];
function test_seat_diameter(i) = test_bore_diameter(i) + seat_recess_extra_diameter_mm;

module ghost_vial() {
    color([0.1, 0.5, 1.0, 0.28])
        cylinder(h = vial_height_mm, d = vial_outer_diameter_mm);
}

module ghost_vial_pattern() {
    for (i = [0 : holder_count - 1]) {
        rotate([0, 0, i * 360 / holder_count])
            translate([holder_pitch_radius_mm, 0, base_thickness_mm - seat_recess_depth_mm])
                ghost_vial();
    }
}

module seating_recess_pattern() {
    for (i = [0 : holder_count - 1]) {
        rotate([0, 0, i * 360 / holder_count])
            translate([
                holder_pitch_radius_mm,
                0,
                base_thickness_mm - seat_recess_depth_mm
            ])
                cylinder(
                    h = seat_recess_depth_mm + 0.25,
                    d = test_seat_diameter(i)
                );
    }
}

module recessed_position_labels() {
    for (i = [0 : holder_count - 1]) {
        rotate([0, 0, i * 360 / holder_count]) {
            translate([holder_pitch_radius_mm - 10, 0, base_thickness_mm - label_depth_mm])
                linear_extrude(height = label_depth_mm + 0.1)
                    text(
                        position_labels[i],
                        size = label_size_mm,
                        halign = "center",
                        valign = "center"
                    );
            translate([holder_pitch_radius_mm - 10, -5, base_thickness_mm - label_depth_mm])
                linear_extrude(height = label_depth_mm + 0.1)
                    text(
                        position_pair_labels[i],
                        size = pair_label_size_mm,
                        halign = "center",
                        valign = "center"
                    );
        }
    }
}

module vial_holder(i = 0) {
    difference() {
        cylinder(h = holder_height_mm, d = holder_outer_diameter_mm);

        // Main insertion bore. The clearance parameter is exploratory and
        // must be validated by print tests before being treated as a fit value.
        translate([0, 0, -0.1])
            cylinder(
                h = holder_height_mm + 0.2,
                d = test_bore_diameter(i)
            );

        // Shallow lower seating recess so the vial has a repeatable landing
        // surface without redefining the optical-window datum.
        translate([0, 0, -seat_recess_depth_mm])
            cylinder(
                h = seat_recess_depth_mm + 0.15,
                d = test_seat_diameter(i)
            );

        // Gentle top lead-in preview for easier insertion/removal.
        translate([0, 0, holder_height_mm - top_lead_in_depth_mm])
            cylinder(
                h = top_lead_in_depth_mm + 0.1,
                d1 = test_bore_diameter(i),
                d2 = test_bore_diameter(i) + top_lead_in_extra_diameter_mm
            );

        translate([
            -optical_window_width_mm / 2,
            -holder_outer_diameter_mm,
            optical_window_base_offset_mm - seat_recess_depth_mm
        ])
            cube([
                optical_window_width_mm,
                holder_outer_diameter_mm * 2,
                optical_window_height_mm
            ]);

        // Optional visual cutaway only; keep disabled for printable review.
        if (show_holder_cutaway_preview) {
            translate([0, -holder_outer_diameter_mm / 2, 0])
                cube([
                    holder_outer_diameter_mm,
                    holder_outer_diameter_mm,
                    holder_height_mm + 0.2
                ]);
        }
    }
}

module circular_holder_pattern() {
    for (i = [0 : holder_count - 1]) {
        rotate([0, 0, i * 360 / holder_count])
            translate([holder_pitch_radius_mm, 0, base_thickness_mm])
                vial_holder(i);
    }
}

module exploratory_adapter() {
    difference() {
        union() {
            base_ring();
            // The following are reverse-engineering reference features only.
            // They are not yet validated production geometry.
            concentric_reference_rings();
            radial_spokes();
            circular_holder_pattern();
        }
        central_fastener_reference();
        seating_recess_pattern();
        if (show_position_labels) {
            recessed_position_labels();
        }
    }
}

exploratory_adapter();

if (show_ghost_vials) {
    ghost_vial_pattern();
}

if (show_reference_axis) {
    reference_axis();
}
