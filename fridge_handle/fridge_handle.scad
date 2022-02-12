height1    =  27.0;
height2    =  36.0;
thickness1 =   2.5;
thickness2 =   3.0;
depth      =  21.0;
width      =  15.0;
length     = 150.0;
corner     =  15.0;
gap        =   0.5;

module round_edge(length, thickness, height, corner) {
    minkowski() {
        sphere( d = corner );
        cube([length, thickness, height]);
    }
}

module round_edge_long( length, thickness) {
    translate([length, 0.5*thickness, 0])
    rotate([0, -90, 0])
    difference() {
        cylinder(d = thickness, h = length);
        translate([0, -2*thickness, -2*length])
            cube([3*thickness, 4*thickness, 4*length]);
    }
}

module handle(length, thickness, height, corner) {
    intersection() {
        translate([0.5*corner, 0, -0.5*corner]) round_edge(length,  thickness, height, corner);
        cube([length, thickness, height]);
    }
}

translate([0, thickness1, (height2-height1)])
    color([0, 0, 1])
        handle(length, (thickness2-thickness1), height1, corner);
translate([0, 0, 0])
    color([1, 1, 1])
        handle(length, thickness1, height2, corner);

translate([0, thickness1+thickness2+gap, 0])
    handle(length, thickness2, depth, corner);

round_edge_long( length, thickness1+2*thickness2+gap );

translate([corner, thickness1+2*thickness2+gap, depth-thickness2])
    cube([length-corner, width, thickness2]);