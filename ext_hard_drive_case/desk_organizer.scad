cd_length     = 140;
cd_width      = 145;
cd_height     =  13;
cd_cable_pos  =  25;
cd_cable      =  15;

drive_width   =  95;
drive_length  = 135;

sd_length     =   3;
sd_width      =  25;
sd_height     =  33;

battery_hold_w = 36;
battery_hold_l = 100;

wall          =   4;
$fn = 30;

module rounded_cube(width, length, height, corner) {
    hull() {
        translate([ 0*width+1*corner, 0*length+1*corner, 0*height+1*corner])
            sphere( r = corner );

        translate([ 1*width-0*corner, 0*length+1*corner, 0*height+1*corner ])
            sphere( r = corner );

        translate([ 0*width+1*corner, 1*length-0*corner, 0*height+1*corner ])
            sphere( r = corner );

        translate([ 1*width-0*corner, 1*length-0*corner, 0*height+1*corner ])
            sphere( r = corner );

        translate([ 0*width+1*corner, 0*length+1*corner, 1*height-0*corner ])
            sphere( r = corner );

        translate([ 1*width-0*corner, 0*length+1*corner, 1*height-0*corner ])
            sphere( r = corner );

        translate([ 0*width+1*corner, 1*length-0*corner, 1*height-0*corner ])
            sphere( r = corner );

        translate([ 1*width-0*corner, 1*length-0*corner, 1*height-0*corner ])
            sphere( r = corner );
    }
}


module cd() {
    cube([cd_width, cd_length+1, cd_height]);
    
    translate([cd_cable_pos, cd_length, 0])
    cube([cd_cable, 2*wall+2, cd_height]);

}

module sd() {
    cube([sd_width, sd_length, sd_height]);
}

module organizer() {
    difference() {
        //main body
        rounded_cube(cd_width+2*wall, cd_length+wall, cd_height+2*wall, wall);
        
        //slit for CD ROM
        translate([wall, 0, wall])
        cd();
        
        //hole for drive organizer
        translate([cd_width-drive_width+wall, cd_length-drive_length+wall, cd_height+2*wall])
        cube([drive_width, drive_length, 3*wall]);

        //hole for battery organizer
        translate([wall, cd_length-battery_hold_l+wall, cd_height+2*wall])
        cube([battery_hold_w, battery_hold_l, 3*wall]);
                
        //slits for SD cards
        translate([    wall,  1*wall, cd_height+1.5*wall]) sd();
        translate([6.5*wall,  2*wall, cd_height+1.5*wall]) sd();
        translate([    wall,  3*wall, cd_height+1.5*wall]) sd();
        translate([6.5*wall,  4*wall, cd_height+1.5*wall]) sd();
        translate([    wall,  5*wall, cd_height+1.5*wall]) sd();
        translate([6.5*wall,  6*wall, cd_height+1.5*wall]) sd();
        translate([    wall,  7*wall, cd_height+1.5*wall]) sd();
        translate([6.5*wall,  8*wall, cd_height+1.5*wall]) sd();
        translate([    wall,  9*wall, cd_height+1.5*wall]) sd();
        translate([6.5*wall, 10*wall, cd_height+1.5*wall]) sd();
    }
}

organizer();