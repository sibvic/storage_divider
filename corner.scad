height               = 50;   // Height, mm
wall_thickness_inner = 2;    // Wall thickness (inner), mm
wall_thickness_outer = 2;    // Wall thickness (outer), mm
slot_size            = 10;   // Slot size, mm
floor_thickness      = 2;    // Floor thickness, mm
screw_hole_size      = 3.3;  // Screw hole size, mm

total_thickness = wall_thickness_inner + wall_thickness_outer * 2;
difference()
{
    union()
    {
        cube([total_thickness + slot_size, total_thickness, height]);
        cube([total_thickness, total_thickness + slot_size, height]);
    }
    translate([(total_thickness - wall_thickness_inner) / 2, total_thickness, floor_thickness]) {
        cube([wall_thickness_inner, slot_size, height]);    
    }
    translate([total_thickness, (total_thickness - wall_thickness_inner) / 2, floor_thickness]) {
        cube([slot_size, wall_thickness_inner, height]);    
    }
    translate([total_thickness + slot_size / 2, 0, height - screw_hole_size * 2]) {
        rotate([-90, 0, 0]) {
            cylinder(r = screw_hole_size, h = total_thickness, center = false);
        }
    }
    translate([0, total_thickness + slot_size / 2, height - screw_hole_size * 2]) {
        rotate([0, 90, 0]) {
            cylinder(r = screw_hole_size, h = total_thickness, center = false);
        }
    }
}
