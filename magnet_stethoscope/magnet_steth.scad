magnet_diam   = 16.6;
magnet_height =  4;
magnet_cap_d  =  8.5;
magnet_cap_h  =  6.5;
tube_diam     =  8.5;
tube_length   = 40;
tube_y        = 45;

module magnet() {
    cylinder( d = magnet_diam, h = magnet_height );
    translate([ 0, 0, magnet_height ])
        cylinder( d = magnet_cap_d, h = magnet_cap_h );
}

module tubing() {
    rotate_extrude(angle = 180) {
        translate([tube_y / 2, 0, 0] ) circle( d = tube_diam );
    }
    translate([0, tube_length+0.5*tube_y, 0]) rotate([90, 0, 0])
        cylinder( d = tube_diam, h = tube_length );
}

module case() {
    hull() {
    translate([  0.6*tube_y, 0*tube_y, 0]) sphere( d = 1.2*tube_diam );
    translate([ -0.6*tube_y, 0*tube_y, 0]) sphere( d = 1.2*tube_diam );
    translate([  0.4*tube_y, 0.7*tube_y, 0]) sphere( d = 1.2*tube_diam );
    translate([ -0.4*tube_y, 0.7*tube_y, 0]) sphere( d = 1.2*tube_diam );
    }
}

difference() {
    translate([0, -tube_y/3, 1]) case();

    translate([ 0, -0.5*tube_y, 0 ]) tubing();
    translate([ 0, -0.5*tube_y, -2 ]) tubing();
    translate([ 0, -0.5*tube_y, -4 ]) tubing();
    
    translate([  0.3*tube_y, 0.25 * tube_y, -0.5*tube_diam ]) magnet();
    translate([ -0.3*tube_y, 0.25 * tube_y, -0.5*tube_diam ]) magnet();
}