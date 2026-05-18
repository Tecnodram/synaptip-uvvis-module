/*
SynAptIp Scientific Interoperability Platform — UV-VIS Module
Exploratory parametric starter file

Status:
- Phase 0 / Phase 1 only
- Not validated for fit, safety, or compatibility
- Placeholder dimensions only; replace after documented measurement review
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
provisional_vial_clearance_mm = 0;
holder_inner_diameter_mm = vial_outer_diameter_mm + provisional_vial_clearance_mm;
holder_wall_thickness_mm = 2;
holder_outer_diameter_mm = holder_inner_diameter_mm + 2 * holder_wall_thickness_mm;
vial_height_mm = 50;
holder_height_mm = vial_height_mm;
optical_window_width_mm = 7;
optical_window_height_mm = 13;
optical_window_base_offset_mm = 13;

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
label_depth_mm = 0.8;
label_size_mm = 5;
position_labels = ["4", "5", "B", "1", "2", "3"];

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

module ghost_vial() {
    color([0.1, 0.5, 1.0, 0.28])
        cylinder(h = vial_height_mm, d = vial_outer_diameter_mm);
}

module ghost_vial_pattern() {
    for (i = [0 : holder_count - 1]) {
        rotate([0, 0, i * 360 / holder_count])
            translate([holder_pitch_radius_mm, 0, base_thickness_mm])
                ghost_vial();
    }
}

module recessed_position_labels() {
    for (i = [0 : holder_count - 1]) {
        rotate([0, 0, i * 360 / holder_count])
            translate([holder_pitch_radius_mm - 10, 0, base_thickness_mm - label_depth_mm])
                linear_extrude(height = label_depth_mm + 0.1)
                    text(
                        position_labels[i],
                        size = label_size_mm,
                        halign = "center",
                        valign = "center"
                    );
    }
}

module vial_holder() {
    difference() {
        cylinder(h = holder_height_mm, d = holder_outer_diameter_mm);
        translate([0, 0, -0.1])
            cylinder(
                h = holder_height_mm + 0.2,
                d = holder_inner_diameter_mm
            );
        translate([
            -optical_window_width_mm / 2,
            -holder_outer_diameter_mm,
            optical_window_base_offset_mm
        ])
            cube([
                optical_window_width_mm,
                holder_outer_diameter_mm * 2,
                optical_window_height_mm
            ]);
    }
}

module circular_holder_pattern() {
    for (i = [0 : holder_count - 1]) {
        rotate([0, 0, i * 360 / holder_count])
            translate([holder_pitch_radius_mm, 0, base_thickness_mm])
                vial_holder();
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
