diam = 23;

module hook() {
    difference() {
        hull() {
            translate( [0*diam, 0, 0] )
                cylinder( d = 1.2*diam, h = diam);
            translate( [2*diam, 0, 0] )
                cylinder( d = 1.2*diam, h = diam);
        }
        
        hull() {
            translate([0*diam, 0, -diam])
                cylinder( d = diam, h = 3*diam );
            translate([2*diam, 0, -diam])
                cylinder( d = diam, h = 3*diam );
        }
        translate([0, 0, -diam])
            cube([ 2*diam, 2*diam, 3*diam ]);
    }   
}

module rounded_edge() {
    difference() {
        cylinder( d = diam, h=0.1*diam );
        translate([0, -diam, -diam])
            cube([ diam, 2*diam, 2*diam]);
    }
}

module hanger() {
    translate([0, 0.5*diam, 0]) rotate([90, 0, 0]) hook();
    translate([0, 0, 0.5*diam]) rotate([0, 0, 180])
        rounded_edge();
    translate([2*diam, 0, 0.5*diam]) rotate([0, 0, 0])
        rounded_edge();
}

hanger();