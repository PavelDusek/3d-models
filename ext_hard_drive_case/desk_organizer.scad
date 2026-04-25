cd_length     = 140;
cd_width      = 145;
cd_height     =  13;

slit          =  26;
slit_position =  25;

//SD cards
sd_length     =   3;
sd_width      =  25;
sd_height     =  33;

battery_hold_w = 36;
battery_hold_l = 100;

drive_width   =  85;
drive_length  = 125;
drive_height  =  20;
wall          =   4;

no_of_drives  =   6;

large_drive_length = 120;
large_drive_width  =  55;
large_drive_height = 180;

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

module drive() {
    cube([drive_width, drive_length+1, drive_height]);
    
    translate([0.5*(drive_width-slit), drive_length, 0])
    cube([slit, 2*wall+2, drive_height]);

}

module cd() {
    cube([cd_width, cd_length+1, cd_height]);
    
    translate([slit_position, cd_length, 0])
    cube([slit, 2*wall+2, cd_height]);

}

module cd_case() {
    difference() {
        //main body
        rounded_cube(cd_width+2*wall, cd_length+wall, cd_height+2*wall, wall);
        
        //slit for CD ROM
        translate([wall, 0, wall])
        cd();
    }    
}

module sd() {
    cube([sd_length, sd_width, sd_height]);
}


module drive_case() {
    difference() {
        rounded_cube(drive_width+2*wall, drive_length+wall, no_of_drives*(drive_height+wall), wall);

        for (drive_no = [0: no_of_drives - 1]) {
            translate([
                wall,
                -1,
                (drive_no+1)*wall+drive_no*drive_height
            ])
            drive();
        }
    }
}

module large_drive() {
    cube([large_drive_width, large_drive_length+1, large_drive_height]);
    
    translate([0.5*(large_drive_width-slit), large_drive_length, 0])
    cube([slit, 2*wall+2, drive_height]);
}

module large_drive_case() {
    difference() {
        //do not make it as high as large_drive_height so it can be printed
        //rather we make it as high as drive_case and without a roof
        rounded_cube(large_drive_width+2*wall, large_drive_length+wall, no_of_drives*(drive_height+wall), wall);
    
        translate([wall, -1, wall])
        large_drive();
    }
}

module sd_case() {
}

module organizer() {
     
        //hole for battery organizer
        //translate([wall, cd_length-battery_hold_l+wall, cd_height+2*wall])
        //cube([battery_hold_w, battery_hold_l, 3*wall]);
                
        //slits for SD cards
//        translate([    wall,  1*wall, cd_height+1.5*wall]) sd();
//        translate([6.5*wall,  2*wall, cd_height+1.5*wall]) sd();
//        translate([    wall,  3*wall, cd_height+1.5*wall]) sd();
//        translate([6.5*wall,  4*wall, cd_height+1.5*wall]) sd();
//        translate([    wall,  5*wall, cd_height+1.5*wall]) sd();
//        translate([6.5*wall,  6*wall, cd_height+1.5*wall]) sd();
//        translate([    wall,  7*wall, cd_height+1.5*wall]) sd();
//        translate([6.5*wall,  8*wall, cd_height+1.5*wall]) sd();
//        translate([    wall,  9*wall, cd_height+1.5*wall]) sd();
//        translate([6.5*wall, 10*wall, cd_height+1.5*wall]) sd();
    cd_case();
    
    //drive organizer
    translate([0, (cd_length-drive_length), cd_height+wall])
    drive_case();
    
    translate([drive_width+2*wall-3, (cd_length-large_drive_length), cd_height+wall ])
    large_drive_case();
}

difference() {
    organizer();

    //middle slots for SD cards
    translate([drive_width+1.5*wall-1, (cd_length-drive_length)-1, cd_height+4*wall+0*sd_height]) sd();
    translate([drive_width+1.5*wall-1, (cd_length-drive_length)-1, cd_height+5*wall+1*sd_height]) sd();
    translate([drive_width+1.5*wall-1, (cd_length-drive_length)-1, cd_height+6*wall+2*sd_height]) sd();

    //right slots for SD cards
    translate([cd_width+1.5*wall-1, (cd_length-drive_length)+3, cd_height+4*wall+0*sd_height]) sd();
    translate([cd_width+1.5*wall-1, (cd_length-drive_length)+3, cd_height+5*wall+1*sd_height]) sd();
    translate([cd_width+1.5*wall-1, (cd_length-drive_length)+3, cd_height+6*wall+2*sd_height]) sd();
}
