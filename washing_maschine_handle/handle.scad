width    =  25  ;
wall     =   2  ;
height   =  17.5;
height_e =   5  ;
length   =  25  ;
hole     =   4.2;
slit     =   7  ;
spring   =  10  ;
handle_l =  50  ;
handle_w = 100  ;
$fn      =  50  ;

module rod( rod_diam, rod_width ) {
    translate([0, 0.5*rod_diam, 0.5*rod_diam]) rotate([ 0, 90, 0]) cylinder( d = rod_diam, h = rod_width );
}

module rounded_cube() {
    hull() {
    rod( rod_diam = 3*hole, rod_width = width );
    
    translate([ 0, 0, height-wall]) cube([ width, wall, wall ]);
    
    translate([0, wall+0.2*length, height-wall]) rotate( [ 0, 90, 0] ) cylinder( d = 2*wall, h = width );

    translate([0, length-wall, height_e]) rotate( [ 0, 90, 0] ) cylinder( d = 2*wall, h = width );

    translate([ 0, length-wall, 0]) cube([ width, wall, wall ]);
    }
}

module mount() {
    difference() {
        rounded_cube();
        
        translate([ wall, 2*wall, 2*wall ] ) cube( [ width - 2*wall, length, height ]);

        //slit        
        translate([wall, -1, -2*wall]) cube([width - 2*wall, slit+2*wall+1, height]);
        translate([wall, wall, 0]) cube([width - 2*wall, slit, 2*height]);

        //spring
        translate([0.5*width, 0.7*length, -2*wall+1]) cylinder( d = spring-wall, h = 2*wall );
        translate([0.5*width, 0.6*length, -2*wall+1]) cylinder( d = spring-wall, h = 2*wall );
        translate([0.5*width, 0.5*length, -2*wall+1]) cylinder( d = spring-wall, h = 2*wall );

        translate([0.5*width, 0.7*length, 0.5*wall-0.001
        ]) cylinder( d = spring, h = wall+0.001 );
        translate([0.5*width, 0.6*length, 0.5*wall-0.001
        ]) cylinder( d = spring, h = wall+0.001 );
        translate([0.5*width, 0.5*length, 0.5*wall-0.001
        ]) cylinder( d = spring, h = wall+0.001 );

    
    }
    
    //rod mount
    translate([ -wall, 0, 0]) rod( rod_diam = 3*hole, rod_width = 4*wall );
    
    translate([ width-3*wall, 0, 0]) rod( rod_diam = 3*hole, rod_width = 4*wall );
    
    
    translate([ wall, 0, hole]) cube([2*wall, 2*wall, height-hole]);
    translate([ width-3*wall, 0, hole]) cube([2*wall, 2*wall, height-hole]);
    
    translate([ wall, hole, 0 ]) cube([2*wall, length-hole, 2*wall]);

    translate([ width-3*wall, hole, 0 ]) cube([2*wall, length-hole, 2*wall]);
    
    translate([ 0.5*wall, -wall, height-2*wall]) cube([width-wall, wall, 2*wall]);

    color([1, 0, 0]) translate([0.5*width, 0.7*length, 2*wall
        ]) cylinder( d = spring, h = 0.5*wall );

}

module arc() {
    difference() {
        translate([0, 0.5*handle_w, 0]) cylinder(d = handle_w, h = 3*wall);
        translate([-handle_w, handle_l, -1]) cube([ 2*handle_w, handle_w, handle_w]);
    }
}

module handle() {
    minkowski() {
        difference() {
            arc();
            translate([0, 0.075*handle_w, -1]) scale([0.75, 0.75, 1.5]) arc();
        }
        sphere(d = 2*wall);
    }
}

module arc2() {
    difference() {
        translate([0, 0.5*handle_w, 0]) cylinder(d = handle_w, h = 2*wall);
        translate([-handle_w, handle_l, -1]) cube([ 2*handle_w, handle_w, handle_w]);
        translate([-handle_w, -0.5*handle_w, -1]) cube([ handle_w, 2*handle_w, handle_w]);
    }
}

module handle2() {
    minkowski() {
        difference() {
            arc2();
            translate([0.075*handle_w, 0.075*handle_w, -1]) scale([0.75, 0.75, 1.5]) arc2();
        }
        sphere(d = 2*wall);
    }
}

difference() {
    mount();

    //rod hole
    translate([ -width, hole, hole]) rod( rod_diam = hole, rod_width = 3*width );
    
    //curved shape
    translate([ -width, length-2.9*hole, height-2.7*hole]) rod( rod_diam = 5*hole, rod_width = 3*width );

}


color([0, 1, 1]) translate([0.5*width, length-wall, 2*wall]) handle();

//color([0, 1, 1]) translate([0.5*width, length-wall, 2*wall])  rotate([0, -90, 0]) handle2();
//color([1, 1, 1]) translate([0, length-wall, 2*wall]) cube([width, wall, wall]);
