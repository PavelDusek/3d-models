wall           =  1;
cross_width    = 210;
cross_height   = 262;
cross_crossing =  80;
cross_thick    =  32;

magnet_height1 =   4.5;
magnet_height2 =  12.5;
magnet_diam    =  10;
screw_diam     =   4;
nut_height     =   3.2;
nut_diam       =   8;
$fn            =  40;

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

module screw() {
    cylinder( d = screw_diam, h = screw_height );
}

module magnet() {
    cylinder( d = magnet_diam, h = magnet_height1+2 );
    translate([0, 0, magnet_height1]) screw();
}

module magnet_complet() {
    translate([0, 0, -1])
        magnet();
    translate([0, 0, magnet_height2-nut_height])
        nut(nut_radius, nut_height+1);
    translate([0, 0, magnet_height2])
        nut(nut_radius, nut_height+1);
}

module crossX_magnet() {
    difference() {
        union() {
            cube([cross_thick, cross_height, magnet_height1+wall+1]);
            translate([-0.5*(cross_width-cross_thick), cross_height-cross_crossing-cross_thick, 0])
            cube([cross_width, cross_thick, magnet_height1+wall+1]);
        }

        translate([0.5*cross_thick, 0.5*cross_thick, 0])
            magnet_complet();
        translate([0.5*cross_thick, cross_height - 0.5*cross_thick, 0])
            magnet_complet();
        translate([-0.5*(cross_width-cross_thick)+0.5*cross_thick, cross_height - cross_crossing - 0.5*cross_thick, 0])
            magnet_complet();
        translate([0.5*cross_width, cross_height - cross_crossing - 0.5*cross_thick, 0])
            magnet_complet();
    }
}

module crossX_cover() {
    difference() {
        union() {
            cube([cross_thick, cross_height, screw_height+wall+1]);
            translate([-0.5*(cross_width-cross_thick), cross_height-cross_crossing-cross_thick, 0])
            cube([cross_width, cross_thick, screw_height+wall+1]);
        }
        
        translate([0.5*cross_thick, 0.5*cross_thick, -1])
            nut(nut_radius, 2*nut_height+1);
        
        translate([0.5*cross_thick, cross_height - 0.5*cross_thick, -1])
            nut(nut_radius, 2*nut_height+1);
        
        translate([-0.5*(cross_width-cross_thick)+0.5*cross_thick, cross_height - cross_crossing - 0.5*cross_thick, -1])
            nut(nut_radius, 2*nut_height+1);
        
        translate([0.5*cross_width, cross_height - cross_crossing - 0.5*cross_thick, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}

//crossX_magnet();
crossX_cover();