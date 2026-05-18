/*
SynAptIp Scientific Interoperability Platform — UV-VIS Module
Mechanism test prototype v0.1

Purpose:
- quick-print intermediate part
- verify central screw engagement and basic six-position layout
- intentionally simplified before refined reverse-engineering work

Status:
- exploratory
- unvalidated for final fit or optical use
*/

$fn = 96;

disc_diameter_mm = 108;
disc_thickness_mm = 4;
center_fastener_hole_diameter_mm = 3.0;
center_fastener_preview_diameter_mm = 3.0;

holder_count = 6;
vial_outer_diameter_mm = 16;
vial_clearance_preview_diameter_mm = vial_outer_diameter_mm;
provisional_outer_margin_mm = 2;
holder_pitch_radius_mm = disc_diameter_mm / 2 - vial_outer_diameter_mm / 2 - provisional_outer_margin_mm;

show_ghost_vials = true;

module base_disc() {
    difference() {
        cylinder(h = disc_thickness_mm, d = disc_diameter_mm);
        translate([0, 0, -0.1])
            cylinder(h = disc_thickness_mm + 0.2, d = center_fastener_hole_diameter_mm);
    }
}

module ghost_vial() {
    color([0.1, 0.5, 1.0, 0.28])
        cylinder(h = 50, d = vial_clearance_preview_diameter_mm);
}

module ghost_vial_pattern() {
    for (i = [0 : holder_count - 1]) {
        rotate([0, 0, i * 360 / holder_count])
            translate([holder_pitch_radius_mm, 0, disc_thickness_mm])
                ghost_vial();
    }
}

base_disc();

if (show_ghost_vials) {
    ghost_vial_pattern();
}
