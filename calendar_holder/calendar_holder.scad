$fn = 20;
base_height =   2.5;
hook_dist   = 205;
base_margin =  10;
base_width  = hook_dist + 2*base_margin;
base_length =  15;
hook_diam   =   4;
hook_height =  16;
hook_end    =  12;

module support() {
    difference() {
        cube( [ 0.5*hook_diam, 0.5*hook_height, 0.5*hook_height ] );
        rotate( [ 45, 0 , 0 ] )
            translate([-hook_diam, 0, 0 ])
            cube( [ 2*hook_diam, 1.5*hook_height, 0.5*hook_height ] );
    }
}

module hanger() {
    difference() {
        cylinder( d = base_length, h = base_height );
        translate([ 0, 0, -base_height])
        cylinder( d = 1.5*hook_diam, h = 3*base_height );
    }
}

module hook() {
    color( [1, 1, 0] )
    translate( [0, (1/6)*base_length, base_height] )
    color([0, 0, 1])
        cylinder(d = hook_diam, h = hook_height );
    translate( [ 0, (1/6)*base_length - 0.08*hook_diam, base_height + hook_height - 0.5*hook_diam ] )
        rotate( [ -45, 0, 0 ] )
            cylinder( d = hook_diam, h = hook_end );

    translate( [ -0.25*hook_diam, -0.40*hook_height, base_height ] ) support();
}

module base() {
    translate([ -base_margin, -0.5*base_length, 0 ])
        cube( [ base_width, base_length, base_height ] );
}

translate([0.5*hook_dist, 0.65*base_length, 0]) hanger();
base();
translate([ 0*hook_dist, 0, 0]) hook();
translate([ 1*hook_dist, 0, 0]) hook();
