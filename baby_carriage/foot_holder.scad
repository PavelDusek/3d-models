thickness = 21;
rod_inner = 29;
rod_outer = 47;

rod_x = 21;
rod_y = 101;

module shape2D() {
    polygon(
        points = [
            [0, 10],
            [38, 119],
            [68, 110],
            [111, 3],
            [109, 0],
            [17, 0],
            [1, 7]
        ]
    );
}

module shape3D() {
    difference() {
        linear_extrude( thickness ) shape2D();
        
        translate([ 10, 8, -1])
        linear_extrude( 2*thickness ) scale([0.8, 0.85, 1]) shape2D();
    }
    
    translate([15, 35, 0]) 
    rotate([0, 0, 15])
    cube([ 72, 9, thickness]);
    
    translate([rod_x, rod_y, 0])
    cylinder( h = thickness, d = rod_outer );
}

difference() {
    shape3D();
    
    translate([rod_x, rod_y, -thickness])
    cylinder(h = 4*thickness, d = rod_inner);

    translate([22.3, 74, -thickness])
    rotate([0, 0, 72])
    cube([27, 50, 3*thickness]);
}
