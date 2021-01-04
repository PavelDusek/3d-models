wall  = 2.5;
tower_width = 22;
margin = 0.5;
tower_width_with_margin = tower_width + margin;
height = 10;
tower_diagonal = sqrt(2)*tower_width;

cam_platform = 25;
no_of_star_tips = 12;

module tower(h) {
    difference() {
        cube([tower_width, tower_width, h ] );
        translate( [wall, wall, -h] )
            cube([tower_width-(2*wall), tower_width-(2*wall), 3*h]);
    }

}

module star() {
    for (n = [0:1:no_of_star_tips]) {
        rotate( [0, 0, n*(360/no_of_star_tips)] )
            translate([ -0.5*tower_width_with_margin, -0.5*tower_width_with_margin, 0 ] )
                cube( [ tower_width_with_margin, tower_width_with_margin, tower_width_with_margin ] );
    }
}

module cap1() {
    difference() {
        cylinder( d = 1.7*tower_width_with_margin, h = tower_width_with_margin);
        //star that enables different angles of rotation of the cam around the z-axis
        translate([0, 0, -0.2*tower_width_with_margin]) star();
        translate([(-1/2)*tower_width+wall, (-1/2)*tower_width+wall, 0.2*tower_width_with_margin])
            cube([tower_width-(2*wall), tower_width-(2*wall), tower_width]);

    }      
    translate( [ -0.5*tower_width_with_margin, -0.5*tower_width_with_margin, tower_width_with_margin ] ) tower(h = (1/2)*tower_width_with_margin );
}

cap1();