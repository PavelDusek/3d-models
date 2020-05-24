tube_diameter = 19;
joint_length  = 40;
wall_width    =  5;

module case() {
    translate( [
        -1.1 * joint_length,
        -(1/2) * tube_diameter - wall_width,
        -(1/2) * tube_diameter - wall_width ] )
        cube( [
            2.2*joint_length,
            tube_diameter+ 2 * wall_width,
            tube_diameter+ 2 * wall_width ] );
    
    translate( [
        -(1/2) * tube_diameter - wall_width,
        0,
        -(1/2) * tube_diameter - wall_width ] )
        cube( [
            tube_diameter+ 2 * wall_width,
            1.1*joint_length,
            tube_diameter+ 2 * wall_width ] );
}

module tubing() {
    rotate( [-90,  0, 0] ) cylinder( h = 1.5 * joint_length, d = tube_diameter );
    rotate( [  0,  90, 0] ) cylinder( h = 1.5 * joint_length, d = tube_diameter) ;
    rotate( [  0, -90, 0] ) cylinder( h = 1.5 * joint_length, d = tube_diameter) ;

}

difference() {
    case();
    tubing();
}
