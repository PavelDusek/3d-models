monocular_diameter = 31.5;
monocular_depth = 10;

phone_width = 75;
phone_height = 165;
phone_depth = 2.5;
phone_strip = 15;
phone_tooth = 5;

cam_x = 22.5;
cam_y = 12;

finger_print_diameter = 11;
finger_print_x = 37.5;
finger_print_y = 25;

clip_height = 12;
clip_length = 5;
clip_margin = 0.25;

module clip() {
    //small tooth no 1
    translate([0, ((1/2)-(1/4))*phone_strip+(1/2)*clip_margin, 0])
        cube( [phone_tooth-clip_margin, (1/9)*phone_strip, phone_depth+clip_margin] );
    translate([0, (1/4)*phone_strip+(1/2)*clip_margin-(1/18)*phone_strip, -(1/9)*phone_strip])
        cube( [phone_tooth-clip_margin, (3/18)*phone_strip, (1/9)*phone_strip] );

    //small tooth no 2
    translate([0, ((1/2)+(1/4)-(3/18))*phone_strip-(1/2)*clip_margin, 0])
        cube( [phone_tooth-clip_margin, (1/9)*phone_strip, phone_depth+clip_margin] );
    translate([0, ((1/2)+(1/4)-(3/18))*phone_strip-(1/2)*clip_margin, -(1/9)*phone_strip])
        cube( [phone_tooth-clip_margin, (3/18)*phone_strip, (1/9)*phone_strip] );
    
    //body of the clip
    translate( [ 0, 0, phone_depth+clip_margin ] )
        cube( [ phone_depth, phone_strip, clip_height+0.5*phone_tooth] );
    
    //head of the clip
    translate( [ 0, 0, phone_depth+clip_margin+clip_height ] )
        cube( [ phone_tooth+clip_length, phone_strip, 0.5*phone_tooth] ); 
}

clip_separation = (clip_height+0.5*phone_tooth+phone_depth+phone_strip);

translate([ 0, 0.1*clip_separation, phone_depth] ) rotate( [ 0, 90, 90 ] ) clip();
translate([ 0, 1.1*clip_separation, phone_depth] ) rotate( [ 0, 90, 90 ] ) clip();
translate([ 0, 2.1*clip_separation, phone_depth] ) rotate( [ 0, 90, 90 ] ) clip();
translate([ 0, 3.1*clip_separation, phone_depth] ) rotate( [ 0, 90, 90 ] ) clip();