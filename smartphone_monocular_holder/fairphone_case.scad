monocular_diameter = 31.5;
monocular_depth = 13;

phone_depth = 2.5;
phone_strip = 15;
phone_tooth = 5;
phone_width = 74;

cam_x = 22.5;
cam_y = 12;

finger_print_diameter = 13;
finger_print_x = 37.5;
finger_print_y = 25;

clip_height = 12;
clip_length = 5;
clip_margin = 0.25;

module monocular() {
    //holder for the monocular
    difference() {
        cylinder(d = 1.3 * monocular_diameter, h = monocular_depth );
        translate([0,0, -0.5*monocular_depth]) cylinder(d = monocular_diameter, h = 2*monocular_depth );
    }
}

module clip() {    
    //body of the clip
    color([1,0,0])
    cube( [ phone_depth, phone_strip, phone_depth+clip_height+0.5*phone_tooth] );
    
    //head of the clip
    color([0,1,0])
    translate( [ 0, 0, phone_depth+clip_margin+clip_height ] )
        cube( [ phone_tooth+clip_length, phone_strip, 0.5*phone_tooth] ); 
}

module finger_print() {
    cylinder( d1 = 2*finger_print_diameter, d2 = finger_print_diameter, h = 5 * max( monocular_depth, phone_depth ) );
}

module phone() {
    //attachement to the phone
    
    //vertical bar
    translate([ 1.25*monocular_diameter, 0, 0])
        cube([phone_strip, 1.25*monocular_diameter, phone_depth]);
            
    //horizontal bar
    translate([ 0, 0.95 * monocular_diameter, 0])
        cube([phone_width, phone_strip,  phone_depth]);

    //clips: right
    translate([-phone_depth, 0.95*monocular_diameter, 0]) clip();

    //clips: left
    translate([phone_width+phone_depth, 0.95*monocular_diameter, 0]) mirror([1, 0, 0]) clip();
    
    //clips: upper
    translate([1.25*monocular_diameter+phone_strip, -phone_depth, 0]) rotate([0, 0, 90]) clip();
}

difference() {
    union() {
        translate([cam_x, cam_y, phone_depth-monocular_depth]) monocular();
        phone();
    }
    translate([finger_print_x, finger_print_y, -3*max( monocular_depth, phone_depth) ])
        finger_print();
}