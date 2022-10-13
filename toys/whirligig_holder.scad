//rod
width  = 66;
height = 41;

//holder
length = 30;
thick  =  5;

//whirligig tube
diam   =  5.5;

$fn = 30;

module disc_hole() {
    difference() {
        cylinder(d = length, h =   thick);
        translate([0, -0.5*diam, -1])
        cylinder(d = diam,   h = 3*thick);
    }
}


difference() {
    cube([length, width+2*thick, height+2*thick]);
    translate([-150, -1, thick]) cube([300, width+thick+1, height]);
}
translate([0.5*length, 0, 0])
disc_hole();

translate([0.5*length, 0, height+thick])
disc_hole();