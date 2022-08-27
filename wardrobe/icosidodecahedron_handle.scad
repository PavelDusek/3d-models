phi = (1 + sqrt(5))/2;
target_size = 48;
actual_size =  3.5;
ratio = target_size/actual_size;

points = [
    [ 2,  0,  0],
    [-2,  0,  0],
    [ 0,  2,  0],
    [ 0, -2,  0],
    [ 0,  0,  2],
    [ 0,  0, -2],

    [ phi,  1/phi,  1],
    [ phi,  1/phi,  1],
    [ phi,  1/phi, -1],
    [ phi, -1/phi,  1],
    [ phi, -1/phi, -1],
    [-phi,  1/phi,  1],
    [-phi,  1/phi, -1],
    [-phi, -1/phi,  1],
    [-phi, -1/phi, -1],

    [ 1,  phi,  1/phi],
    [ 1,  phi, -1/phi],
    [ 1, -phi,  1/phi],
    [ 1, -phi, -1/phi],
    [-1,  phi,  1/phi],
    [-1,  phi, -1/phi],
    [-1, -phi,  1/phi],
    [-1, -phi, -1/phi],
    
    [ 1/phi,  1,  phi],
    [ 1/phi,  1, -phi],
    [ 1/phi, -1,  phi],
    [ 1/phi, -1, -phi],
    [-1/phi,  1,  phi],
    [-1/phi,  1, -phi],
    [-1/phi, -1,  phi],
    [-1/phi, -1, -phi],

];

module icosidodecahedron() {
    scale([ratio, ratio, ratio])
    rotate([58.282, 0, 0]) {
        hull() {
            for (point = points) {
                translate( point ) sphere(0.1);
            }
        }
    }
}

wall         =  2;
thickness    =  2;
screw_diam   =  6;
screw_height = 30;
nut_height   =  5.5;
nut_diam     = 12;
$fn          = 30;
nut_radius   = 0.5 * nut_diam;

angle       = 360/8;
size        = 20;
height      = (1 + sqrt(2)) * (size-thickness);

module hexagon(radius) {
    polygon(
        points = [
            [radius * sin(0*60), radius * cos(0*60)],
            [radius * sin(1*60), radius * cos(1*60)],
            [radius * sin(2*60), radius * cos(2*60)],
            [radius * sin(3*60), radius * cos(3*60)],
            [radius * sin(4*60), radius * cos(4*60)],
            [radius * sin(5*60), radius * cos(5*60)]
        ]
    );
}

module nut(radius, height) {
    linear_extrude(height) {
        hexagon(radius);
    };
}

module nut_case() {
    difference() {
        cylinder( d = magnet_diam+wall, h = 2*nut_height+wall+number_depth);
        translate([0, 0, -1])
            nut(nut_radius, nut_height+1);
        translate([0, 0, nut_height])
            nut(nut_radius, nut_height);
    }
}

module mount() {
    translate([0, 0, 0*nut_height])
        nut(nut_radius, nut_height);
    translate([0, 0, 1*nut_height])
        nut(nut_radius, nut_height);

    hull() {
        translate([0*sin(60)*nut_radius, 0, 2*nut_height])
            nut(nut_radius, nut_height);
        translate([2*sin(60)*nut_radius, 0, 2*nut_height])
            nut(nut_radius, nut_height);
    }
    translate([2*sin(60)*nut_radius, 0, 1*nut_height])
        nut(nut_radius, nut_height);
    translate([2*sin(60)*nut_radius, 0, 0])
        cylinder(d = screw_diam, h = screw_height);
}

difference() {
    translate([0, 0, 0.5*target_size+0.495])
    icosidodecahedron();
    color([1, 0, 1]) translate([-0.95*nut_radius, 0, -0.2]) mount();
}