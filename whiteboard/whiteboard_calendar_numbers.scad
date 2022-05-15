wall           =  2;
thickness      =  2;
magnet_height1 =  4.5;
magnet_height2 = 12.5;
magnet_diam    = 10;
screw_diam     =  4;
nut_height     =  3.2;
nut_diam       =  8;
number_depth   =  1;
number_size    =  6.6;
$fn            = 30;

screw_height = magnet_height2-magnet_height1;
nut_radius   = 0.5 * nut_diam;

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

nums = [" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"];
for (row = [0:30]) {
    if (row >= 28) {
        translate([
            (row % 7) * (magnet_diam+wall+1),
            4 * (magnet_diam+wall+1),
            0
        ]) number(nums[row]);
    } else if (row >= 21) {
        translate([
            (row % 7) * (magnet_diam+wall+1),
            3 * (magnet_diam+wall+1),
            0
        ]) number(nums[row]);
    } else if (row >= 14) {
        translate([
            (row % 7) * (magnet_diam+wall+1),
            2 * (magnet_diam+wall+1),
            0
        ]) number(nums[row]);
    } else if (row >= 7) {
        translate([
            (row % 7) * (magnet_diam+wall+1),
            1 * (magnet_diam+wall+1),
            0
        ]) number(nums[row]);
    } else {
        translate([
            (row % 7) * (magnet_diam+wall+1),
            0 * (magnet_diam+wall+1),
            0
        ]) number(nums[row]);
    }
}