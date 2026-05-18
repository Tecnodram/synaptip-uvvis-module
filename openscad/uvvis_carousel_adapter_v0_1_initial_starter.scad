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
outer_diameter_mm = 120;
inner_clearance_diameter_mm = 40;
base_thickness_mm = 4;
holder_count = 8;
holder_pitch_diameter_mm = 88;
holder_outer_diameter_mm = 18;
holder_wall_thickness_mm = 2;
holder_height_mm = 22;
optical_window_width_mm = 8;
optical_window_height_mm = 12;

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

module vial_holder() {
    difference() {
        cylinder(h = holder_height_mm, d = holder_outer_diameter_mm);
        translate([0, 0, -0.1])
            cylinder(
                h = holder_height_mm + 0.2,
                d = holder_outer_diameter_mm - 2 * holder_wall_thickness_mm
            );
        translate([
            -optical_window_width_mm / 2,
            -holder_outer_diameter_mm,
            (holder_height_mm - optical_window_height_mm) / 2
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
            translate([holder_pitch_diameter_mm / 2, 0, base_thickness_mm])
                vial_holder();
    }
}

module exploratory_adapter() {
    base_ring();
    circular_holder_pattern();
}

exploratory_adapter();

if (show_reference_axis) {
    reference_axis();
}

