target_size = 55;
actual_size =  43.94;
ratio = target_size/actual_size;

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

module snub_dodecahedron() {
    scale( ratio )
    hull() {
        import("downloaded_snub_dodecahedron.stl");
    }
}

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
translate([-2.5, 0, 0.5*target_size-1.59])
rotate([0, 0, 30])
rotate([(180-152.93)/2-3, 0, 0])
rotate([0, (180-164.18)*2-2, 0])    
snub_dodecahedron();
color([1, 0, 1]) translate([-0.95*nut_radius, 0, -0.2]) mount();
}