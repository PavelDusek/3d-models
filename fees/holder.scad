width                 = 89;
height                = 90;
thickness             =  4;
enforcement_thickness =  1.5;
enforcement_width     = 25;
holder_diameter       = 85;
holder_width          = 76;
holder_hook_width     = 22;
holder_hook_height    = 20;
holder_height         = 67;
holder_thickness      = 40;

holder_hole           = 25;
hole                  =  5;
enforcement_hole      = 11.5;
hole_position         = 13;
holder_position       = 25;
holder_hole_position  = 27;
screw_diam            =  8;
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

module skew_plate_left() {
    difference() {  
        cube([thickness+enforcement_thickness, holder_height, holder_thickness]);
    
        translate([-thickness-enforcement_thickness, -1, 0])
        rotate([0, 5.5, 0])
        cube([thickness+enforcement_thickness, holder_height+3, 1.5*holder_thickness]);
    }
}

module skew_plate_right() {
    difference() {  
        cube([thickness+enforcement_thickness, holder_height, holder_thickness]);
    
        translate([thickness+enforcement_thickness, -1, 0])
        rotate([0, -5.5, 0])
        cube([thickness+enforcement_thickness, holder_height+3, 1.5*holder_thickness]);
    }
}

module holder() {
    translate([0.5*(width-holder_width-thickness-enforcement_thickness), 0.5*enforcement_width, thickness])
    cube([thickness+enforcement_thickness, holder_height, holder_thickness]);

    translate([0, 0.5*enforcement_width, thickness])
    skew_plate_left();


    translate([0.5*(width+holder_width-thickness-enforcement_thickness), 0.5*enforcement_width, thickness])
    cube([thickness+enforcement_thickness, holder_height, holder_thickness]);

    translate([width-thickness-enforcement_thickness, 0.5*enforcement_width, thickness])
    skew_plate_right();


    translate([0.5*(width-holder_width+2*thickness+2*enforcement_thickness)-thickness, 0.5*enforcement_width+holder_height, 0])
    rotate([45, 0, 0])
    cube([ holder_hook_width, thickness+enforcement_thickness, holder_hook_height]);
    
    translate([width-0.5*(width-holder_width)-thickness-enforcement_thickness-holder_hook_width+thickness, 0.5*enforcement_width+holder_height, 0])
    rotate([45, 0, 0])
    cube([ holder_hook_width, thickness+enforcement_thickness, holder_hook_height]);
    
    translate([0.5*(width-holder_width-thickness-enforcement_thickness), 0.5*enforcement_width+holder_height-thickness-enforcement_thickness, 0.9*holder_thickness])
    cube([ holder_width, thickness+enforcement_thickness, 0.2*holder_thickness]);
}

module plate_with_holes() {
    difference() {
        union() {
            plate();
            color([1, 0, 1]) holder();
        }

        //large holes
        hull() {
            translate([0.5*hole_position, 0.5*hole_position, -1])
            cylinder(d = enforcement_hole, h = thickness+1);
            translate([1.0*hole_position, 1.0*hole_position, -1])
            cylinder(d = 1.5*enforcement_hole, h = thickness+1);
        }

        hull() {
            translate([width-0.5*hole_position, height-0.5*hole_position, -1])
            cylinder(d = enforcement_hole, h = thickness+1);
            translate([width-1.0*hole_position, height-1.0*hole_position, -1])
            cylinder(d = 1.5*enforcement_hole, h = thickness+1);
        }

        hull() {
            translate([0.5*hole_position, height-0.5*hole_position, -1])
            cylinder(d = enforcement_hole, h = thickness+1);
            translate([1.0*hole_position, height-1.0*hole_position, -1])
            cylinder(d = 1.5*enforcement_hole, h = thickness+1);
        }

        hull() {
            translate([width-0.5*hole_position, 0.5*hole_position, -1])
            cylinder(d = enforcement_hole, h = thickness+1);
            translate([width-1.0*hole_position, 1.0*hole_position, -1])
            cylinder(d = 1.5*enforcement_hole, h = thickness+1);
        }

        //small holes
        translate([0.5*hole_position, 0.507*hole_position, -1])
        cylinder(d = hole, h = thickness+enforcement_thickness+2);

        translate([width-0.5*hole_position, height-0.5*hole_position, -1])
        cylinder(d = hole, h = thickness+enforcement_thickness+2);
        translate([width-0.5*hole_position, height-0.5*hole_position, thickness+enforcement_thickness])
        cylinder(d = screw_diam, h = thickness+enforcement_thickness+2);


        translate([0.5*hole_position, height-0.5*hole_position, -1])
        cylinder(d = hole, h = thickness+enforcement_thickness+2);
        translate([0.5*hole_position, height-0.5*hole_position, thickness+enforcement_thickness])
        cylinder(d = screw_diam, h = thickness+enforcement_thickness+2);

        translate([width-0.5*hole_position, 0.507*hole_position, -1])
        cylinder(d = hole, h = thickness+enforcement_thickness+2);
        
        //transverse holes in the holder
        translate([0, enforcement_width, holder_thickness-hole])
        rotate([0, 90, 0])
        cylinder(d = hole, h = 2*holder_width);

        translate([0, 2*enforcement_width, holder_thickness-hole])
        rotate([0, 90, 0])
        cylinder(d = hole, h = 2*holder_width);

        translate([0, 0.4*holder_width, 0.6*holder_thickness])
        rotate([0, 90, 0])
        hull() {
            cylinder(d = 3*hole, h = 2*holder_width);
            translate([0, 0.1*holder_width, 0])
            cylinder(d = 3*hole, h = 2*holder_width);
        }
    }
}

plate_with_holes();