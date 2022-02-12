width1     = 22;
width2     = 26;
length     = 93;
gap        = 36;
thickness1 =  3;
thickness2 =  8;
corner     =  9;
tiny       = 0.0001;

module rounded_edge(length, width1, width2, thickness, corner) {
    hull() {
        translate([0*length+0.5*corner, 0*width1+0.5*corner])
            cylinder( d = corner, h = thickness);
        translate([0*length+0.5*corner, 1*width1-0.5*corner])
            cylinder( d = corner, h = thickness);
        translate([1*length-0.5*corner, 0*width1+0.5*corner])
            cylinder( d = corner, h = thickness);
        translate([1*length-0.5*corner, 1*width1-0.5*corner])
            cylinder( d = corner, h = thickness);
        
        translate([0.5*length+0*corner, 0.5*(width1-width2)+0.5*corner])
            cylinder( d = corner, h = thickness);
        translate([0.5*length+0*corner, width2-0.5*(width2-width1)-0.5*corner])
            cylinder( d = corner, h = thickness);

    }
}

translate([0, 0, 0])
    color([1, 0, 0])
        rounded_edge(length, width1, width2, thickness1, corner);

translate([0, 0, thickness1])
    color([1, 1, 0])
        difference() {
            rounded_edge(length, width1, width2, thickness2, corner);
            translate([0.5*(length-gap), width1-width2, -2*thickness2])
                cube([gap, 4*width2, 4*thickness2]);
        }
