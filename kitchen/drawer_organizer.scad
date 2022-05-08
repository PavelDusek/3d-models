wall            =  2;
screw_diam      =  6.5;
nut_height      =  5;
nut_diam        = 13;
nut_radius      =  0.5 * nut_diam;
rod_wide_diam   = 13;
rod_narrow_diam = 11;
$fn             = 30;

module hexagon(radius) {
    polygon(
        points = [
            [radius * sin(0*60), radius * cos(0*60)],
            [radius * sin(1*60), radius * cos(1*60)],
            [radius * sin(2*60), radius * cos(2*60)],
            [radius * sin(3*60), radius * cos(3*60)],
            [radius * sin(4*60), radius * cos(4*60)],
            [radius * sin(5*60), radius * cos(5*60)]
        ]
    );
}

module nut(radius, height) {
    linear_extrude(height) {
        hexagon(radius);
    };
}

module wedge( diameter ) {
    rotate([ 0, 0, -150])
    difference() {
        translate([0, 0, -1])
        cylinder( d = 1.5 * diameter+2, h = 1.5*diameter+2);
    
        rotate([0, 0, 90])
        translate([-diameter-1, 0, -2])
        cube([2*diameter+2, diameter+2, 1.5*diameter+4]);
    
        rotate([0, 0, 0])
        translate([-diameter-1, -diameter-1, -2])
        cube([2*diameter+2, diameter+2, 1.5*diameter+4]);
    }
}

module tube( diameter ) {
    difference() {
        cylinder(d = 1.5*diameter, h = 1.5*diameter);
        translate([0, 0, -1])
        cylinder( d = diameter, h = 1.5*diameter + 2);
    }
}

module rod_attachment( diameter ) {
    difference() {
        tube( diameter );
        wedge( diameter );
    }
    
    translate([0.5*diameter, 0, 0.75*diameter]) 
    rotate([0, 90, 0])
    color([1, 0, 1])
    tube( screw_diam );
    
    color([0, 1, 1])
    translate([0.5*diameter, 0, 0.75*diameter])
    rotate([0, 90, 0])
    nut( nut_radius+wall, nut_height+wall );
}


module rod() {
    rotate([0, 90, 0])
    cylinder(d = screw_diam, h = 10*screw_diam);
}

module narrow_rod_attachment() {
   difference() {
        rod_attachment( diameter = rod_narrow_diam );
        translate([ 0, 0, 0.75*rod_narrow_diam ])
        rod();
       
        color([1, 1, 1])
        translate([0, 0, 0.75*rod_narrow_diam ])
        rotate([0, 90, 0])
        nut(nut_radius, 2*nut_height);
    }
}

module wide_rod_attachment() {
    difference() {
        rod_attachment( diameter = rod_wide_diam );
        translate([ 0, 0, 0.75*rod_wide_diam ])
        rod();

        color([1, 1, 1])
        translate([0, 0, 0.75*rod_wide_diam ])
        rotate([0, 90, 0])
        nut(nut_radius, 2*nut_height);
    }
}

narrow_rod_attachment();

translate([0, 3*rod_wide_diam, 0]) wide_rod_attachment();