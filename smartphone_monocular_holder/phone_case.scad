monocular_diameter = 31.5;
monocular_depth = 10;

phone_width = 75;
phone_height = 165;
phone_depth = 2.5;
phone_strip = 15;
phone_tooth = 5;

cam_x = 22.5;
cam_y = 12;

finger_print_diameter = 13;
finger_print_x = 37.5;
finger_print_y = 25;

clip_height = 12;
clip_length = 5;

module monocular() {
    //holder for the monocular
    difference() {
        cylinder(d = 1.3 * monocular_diameter, h = monocular_depth );
        translate([0,0, -0.5*monocular_depth]) cylinder(d = monocular_diameter, h = 2*monocular_depth );
    }
}

module phone() {
    //attachement to the phone
    difference() {
        union() {
            //vertical bar
            translate([ 1.25*monocular_diameter, -phone_tooth, 0])
            cube([phone_strip, phone_height+2*phone_tooth, phone_depth]);
            
            //horizontal bar
            translate([ -phone_tooth, 0.95 * monocular_diameter, 0])
            cube([phone_width + 2*phone_tooth, phone_strip,  phone_depth]);
        }
    
        //holes for teeth: upper
        translate([1.25*monocular_diameter+0.25*phone_strip, -0.75*phone_tooth, -2*phone_depth])
        cube([0.5*phone_strip, phone_tooth, 5*phone_depth]);
    
        //holes for teeth: lower
        translate([1.25*monocular_diameter+0.25*phone_strip, phone_height-0.25*phone_tooth, -2*phone_depth])
        cube([0.5*phone_strip, phone_tooth, 5*phone_depth]);
    
        //holes for teeth: right
        translate([-0.75*phone_tooth, 0.95*monocular_diameter+0.25*phone_strip, -2*phone_depth])
        cube([phone_tooth, 0.5*phone_strip, 5*phone_depth]);
    
        //holes for teeth: left
        translate([phone_width-0.25*phone_tooth, 0.95*monocular_diameter+0.25*phone_strip, -2*phone_depth])
        cube([phone_tooth, 0.5*phone_strip, 5*phone_depth]);
    } 
}

module finger_print() {
    cylinder( d1 = 2*finger_print_diameter, d2 = finger_print_diameter, h = 4 * max( monocular_depth, phone_depth ) );
}

difference() {
    union() {
        translate([cam_x, cam_y, phone_depth-monocular_depth]) monocular();
        phone();
    }
    translate([finger_print_x, finger_print_y, -3*max( monocular_depth, phone_depth) ])
        finger_print();
}