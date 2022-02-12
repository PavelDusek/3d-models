inner_diameter =  7;
outer_diameter = 13;
gap            = 16.6; //degrees
thickness      =  2;
thickness2     =  3;
length         = 21;
width          = 10;
$fn            = 30;


module wedge(diameter, height, degrees) {
    difference() {
        cylinder( d = diameter, h = height );
        translate([-0.5*diameter, -diameter, -height])
            cube([ diameter, diameter, 3*height ]);
        rotate([0, 0, degrees-90])
            translate([-4*diameter, -2*diameter, -height])
            cube([ 4*diameter, 4*diameter, 3*height ]);
    }
}

module ellipse( diameter, length, thickness ) {
    hull() {
        translate([ 0, 0, 0])
        cylinder(d = diameter, h = thickness);
    translate([ 0, length, 0])
        cylinder(d = diameter, h = thickness);
    }    
}

module hook1() {
    rotate([0, 0, -2*gap])
    difference() {
        cylinder( d = outer_diameter, h = thickness2 );
        translate([0, 0, -thickness2])
            cylinder( d = inner_diameter, h = 3*thickness2 );
        translate([0, 0, -1])
            wedge(2*outer_diameter, thickness2+2, gap);
    }
}

module hook2() {
    translate([0, -length, 0])
    difference() {
        ellipse( outer_diameter, length-inner_diameter, thickness );
        translate([0, 0, -1])
        ellipse( inner_diameter, length-inner_diameter, thickness+2 );
        translate([0, length-outer_diameter, -1])
            rotate([0, 0, 120])
                wedge( 2*outer_diameter, thickness+2, gap);
    }
}

hook1();
translate([0, -0.45*inner_diameter, 0]) hook2();