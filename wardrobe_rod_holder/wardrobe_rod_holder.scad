rod_height   = 19.5;
rod_width    = 37  ;
rod_inner    = 10  ;
neck_height  = 50  ;
neck_width   = 39  ;
plate_height = 24  ;
plate_thick  =  2.5;
plate_dist   = 63  ;

module rod() {
    hull() {
        translate([-0.5*(rod_width-rod_height), 0, 0]) cylinder( d = rod_height, h = rod_inner );
        translate([+0.5*(rod_width-rod_height), 0, 0]) cylinder( d = rod_height, h = rod_inner);
    }
}

module holder() {
    hull() {
        translate([-0.5*rod_height, 0, 0]) cylinder( d = 1.1*rod_height, h = rod_inner );
        translate([+0.5*rod_height, 0, 0]) cylinder( d = 1.1*rod_height, h = rod_inner ); 
    }
    translate([-0.5 * neck_width, -neck_height, 0]) cube([neck_width, neck_height, plate_thick]);
    
    translate([0, -neck_height, 0]) hull() {
        translate([-0.5 * plate_dist, 0, 0]) cylinder( d = plate_height, h = plate_thick);
        translate([+0.5 * plate_dist, 0, 0]) cylinder( d = plate_height, h = plate_thick);
    }
}

module holder2() {
    hull() {
        translate([-0.5*rod_height, 0, plate_thick]) cylinder( d = 1.1*rod_height, h = rod_inner );
        translate([+0.5*rod_height, 0, plate_thick]) cylinder( d = 1.1*rod_height, h = rod_inner );
    }

    hull() {
        translate([-0.5* rod_height,  +0*neck_height, 0]) cylinder( d = 1.1*rod_height, h = plate_thick );
        translate([+0.5* rod_height,  +0*neck_height, 0]) cylinder( d = 1.1*rod_height, h = plate_thick ); 
        translate([-0.5 * plate_dist, -1*neck_height, 0]) cylinder( d = plate_height, h = plate_thick);
        translate([+0.5 * plate_dist, -1*neck_height, 0]) cylinder( d = plate_height, h = plate_thick);
    }
}

difference() {
    holder2();
    translate([0, 0, plate_thick+1]) rod();
    
    translate([-0.5 * plate_dist, -neck_height, -1]) cylinder( d=4, h = plate_thick+2);
    translate([+0.5 * plate_dist, -neck_height, -1])  cylinder( d=4, h = plate_thick+2);
}