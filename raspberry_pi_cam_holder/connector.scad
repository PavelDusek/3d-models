wall  = 2.5;
tower_width = 22;
margin = 0.5;
tower_width_with_margin = tower_width + margin;
diagonal = sqrt(2)*tower_width_with_margin;

module connector() {
    color([ 1, 0, 0 ])
    translate( [0, -wall, 0 ] )
        cube( [ tower_width_with_margin, wall, tower_width_with_margin] );
    
    color([ 0, 1, 0 ])
    translate( [-wall, 0, 0 ] )
        cube( [ wall, tower_width_with_margin, tower_width_with_margin] );

    color([ 0, 0, 1 ])
    translate( [tower_width_with_margin, 0, 0 ] )
        cube( [ wall, tower_width_with_margin, tower_width_with_margin] );
    
    color([ 1, 1, 0 ])
    translate( [0, tower_width_with_margin, 0 ] )
        cube( [ tower_width_with_margin+0.5*wall, wall, tower_width_with_margin] );

    translate( [-wall, -wall, 0 ] )
        cube([ wall, wall, tower_width_with_margin ] );

    translate( [-wall, tower_width_with_margin, 0 ] )
        cube([ wall, wall, tower_width_with_margin ] );

    translate( [tower_width_with_margin, -wall, 0 ] )
        cube([ wall, wall, tower_width_with_margin ] );

    translate( [tower_width_with_margin, tower_width_with_margin, 0 ] )
        cube([ wall, wall, tower_width_with_margin ] );

}

connector();