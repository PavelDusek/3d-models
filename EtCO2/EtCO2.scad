tube      =  4.0;
lock      = 11.0;
height    = 10.0;
trach     = 17.5;
thickness =  4.0;
hat       = 38.0;
trach_h   = 20.0;
oxygen    =  5.5;
oxygen_z  = 20.0;
oxygen_l  = 20.0;
hat_z     = 25.0;
hat_h     = 15.0;
co2_angle = 15.0;
$fn       = 60;

module ClimaTrach() {
    translate([0, 0, 1.1*trach_h])
    rotate([180, 0, 35.6]) {
        //main tube
        cylinder(h = trach_h + oxygen, d = trach);

        //hat
        translate([0, 0, hat_z])
    cylinder(h = hat_h, d = hat);

        //oxygen side tube
        translate([0, -0.45*trach, oxygen_z])
        rotate([90, 0, 0])
        cylinder(h = oxygen_l, d = oxygen);
    }
}

module co2_tube() {
    color([1,1,1])
    cylinder( h = height, d = tube );
    //translate([0, 0, -0.1*height])
    cylinder( h = height, d = lock );
}

module holder() {
    difference() {
        hull() {
            translate([0, 0, thickness])
            cylinder( h = height, d = trach+thickness);
    
            translate([0, 0.5*trach+1.3*thickness, 0])
            rotate([-co2_angle,0,0]) 
            scale(1.3)
            co2_tube();
        }

        translate([0, 0, -0]) ClimaTrach();
        translate([0, 0, -1]) ClimaTrach();
        translate([0, 0, -2]) ClimaTrach();
        
        translate([0, 0.5*trach+1.3*thickness, -1])
        rotate([-co2_angle,0,0]) 
        scale([1, 1, 1.32])
        co2_tube();
        
        //slit to insert sidestream CO2 tube
        hull() {
            rotate([-co2_angle,0,0]) 
            translate([0, 0.5*trach+1.3*thickness, -1])
            cylinder( h = 3*height, d = tube );

            translate([0, 0, -1])
            cylinder( h = 3*height, d = tube );
        }
    }
}

holder();

//ClimaTrach();
