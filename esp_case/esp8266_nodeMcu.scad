board_width  = 26;
board_length = 48;
board_height = 24;
usb_width  =  8;
usb_height =  4;
wall   =  1;
$fn = 20;

module rounded_cube(width, length, height, corner) {
    hull() {
        translate([ 0*width+corner, 0*length+corner, 0*height+corner])
            sphere( r = corner );

        translate([ 1*width-corner, 0*length+corner, 0*height+corner ])
            sphere( r = corner );

        translate([ 0*width+corner, 1*length-corner, 0*height+corner ])
            sphere( r = corner );

        translate([ 1*width-corner, 1*length-corner, 0*height+corner ])
            sphere( r = corner );

        translate([ 0*width+corner, 0*length+corner, 1*height-corner ])
            sphere( r = corner );

        translate([ 1*width-corner, 0*length+corner, 1*height-corner ])
            sphere( r = corner );

        translate([ 0*width+corner, 1*length-corner, 1*height-corner ])
            sphere( r = corner );

        translate([ 1*width-corner, 1*length-corner, 1*height-corner ])
            sphere( r = corner );
    }
}

module case() {
    difference() {
        rounded_cube(board_width+2*wall, board_length+2*wall, board_height+2*wall, wall);
    
        translate([wall, wall, wall])
        rounded_cube(board_width, board_length, board_height, wall);

        //hole for usb and for cables
        translate([ 0.5*(board_width-usb_width), -0.1*board_length, 2*wall ])
            rounded_cube( usb_width, board_length, usb_height, wall );
        translate([ 0.5*(board_width-usb_width), +0.1*board_length, 2*wall ])
            rounded_cube( usb_width, board_length, usb_height, wall );

        
    }
}

module cutcube() {
    color([1, 0, 1])
    translate([ -wall, -wall, 0.9*board_height ])
        cube([board_width+4*wall, board_length+4*wall, board_height+4*wall]);
}

module main_part() {
    difference() {
        case();
        cutcube();
    }
}

module lid() {
    rotate([180, 0, 0])
        translate([0, 0, -board_height-2*wall])
            intersection() {
                case();
                cutcube();
            }
}

module mytext() {
    translate([0.1*board_width, -1.3*board_height, -6*wall])
        mirror([1, 0, 0])
            rotate([0, 0, 90])
                linear_extrude(board_height)
                    text("some text", size=5);
}

main_part();
translate([-1.2*board_width, board_length, 0])
    difference() {
        lid();
        mytext();
    }
