wall  = 2.5;
tower_width = 16;
height = 160;

cam_platform = 25;

no_of_star_tips = 12;

module tower(h) {
    difference() {
        cube([tower_width, tower_width, h ] );
        translate( [wall, wall, -h] )
            cube([tower_width-(2*wall), tower_width-(2*wall), 3*h]);
    }

}

module right_left_gap() {
    cube([ tower_width - (2*wall), tower_width - (2*wall), wall]);
}

module star() {
    for (n = [0:1:no_of_star_tips]) {
        rotate( [0, 0, n*(360/no_of_star_tips)] )
            translate([ -0.5*tower_width, -0.5*tower_width, 0 ] )
                cube( [ tower_width, tower_width, tower_width ] );
    }
}

module tower_cap1() {
    difference() {
        cylinder( d = 1.7*tower_width, h = tower_width);
        //star that enables different angles of rotation of the cam around the z-axis
        translate([0, 0, -0.2*tower_width]) star();
        translate([0, 0,  0.2*tower_width]) cylinder( d = tower_width, h = tower_width );
    }
    translate( [ -0.5*tower_width, -0.5*tower_width, tower_width ] ) tower(h = tower_width );
}

module tower_cap2() {
    difference() {
        cylinder( d = 1.7*tower_width, h = tower_width);
        //star that enables different angles of rotation of the cam around the z-axis
        translate([0, 0, -0.2*tower_width]) star();
        translate([ 0.5*(1/2)*1.7*tower_width, -wall, -0.1*tower_width])
            cube([cam_platform, wall, cam_platform]);
    }
    translate([ 0.9*(1/2)*1.7*tower_width, 0, 0])
        cube([cam_platform, wall, cam_platform]);
}

translate([-1*tower_width, -3*tower_width, 0]) tower_cap2();
translate([-1*tower_width, -1*tower_width, 0]) tower_cap1();
translate([1*tower_width, 0, 0 ] ) rotate([0, 0, 0]) tower(h=height);