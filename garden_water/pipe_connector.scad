diameter = 3;
tube     = 10;
rubber   = 2;
wall     = 2;
tube_extension = 10;
$fn = 40;
stopper_width  = 19;
stopper_height = 16;
stopper_distance = 4;
stopper_length = 5;
stopper_slope  = 4;
stopper_large  = 25;

module ring(outer_diam, inner_diam) {
    rotate_extrude( convexity = 20 )
        translate([0.5*outer_diam, 0, 0]) circle(d = (outer_diam-inner_diam));
}

module connector() {
    difference() {
        union() {
            cylinder( d = tube + wall, h = diameter+rubber+2*stopper_distance);
            ring( tube+diameter, tube );
            translate([0, 0, diameter+rubber])
            ring( tube+diameter, tube );
        }    
            translate([0, 0, -diameter-1])
            cylinder( d = tube, h = 2*diameter+rubber+2*stopper_distance+3);
    }
}

module stopper() {
    difference() {
        union() {
            hull() {
                cylinder( d = tube, h = stopper_slope+stopper_length );
                cylinder( d = stopper_width, h = stopper_length );
            }
            translate([0, 0, -stopper_length])
            cylinder( d = stopper_large, h = stopper_length);
        }
        translate([0, 0, -stopper_length-1])
        cylinder( d = tube, h = stopper_slope+2*stopper_length + 3);
    
        translate([-0.5*stopper_height, 0.5*stopper_height, 0])
        cube([ stopper_height, stopper_height, stopper_height ]);

        translate([-0.5*stopper_height, -1.5*stopper_height, 0])
        cube([ stopper_height, stopper_height, stopper_height ]);
    }
    
}

translate([0, 0, 1.5*diameter+rubber+stopper_distance])
rotate([180, 0, 0])
connector();
translate([0, 0, -(stopper_slope+stopper_length)])
stopper();
