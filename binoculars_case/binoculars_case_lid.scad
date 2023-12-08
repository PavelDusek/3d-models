thickness =  1.5;
diameter  = 35;
distance  = 61;
height    = 48;
steps     = 60;
arc       = 10;
gap       =  0.4;
$fn       = 60;

module shape(shape_diameter, shape_height) {
    for (x = [0:distance/steps:distance]) {
        translate([x, arc*sin(x*180/distance), 0])
        cylinder(h = shape_height, d = shape_diameter);
    }
}

difference() {
    color("green")
    shape( diameter + gap + 2*thickness, 0.25*height );

    translate([0, 0, thickness])
    color("blue")
    shape( diameter + gap + thickness, 0.25*height );
}