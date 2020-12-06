radius = 40;
height = 155;
number_of_spirals = 7;
number_of_rotations = 1;
wall_thickness = 5;
cap_scale = 0.3;

module spiral(){
    for (a = [0:360/number_of_spirals:360]) {
        linear_extrude( height = height, twist=1*number_of_rotations*360) {
            rotate([0, 0, a]) translate([radius, 0, 0]) circle(wall_thickness);
        }

        linear_extrude( height = height, twist=-1*number_of_rotations*360) {
            rotate([0, 0, a]) translate([-1*radius, 0, 0]) circle(wall_thickness);
        }
    }
}

module cap(){
    for (a = [0:360/number_of_spirals:360]) {
        linear_extrude( height = cap_scale*height, twist=1*number_of_rotations*360, scale=cap_scale) {
            rotate([0, 0, a]) translate([radius, 0, 0]) circle(wall_thickness);
        }

        linear_extrude( height = cap_scale*height, twist=-1*number_of_rotations*360, scale=cap_scale) {
            rotate([0, 0, a]) translate([-1*radius, 0, 0]) circle(wall_thickness);
        }
    }
}

module base() {
    cylinder(h=height/20, r = radius);
}

module torus() {
    rotate_extrude(convexity=10) translate([cap_scale*radius, 0, 0]) circle(wall_thickness);
}
spiral();
translate([0, 0, height]) cap();
translate([0, 0, height*(1+cap_scale)])torus();
//base();
