width                 = 89;
height                = 90;
thickness             =  4;
enforcement_thickness =  1.5;
enforcement_width     = 14;
holder_diameter       = 85;
holder_hole           = 25;
hole                  =  4.5;
enforcement_hole      = 11.5;
hole_position         = 12;
holder_position       = 20;
holder_hole_position  = 27;
$fn = 30;

module plate() {    
    cube([width, height, thickness]);

    //enforcement
    translate([0, 0, thickness])
    cube([enforcement_width, enforcement_width, enforcement_thickness]);

    translate([width-enforcement_width, 0, thickness])
    cube([enforcement_width, enforcement_width, enforcement_thickness]);

    translate([0, height-enforcement_width, thickness])
    cube([enforcement_width, enforcement_width, enforcement_thickness]);

    translate([width-enforcement_width, height-enforcement_width, thickness])
    cube([enforcement_width, enforcement_width, enforcement_thickness]);
}

module plate_with_holes() {
    difference() {
        plate();

        //large holes
        translate([0.5*hole_position, 0.5*hole_position, -1])
        cylinder(d = enforcement_hole, h = thickness+1);

        translate([width-0.5*hole_position, height-0.5*hole_position, -1])
        cylinder(d = enforcement_hole, h = thickness+1);

        translate([0.5*hole_position, height-0.5*hole_position, -1])
        cylinder(d = enforcement_hole, h = thickness+1);

        translate([width-0.5*hole_position, 0.5*hole_position, -1])
        cylinder(d = enforcement_hole, h = thickness+1);

        //small holes
        translate([0.5*hole_position, 0.5*hole_position, -1])
        cylinder(d = hole, h = thickness+enforcement_thickness+2);

        translate([width-0.5*hole_position, height-0.5*hole_position, -1])
        cylinder(d = hole, h = thickness+enforcement_thickness+2);

        translate([0.5*hole_position, height-0.5*hole_position, -1])
        cylinder(d = hole, h = thickness+enforcement_thickness+2);

        translate([width-0.5*hole_position, 0.5*hole_position, -1])
        cylinder(d = hole, h = thickness+enforcement_thickness+2);
    }

}

module holder() {
    
    translate([0.5*(holder_diameter+width-holder_diameter), 0, 0])
    difference() {
        hull() {
            cylinder( d = holder_diameter, h = thickness );
            translate([0, 0.15*holder_diameter, 0])
            cylinder( d = holder_diameter, h = thickness );
        }
        
        translate([-0.5*holder_diameter-1, -holder_diameter-1, -1])
        cube([ holder_diameter+2, holder_diameter+2, thickness+2]);

        translate([0, holder_hole_position, -1])
        cylinder( d = holder_hole, h = thickness+2 );
        
    }
}

plate_with_holes();

translate([0, height - holder_position, 0])
rotate([75, 0, 0])
holder();

translate([0, holder_position, 0])
rotate([105, 0, 0])
holder();