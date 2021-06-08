$fn = 20;
disc_height =  1;
disc_diam   =  8;
stem_width  =  3;
stem_height =  2;
stem_length =  4;
base_height =  2.5;
base_width  =  8;
base_length = 15;
hook_diam   =  4;
hook_height = 16;
hook_end    = 12;

module support() {
    difference() {
        cube( [ 0.5*hook_diam, 0.5*hook_height, 0.5*hook_height ] );
        rotate( [ 45, 0 , 0 ] )
            translate([-hook_diam, 0, 0 ])
            cube( [ 2*hook_diam, 1.5*hook_height, 0.5*hook_height ] );
    }
}

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
    
//hook
color( [1, 1, 0] )
translate( [0, (1/6)*base_length, disc_height + stem_height + base_height ] )
    cylinder(d = hook_diam, h = hook_height );
translate( [ 0, (1/6)*base_length - 0.08*hook_diam, disc_height + stem_height + base_height + hook_height - 0.5*hook_diam ] )
    rotate( [ -45, 0, 0 ] )
        cylinder( d = hook_diam, h = hook_end );
        
//support
color( [1, 0, 1 ] )
translate( [ -0.25*hook_diam, -0.45*hook_height, disc_height + stem_height + base_height ] )
//    cube( [ 0.5*hook_diam, 0.5*hook_height, 0.5*hook_height ] );
    
support();