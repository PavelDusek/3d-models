tube      =  4.0;
lock      = 11.0;
height    = 10.0;
trach     = 40.0; //???
thickness =  5.0; //???
$fn       = 60;

module co2_tube() {
    cylinder( h = 1.5*height, d = tube );
    cylinder( h = height, d = lock );
}

module holder() {
    difference() {
        hull() {
            cylinder( h = height, d = trach+thickness);
    
            translate([0, 0.5*trach+1.3*thickness, 0])
            scale(1.3)
            co2_tube();
        }
        
        translate([0, 0, -1])
        cylinder( h = 3*height, d = trach );
        
        translate([0, 0.5*trach+1.3*thickness, -1])
        scale([1, 1, 1.32])
        co2_tube();
        
        
        hull() {
            translate([0, 0.5*trach+1.3*thickness, -1])
            cylinder( h = 3*height, d = tube );

            translate([0, 0, -1])
            cylinder( h = 3*height, d = tube );
        }
    }
}


holder();