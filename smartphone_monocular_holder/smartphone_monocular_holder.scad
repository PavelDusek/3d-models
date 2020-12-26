monocular_diameter = 31.5;
monocular_depth = 10;

phone_width = 75;
phone_height = 165;
phone_depth = 4;
phone_strip = 15;
phone_tooth = 5;

cam_x = 22.5;
cam_y = 12;

finger_print_diameter = 11;
finger_print_x = 37.5;
finger_print_y = 25;

clip_height = 11;
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
        translate([1.25*monocular_diameter+0.25*phone_strip, -0.5*phone_tooth, -2*phone_depth])
        cube([0.5*phone_strip, phone_tooth, 5*phone_depth]);
    
        //holes for teeth: lower
        translate([1.25*monocular_diameter+0.25*phone_strip, phone_height-0.5*phone_tooth, -2*phone_depth])
        cube([0.5*phone_strip, phone_tooth, 5*phone_depth]);
    
        //holes for teeth: right
        translate([-0.5*phone_tooth, 0.95*monocular_diameter+0.25*phone_strip, -2*phone_depth])
        cube([phone_tooth, 0.5*phone_strip, 5*phone_depth]);
    
        //holes for teeth: left
        translate([phone_width-0.5*phone_tooth, 0.95*monocular_diameter+0.25*phone_strip, -2*phone_depth])
        cube([phone_tooth, 0.5*phone_strip, 5*phone_depth]);
    } 
}

module finger_print() {
    cylinder( d = finger_print_diameter, h = 4 * max( monocular_depth, phone_depth ) );
}

module clip() {
    //two small teeth
    difference() {
        cube( [phone_tooth, 0.5*phone_strip, phone_depth ] );
        translate( [ -2*phone_tooth, (1/8)*phone_strip, -1.5*phone_depth ] )
            cube( [3*phone_tooth, (1/4)*phone_strip, 3*phone_depth ] );
    }
    //wider ends of the teeth
    translate( [0, -(1/16)*phone_strip, -(1/2)*phone_tooth ] )
        cube( [ phone_tooth, (3/16)*phone_strip, (1/2)*phone_tooth] );
    translate( [0, (3/8)*phone_strip, -(1/2)*phone_tooth ] )
        cube( [ phone_tooth, (3/16)*phone_strip, (1/2)*phone_tooth] );

    
    //body of the clip
    translate( [ 0, -0.25*phone_strip, phone_depth ] )
        cube( [ phone_tooth, phone_strip, clip_height+0.5*phone_tooth] );
    
    //head of the clip
    translate( [ 0, -0.25*phone_strip, phone_depth+clip_height ] )
        cube( [ phone_tooth+clip_length, phone_strip, 0.5*phone_tooth] ); 
}

difference() {
    union() {
        translate([cam_x, cam_y, phone_depth-monocular_depth]) monocular();
        phone();
    }
    translate([finger_print_x, finger_print_y, -1.5*max( monocular_depth, phone_depth) ])
        finger_print();
}

clip_separation = (clip_height+0.5*phone_tooth+phone_depth+phone_strip);

translate([ 0.5*monocular_diameter, monocular_diameter+phone_strip+0.1*clip_separation, phone_depth] ) rotate( [ 0, 90, 90 ] ) clip();
translate([ 0.5*monocular_diameter, monocular_diameter+phone_strip+1.1*clip_separation, phone_depth] ) rotate( [ 0, 90, 90 ] ) clip();
translate([ 0.5*monocular_diameter, monocular_diameter+phone_strip+2.1*clip_separation, phone_depth] ) rotate( [ 0, 90, 90 ] ) clip();
translate([ 0.5*monocular_diameter, monocular_diameter+phone_strip+3.1*clip_separation, phone_depth] ) rotate( [ 0, 90, 90 ] ) clip();
