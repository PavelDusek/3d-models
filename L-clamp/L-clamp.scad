//screw
screw1      =  8; //width of the screw head
screw2      =  4; //width of the screw body
screwhead   =  5; //height of the screw head
screwlength = 10; //length of the screw body

length      = 60;
thickness   =  7;
height      = 60;
$fn = 30;

module screw() {
    color( [0, 0, 1] ) {
        cylinder( d1 = screw1, d2 = screw2, h = screwhead);
        translate([0, 0, screwhead]) cylinder( d=screw2, h = screwlength);
    }
}

difference() {
    union() {
        cube([ length, thickness, height ]);
        cube([ thickness, length, height ]);
    }
    
    translate([ 0.3*length, thickness+0.1, 0.3*height ]) rotate( [+90, 0, 0 ] ) screw();
    
    translate([ 0.7*length, thickness+0.1, 0.7*height ]) rotate( [+90, 0, 0 ] ) screw();

    translate([ thickness+0.1, 0.3*length, 0.7*height ]) rotate( [0, -90, 0 ] ) screw();
    
    translate([ thickness+0.1, 0.7*length, 0.3*height ]) rotate( [0, -90, 0 ] ) screw();
    
}
