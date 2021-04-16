$fn       = 100;
width     =  43;
height    =  74;
wall      =   1;
thickness =  18;
corner    =   3;

module roundcube( width, height, thickness, corner ) {
    minkowski() {
        cube( [ width-corner, height-corner, thickness-corner ]);
        sphere( d = corner );
    }
}

module notepad() {
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
    }
}

notepad();