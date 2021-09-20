$fn = 60;
disc_height =  1;
disc_diam   =  8;
stem_width  =  3;
stem_height =  2;
stem_length =  4;
base_height =  2.5;
base_width  =  8;
base_length = 15;
disc_dist   = 37;
wall        =  2;

usb_width   =  5;
usb_length  = 12;
usb_height  = 12;
usb_no      =  4;
usb_margin  =  8;

usb_holder_length = usb_no * (usb_width+usb_margin);
usb_holder_width  = usb_length+usb_margin;
usb_holder_height = usb_height+0.5*usb_margin;

module pegdisc() {
    //disc
    color( [1, 0, 0] )
    cylinder( d = disc_diam, h = disc_height );
    
    //stem
    color( [0, 1, 0] )
    translate( [-0.5*stem_width, -0.5*stem_length , disc_height])
        cube([ stem_width, stem_length, stem_height ]);
        
    //base
    color( [0, 0, 1] )
    translate( [-0.5*base_width, -0.5*base_length, disc_height+stem_height])
        cube( [ base_width, base_length, base_height ] ); 
}

module attachment() {
    cube([ wall, disc_dist, base_length ] );

    translate([base_height, disc_dist, 0.5*base_length])
        rotate([90, 0, 90])
            translate([ 0, 0, -1*(disc_height+stem_height+base_height) ])
                pegdisc();

    translate([base_height, 0, 0.5*base_length])
        rotate([90, 0, 90])
            translate([ 0, 0, -1*(disc_height+stem_height+base_height) ])
                pegdisc();
}

module usb() {
    cube( [ usb_length, usb_width, usb_height ]);
}

module usb_holder() {
    cube( [ usb_holder_width, usb_holder_length, usb_holder_height] );
}

translate([ 0, 0.5*(usb_holder_length-disc_dist), usb_holder_height - base_length]) attachment();

difference() {
    usb_holder();
    //holes for usbs:
    for (i = [0:1:usb_no-1] ) {
        translate([ 0.5*usb_margin, 0.5*usb_margin+i*(usb_width+usb_margin), 0.5*usb_margin+0.1 ])
            usb();
    }
}