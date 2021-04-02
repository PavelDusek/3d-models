rod_diameter = 20;
saddle_diameter = 34;

soap_diameter = 62;

module holder() {
    difference() {
        cylinder( d = 1.75*rod_diameter, h = 2*rod_diameter);
        translate([0, 0, -1])
            cylinder( d = rod_diameter, h = 3*rod_diameter);
        translate([0, -1.5*rod_diameter, -0.25*rod_diameter])
            rotate([-90, 0, 0])
                cylinder( d = saddle_diameter , h = 3*rod_diameter);
    }
}

module connection() {
    translate([-0.5*rod_diameter, 0.5*rod_diameter, rod_diameter])
        cube([rod_diameter, 0.5*rod_diameter, rod_diameter]);
}

module soap() {
    translate([0, (0.5+0.075)*soap_diameter+0.9*rod_diameter, 0])
        difference() {
            cylinder( d = 1.15*soap_diameter, h = 2*rod_diameter);
            translate([0, 0, 0.15*rod_diameter]) cylinder( d = soap_diameter, h = 2*rod_diameter);
        }
}

color([1, 0, 0]) holder();
color([0, 1, 0]) connection();
color([0, 0, 1]) soap();