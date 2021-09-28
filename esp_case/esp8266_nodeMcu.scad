board_width   = 26;
board_length  = 48;
board_height  = 24;
usb_width     =  8;
usb_height    =  3;
module_width  = 13.7;
module_height =  6.7;
wall          =  1;
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

module case() {
    difference() {
        rounded_cube(board_width+2*wall, board_length+2*wall, board_height+2*wall, wall);
    
        translate([wall, wall, wall])
        rounded_cube(board_width, board_length, board_height, wall);

        //hole for usb
        translate([ 0.5*(board_width-usb_width), -0.1*board_length, 2*wall ])
            rounded_cube( usb_width, board_length, usb_height, wall );
        //hole for module
        translate([ 0.5*(board_width-module_width), +0.1*board_length, 0.5*(board_height-module_height) ])
            rounded_cube( module_width, board_length, module_height, wall );

        
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

module connector() {
    intersection() {
        difference() {
            rounded_cube(board_width+4*wall, board_length+4*wall, board_height+4*wall, wall);
            translate([wall, wall, wall]) rounded_cube(board_width+2*wall, board_length+2*wall, board_height+2*wall, wall);
        }
        cube([board_width+6*wall, board_length+6*wall, 0.1*board_height + 6*wall ]);
    }
}

module lid() {
    translate([wall, board_length+wall, 0])
        rotate([180, 0, 0])
            translate([0, -3*wall, -board_height-3*wall])
                intersection() {
                    case();
                    cutcube();
                }
    color([1, 0, 0]) connector();
}

module mytext() {
    translate([0.15*board_width, 0.4*board_length, -6*wall])
        mirror([1, 0, 0])
            rotate([0, 0, 90])
                linear_extrude(board_height)
                    text("some text", size=5);
}

main_part();
translate([-1.25*board_width, 0, 0])
    difference() {
        lid();
        mytext();
    }