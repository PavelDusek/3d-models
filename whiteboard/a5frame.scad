frame_width  = 148;
frame_height = 210;

wall      = 3;
thickness = 3;

magnet_height1 =  4.5;
magnet_height2 = 12.5;
magnet_diam    = 10;
screw_height   = magnet_height2-magnet_height1;
screw_diam     =  4;
nut_height     =  3.2;
nut_diam       =  8;
number_depth   =  1;
number_size    =  5.5;
nut_radius     =  0.5 * nut_diam;
$fn            = 30;

module screw() {
    cylinder( d = screw_diam, h = screw_height );
}

module magnet() {
    cylinder( d = magnet_diam, h = magnet_height1+2 );
    translate([0, 0, magnet_height1]) screw();
}

module magnet_case() {
    difference() {
        cylinder( d = magnet_diam+wall, h = magnet_height1+wall);
        translate([0, 0, -1]) magnet();
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

module number_plate (num) {
    linear_extrude( number_depth+1 ) {
        text(num, size = number_size, font="Liberation Sans:style=Bold");
    }
}

module number(num) {
    difference() {
        translate([
            0.5*(magnet_diam+wall),
            0.5*(magnet_diam+wall),
            0
        ]) nut_case();
        translate([
            0.16*(magnet_diam+wall-number_size),
            0.5*(magnet_diam+wall-number_size),
            2*nut_height+wall
        ]) number_plate(num);
    }
}

module plate(plate_width, plate_height, plate_thickness) {
    hull() {
        translate( [
            0 * plate_width  + 0.5 * wall,
            0 * plate_height + 0.5 * wall,
            0 ] )
            cylinder(d = wall, h = plate_thickness);
        translate( [
            1 * plate_width  - 0.5 * wall,
            0 * plate_height + 0.5 * wall,
            0 ] )
            cylinder(d = wall, h = plate_thickness);
        translate( [
            0 * plate_width  + 0.5 * wall,
            1 * plate_height - 0.5 * wall,
            0 ] )
            cylinder(d = wall, h = plate_thickness);
        translate( [
            1 * plate_width  - 0.5 * wall,
            1 * plate_height - 0.5 * wall,
            0 ] )
            cylinder(d = wall, h = plate_thickness);
    }
}

module frame() {
    difference() {
        plate(frame_width, frame_height, thickness);
        
        translate( [ wall, wall, -1 ] ) 
        plate(frame_width - 2*wall, frame_height - 2*wall, thickness+3);
    }
}


difference() {
    frame();

    translate([0.5*(magnet_diam+wall), 0.5*(magnet_diam+wall), 0]) magnet();
    translate([frame_width-0.5*(magnet_diam+wall), frame_height-0.5*(magnet_diam+wall), 0]) magnet();
}

translate([0.5*(magnet_diam+wall), 0.5*(magnet_diam+wall), 0]) magnet_case();
translate([frame_width-0.5*(magnet_diam+wall), frame_height-0.5*(magnet_diam+wall), 0]) magnet_case();

translate([magnet_diam+wall, magnet_diam+wall, 0])
    number("XIII");

translate([2*magnet_diam+3*wall, magnet_diam+wall, 0])
    number("XIII");