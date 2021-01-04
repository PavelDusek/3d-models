wall  = 2.5;
tower_width = 22;
margin = 0.5;
tower_width_with_margin = tower_width + margin;

module t(a) {
    diagonal = sqrt(2)*a;
    translate( [ 0, -diagonal/2, 0 ] ) {

        translate([ 0, 0, (-1/2)*a])
        rotate([0, 0, 45]) cube([a, a, 1.5 * a]);
        
        translate([(-1/2)*diagonal, diagonal/2-2*a, a])
            rotate([0, 45, 0]) cube([a, 2*a, a]);
        
        translate([(-1/2)*diagonal, diagonal/2, a])
            rotate([0, 45, 0]) cube([a, 2*a, a]);
    }
}

module ttube() {
    difference() {
        t( a = tower_width );
    
        translate([ 0, (-1/2)*sqrt(2)*(tower_width-2*wall), (-1/2)*tower_width-wall ]) rotate( [0, 0, 45] ) cube( [tower_width-2*wall, tower_width-2*wall, 1.5*tower_width+wall ]);
    
        translate([(-1/2)*sqrt(2)*(tower_width-2*wall), -5*(tower_width-2*wall), tower_width])
            rotate( [0, 45, 0] )
                cube( [tower_width-2*wall, 10*(tower_width-2*wall), tower_width-2*wall]);
    }
}

rotate( [0, 90+45, 0] ) ttube();