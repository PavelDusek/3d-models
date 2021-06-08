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

wall        = 3;
diameter    = 38 + wall;
height      = 55;
number_of_spirals   = 6;
number_of_rotations = 0.5;

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


module spiral(){
    for (a = [0:360/number_of_spirals:360]) {
        linear_extrude( height = height, twist=1*number_of_rotations*360) {
            rotate([0, 0, a]) translate([0.5*diameter, 0, 0]) circle(wall);
        }

        linear_extrude( height = height, twist=-1*number_of_rotations*360) {
            rotate([0, 0, a]) translate([-0.5*diameter, 0, 0]) circle(wall);
        }
    }
}

module disc() {
    cylinder(d = diameter + 2*wall, h = wall );
}

module ring() {
    difference() {
        cylinder(d = diameter + 2*wall, h = wall );
        translate([0, 0, -1])
        cylinder(d = diameter- 2*wall, h = 2*wall );
    }
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

disc();
spiral();
translate([ 0, 0, height]) ring();

translate( [ -0.5*diameter-wall, -0.5*disc_dist, height - base_length + wall] )
    attachment();
