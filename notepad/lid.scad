$fn       = 100;
width     =  44.5;
height    =  76.5;
wall      =   1;
thickness =   6;
corner    =   3;

module roundcube( width, height, thickness, corner ) {
    minkowski() {
        cube( [ width-corner, height-corner, thickness-corner ]);
        sphere( d = corner );
    }
}

module lid() {
    difference() {
        roundcube(
            width = width,
            height = height,
            thickness = thickness,
            corner = corner
        );
        translate( [ wall, wall, wall ] )
        roundcube(
            width = width-2*wall,
            height = height-2*wall,
            thickness = thickness,
            corner = corner
        );
        translate( [ 0.125*width, 0.125*height, -1 ] )
        roundcube(
            width = 0.75*width,
            height = 0.75*height,
            thickness = thickness+2,
            corner = corner
        );

    }
}

lid();