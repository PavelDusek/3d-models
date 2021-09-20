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

bat_height    = 25;
bat_9V_width  = 18;
bat_9V_length = 27;
bat_AA_diam   = 15;
bat_AAA_diam  = 11.5;
bat_no      =  4;
bat_margin  =  8;

bat_holder_length = bat_no * (bat_AA_diam+0.25*bat_margin)+bat_9V_width + 1.5*bat_margin;
bat_holder_width  = bat_9V_length+bat_margin;
bat_holder_height = bat_height+0.5*bat_margin;

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

module bat_9V() {
    cube( [ bat_9V_length, bat_9V_width, bat_height ]);
}

module bat_AA() {
    cylinder( d = bat_AA_diam, h = bat_height );
}

module bat_AAA() {
    cylinder( d = bat_AAA_diam, h = bat_height );
}

module bat_holder() {
    cube( [ bat_holder_width, bat_holder_length, bat_holder_height] );
}

translate([ 0, 0.5*(bat_holder_length-disc_dist), bat_holder_height - base_length]) attachment();

difference() {
bat_holder();
color([1, 0, 0])
    translate([0.5*bat_margin, 0.5*bat_margin, 0.5*bat_margin+0.01])
    bat_9V();

//    holes for bats:
    for (i = [0:1:bat_no-1] ) {
    color([0, 1, 0])
    translate([0.5*(bat_margin+bat_AA_diam), 0.5*bat_margin+bat_9V_width+0.5*bat_margin+0.5*bat_AA_diam+i*(bat_AA_diam+0.25*bat_margin), 0.5*bat_margin+0.01])
        bat_AA();

    color([0, 0, 1])
    translate([bat_AA_diam+0.75*bat_margin+0.5*bat_AAA_diam, 0.5*bat_margin+bat_9V_width+0.5*bat_margin+0.5*bat_AA_diam+i*(bat_AA_diam+0.25*bat_margin), 0.5*bat_margin+0.01])
        bat_AAA();
    }
}