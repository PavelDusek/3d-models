include <BOSL2/std.scad>
include <BOSL2/screws.scad>

hole_diam  = 15.3;
desk_thick = 20.0;
wall       =  3.0;
plate      = 50.0;
screw      =  5.5;
screw_hat  = 14.0;
screw_hat_thick = 3.0;
screw_len  = 10.0;
screw_dist = 22.0;
$fn        = 32;

module halfcylinder( h, d ) {
    difference() {
        cylinder(h = h, d = d);
    
        translate([0.25*d, -d-1, -1])
        cube([2*d, 2*d+2, h+2]);
    
        translate([-2.25*d, -d-1, -1])
        cube([2*d, 2*d+2, h+2]);

    }
}

module screw_model() {
    translate([0, 0, screw_hat_thick])
    rotate([180, 0, 0])
    cylinder(h = screw_len, d = screw);
    cylinder(h = screw_hat_thick, d = screw_hat);
}

module mount() {
    //plate
    translate([-0.5*plate, -0.5*plate, -wall])
    cube([plate, plate, wall]);

    //mount
    hull() {
        cylinder(h = desk_thick, d = hole_diam);

        translate([0, 0, desk_thick])
        halfcylinder( h = 0.5*desk_thick, d = hole_diam);
    }

    translate([0, 0, 1.5*desk_thick])
    halfcylinder( h = 1.15*desk_thick, d = hole_diam);
}

difference() {
    mount();

    translate([-0.10*hole_diam, 0, desk_thick+screw_dist])
    rotate([0, -90, 0])
    screw_model();

    translate([-0.52*hole_diam, 0, desk_thick+screw_dist])
    rotate([0, -90, 0])
    scale([1.02, 1.02, 1.02])
    screw("1/4-20", length=screw_len, anchor=TOP, head="socket");
}