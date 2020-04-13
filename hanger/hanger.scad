hole_diameter  = 36;
wall_width     = 20;
thickness      =  5;
rounded_corner =  5;

module minkowski_cube() {
    translate( [ rounded_corner, rounded_corner, 0 ] )
    minkowski() {
        cube( [ hole_diameter + 2*wall_width - 2*rounded_corner, 4*hole_diameter - 2*rounded_corner, thickness ] );
        cylinder( r=rounded_corner, h=thickness );
    }
}

module cylinder_hull() {
    hull() {
        cylinder( d=hole_diameter, h=4*thickness );
        translate( [ hole_diameter+wall_width, hole_diameter+wall_width, 0 ] )
            cylinder( d=hole_diameter, h=4*thickness );
    }
}

difference() {
    minkowski_cube();
    translate( [ hole_diameter, hole_diameter, -thickness] ) cylinder_hull();
    translate( [ hole_diameter, 3*hole_diameter, -thickness] ) rotate( [0, 0, 180] ) cylinder_hull();
}
