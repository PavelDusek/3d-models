lenght =  73;
width =   43;
wall =    1.5;
depth  =  25;
overlap = 16;

module base() {
    minkowski() {
        cube( [lenght, width, wall]);
        cylinder( r = overlap/2, h = wall );
    }
}

module longwall() {
    cube( [ lenght-overlap, wall, depth ] );
}

module shortwall() {
    cube( [ wall, width-overlap, depth ] );
}

module hold() {
    difference() {
        cylinder( r = 8*wall, h = 2*wall );
        translate([ 0, 0, -wall ]) cylinder( r = 4*wall, h = 6*wall );
    }
}


/*****************/
base();

translate( [ overlap/2, wall, wall ]) longwall();
translate( [ overlap/2, width-wall, wall]) longwall();

translate( [ wall, overlap/2, wall ]) shortwall();
translate( [ lenght-wall, overlap/2, wall ]) shortwall();

translate( [ lenght/2, -overlap/2, 0]) hold();
translate( [ lenght/2, width+overlap/2, 0]) hold();