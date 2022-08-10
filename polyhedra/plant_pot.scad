angle       = 360/8;
size        = 40;
thickness   =   4;
height      = (1 + sqrt(2)) * (size-thickness);
hole        =   4;

module j37() {
    hull() {    
        for (i = [0:7]) {
            rotate([0, 0, i*angle])
            translate([-0.5*size, -0.5*height-thickness, -0.5*size])
            cube([size, thickness, size]);
        }
    
        for (i = [0:7]) {
            rotate([i*angle, 0, 0])
            translate([-0.5*size, -0.5*size, 0.5*height])
            cube([size, size, thickness]);
        }
    
        for (i = [0:7]) {
            rotate([0, i*angle, 0])
            translate([-0.5*size, -0.5*size, 0.5*height])
            cube([size, size, thickness]);
        }
    }
}

difference() {
    j37();
    scale([0.95, 0.95, 0.95]) j37();
    translate([0, 0, -0.5*height-2*thickness]) cylinder(d = hole, h = 0.5*height);
    
    translate([-height, -height, 0.5*size]) cube([2*height, 2*height, 2*height]);
}

