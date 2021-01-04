wall  = 2.5;
tower_width = 22;
margin = 0.5;
tower_width_with_margin = tower_width + margin;
height = 20;

extra_length = 5;

cam_platform = 25;
no_of_star_tips = 8;

hole_diameter = 2;
hole_x  =  2;
hole_y  =  2;
hole_y2 = 15;

module star() {
    for (n = [0:1:no_of_star_tips]) {
        rotate( [0, 0, n*(360/no_of_star_tips)] )
            translate([ -0.5*tower_width_with_margin, -0.5*tower_width_with_margin, 0 ] )
                cube( [ tower_width_with_margin, tower_width_with_margin, tower_width_with_margin ] );
    }
}

module cam_holder() {
    difference() {
        cube([cam_platform, wall, cam_platform+extra_length]);

        translate([hole_x, wall+1, hole_y]) rotate([90, 0, 0])
            cylinder( d = hole_diameter, h = wall+2 );

        translate([cam_platform-hole_x, wall+1, hole_y]) rotate([90, 0, 0])
            cylinder( d = hole_diameter, h = wall+2 );

        translate([hole_x, wall+1, hole_y2]) rotate([90, 0, 0])
            cylinder( d = hole_diameter, h = wall+2 );

        translate([cam_platform-hole_x, wall+1, hole_y2]) rotate([90, 0, 0])
            cylinder( d = hole_diameter, h = wall+2 );
    }
}

module cap2() {
    difference() {
        cylinder( d = 1.7*tower_width_with_margin, h = tower_width_with_margin);
        //star that enables different angles of rotation of the cam around the z-axis
        translate([0, 0, -0.2*tower_width_with_margin]) star();

        translate([ 0, -wall, -1])
            cube([2*cam_platform, wall, tower_width_with_margin+2]);
    }

    translate([cam_platform+extra_length+0.45*1.7*tower_width_with_margin, 0, 0]) rotate([0, -90, 0]) cam_holder();

}

cap2();