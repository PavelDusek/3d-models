rod = 25.1;

//screw
screw1 = 8; //width of the screw head
screw2 = 4; //width of the screw body
screwhead = 5; //height of the screw head
screwlength = 10; //length of the screw body

module screw() {
    color( [0, 0, 1] ) {
        cylinder( d1 = screw1, d2 = screw2, h = screwhead);
        translate([0, 0, screwhead]) cylinder( d=screw2, h = screwlength);
    }
}

module platform() {
    difference() {
        cube( [1.2*rod, 0.1*rod, 1.2*rod] );
    
        translate([ 0.3*rod, screwhead, 0.3*rod])
            rotate([ 90, 0, 0] )
                screw();
        
        translate([ 0.9*rod, screwhead, 0.9*rod])
            rotate([ 90, 0, 0] )
                screw();
    }

}

module center_mount() {
    difference() {
        cube ( [1.2*rod, 1.2*rod, 1.2*rod] );
        translate([0.1*rod, 0.1*rod, -1])
            cube ( [ rod, rod, 2*rod] );
    }
}


center_mount();

translate([-1.2*rod, 0, 0])
    platform();
translate([1.2*rod, 1.2*rod, 0])
    rotate([0, 0, 90]) platform();
