wall  = 2.5;
tower_width = 22;
margin = 0.5;
tower_width_with_margin = tower_width + margin;
height = 2*tower_width_with_margin;

module tower(h) {
    difference() {
        cube([tower_width, tower_width, h ] );
        translate( [wall, wall, -h] )
            cube([tower_width-(2*wall), tower_width-(2*wall), 3*h]);
    }

}

 rotate([ 180, 0, 0 ]) {   
    difference() {
        tower(h=height);
        translate([wall, -1, -1])
            cube([ tower_width-(2*wall), wall+2, 2*wall+1 ]);
    }
}