//dimensions
diameter1  = 100;
diameter2  =  20;
wall       =   3;
height     =  30;

module outer_circle() {
    difference() {
        union() {
            cylinder( d = diameter1+wall, h = height );
            cylinder( d = diameter1+2*wall, h = wall );
        }
        translate( [0, 0, -1] )
            cylinder( d = diameter1, h = height+2 );
    }
}

module inner_circle() {
    difference() {
        cylinder( d = diameter2+wall, h = height );
        translate( [0, 0, wall] )
            cylinder( d = diameter2, h = height+2 );
    }
}

module anchor() {
    translate( [ (-1/2)*diameter1, (-1/2)*wall, 0 ] )
        cube( [ diameter1, wall, wall ] );
    translate( [ (-1/2)*wall, (-1/2)*diameter1, 0 ] )
        cube( [ wall, diameter1, wall ] );
}

outer_circle();
inner_circle();
anchor();