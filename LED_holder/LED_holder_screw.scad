led_width = 16;
led_height = 4;
screw_diam = 4;
screw_head = 7;
screw_head_height = 4;

thickness = 3;
radius_thickness = 4;
width = 10;
$fn = 30;

module holder() {
    translate([-0.5*(screw_head+radius_thickness), 0, 0])
    hull() {
        cylinder(h = led_height + thickness, r = screw_head+radius_thickness);

        translate([led_width+screw_head+radius_thickness, 0, 0 ])
        cylinder(h = led_height + thickness, r = screw_head+radius_thickness);
    }
}

module screw() {
    cylinder(h = screw_head_height, r1 = screw_diam, r2 = screw_head);
    translate([0, 0, screw_head_height-0.1])
    cylinder(h = 2*screw_head_height, r = screw_head);
    translate([0, 0, -2*screw_head_height+0.1])
    cylinder(h = 2*screw_head_height, r = screw_diam);
}

module led() {
    translate([0, -5*led_width, -0.01])
    cube([led_width, 10*led_width, led_height]);
}

difference() {
    holder();
    led();

    translate([-0.5*screw_head-radius_thickness, 0, 0])
    screw();
    
    translate([led_width+0.5*screw_head+radius_thickness, 0, 0])
    screw();
}
