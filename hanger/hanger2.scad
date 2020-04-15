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

module cylinder_hull(diameter, height, coord1, coord2) {
    hull() {
        translate( coord1 ) cylinder( d = diameter, h = height );
        translate( coord2 ) cylinder( d = diameter, h = height );
    }
}

difference() {
    minkowski_cube();
    translate( [ hole_diameter, hole_diameter, -thickness] )
        cylinder_hull(
            diameter = hole_diameter,
            height = 4*thickness,
            coord1 = [0, 0, 0],
            coord2 = [ hole_diameter+wall_width, hole_diameter+wall_width, 0 ]
        );
    translate( [ hole_diameter, 3*hole_diameter, -thickness] )
        rotate( [0, 0, 180] )
            cylinder_hull(
                diameter = hole_diameter,
                height = 4*thickness,
                coord1 = [0, 0, 0],
                coord2 = [ hole_diameter+wall_width, hole_diameter+wall_width, 0 ]
            );
    translate( [hole_diameter, hole_diameter, -thickness] )
        cylinder_hull(
            diameter = hole_diameter,
            height = 4 * thickness,
            coord1 = [0, 0, 0],
            coord2 = [(2/3)*wall_width, 0, 0]
        );
}
