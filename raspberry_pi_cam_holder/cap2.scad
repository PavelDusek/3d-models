wall  = 2.5;
tower_width = 22;
margin = 0.5;
tower_width_with_margin = tower_width + margin;
height = 20;

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
    cube([ tower_width_with_margin - (2*wall), tower_width_with_margin - (2*wall), wall]);
}

module star() {
    for (n = [0:1:no_of_star_tips]) {
        rotate( [0, 0, n*(360/no_of_star_tips)] )
            translate([ -0.5*tower_width_with_margin, -0.5*tower_width_with_margin, 0 ] )
                cube( [ tower_width_with_margin, tower_width_with_margin, tower_width_with_margin ] );
    }
}

module tower_cap1() {
    difference() {
        cylinder( d = 1.7*tower_width_with_margin, h = tower_width_with_margin);
        //star that enables different angles of rotation of the cam around the z-axis
        translate([0, 0, -0.2*tower_width_with_margin]) star();
        translate([0, 0,  0.2*tower_width_with_margin]) cylinder( d = tower_width_with_margin, h = tower_width_with_margin );
    }
    translate( [ -0.5*tower_width_with_margin, -0.5*tower_width_with_margin, tower_width_with_margin ] ) tower(h = tower_width_with_margin );
}

module tower_cap2() {
    difference() {
        cylinder( d = 1.7*tower_width_with_margin, h = tower_width_with_margin);
        //star that enables different angles of rotation of the cam around the z-axis
        translate([0, 0, -0.2*tower_width_with_margin]) star();
        translate([ 0.5*(1/2)*1.7*tower_width_with_margin, -wall, -0.1*tower_width_with_margin])
            cube([cam_platform, wall, cam_platform]);
    }
    translate([ 0.9*(1/2)*1.7*tower_width_with_margin, 0, 0])
        cube([cam_platform, wall, cam_platform]);
}

translate([-1*tower_width_with_margin, -3*tower_width_with_margin, 0]) tower_cap2();
//translate([-1*tower_width_with_margin, -1*tower_width_with_margin, 0]) tower_cap1();
//translate([1*tower_width_with_margin, 0, 0 ] ) rotate([0, 0, 0]) tower(h=height);