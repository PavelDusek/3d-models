width  = 75;
length = 90;
height =  3;
thickness = 1;

$fn = 100;

scale([length/width, 1, 1]) {
    difference() {
        cylinder(d = width + thickness, h = height);
        translate([0, 0, -1])
            cylinder(d = width, h = height+3);
    }
}

translate([-0.5*length, 0, -0.5*height])
rotate([0, -90, 0])
cylinder( d = 3 * height, h = thickness );