drive_width   =  82;
drive_length  = 125;
drive_height  =  16;
wall          =   4;
slit          =  26;
no_of_drives  =   3;
$fn = 20;

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

module case() {
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

case();