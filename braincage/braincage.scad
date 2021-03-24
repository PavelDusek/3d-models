$fn=50;

/*******
* CAGE *
********/
module capsule( radius, height, corner ) {
    translate([(-1)*radius, 0, corner/2]) {
        minkowski() {
            cylinder( d = radius, h = height-(2*corner) );
            translate([radius, 0, 0 ]) sphere( d = corner );
        }
    }    
}

module slit( width, height, depth, corner ) {
    translate([(-1.5)*(width)+corner/2, 0, corner/2]) {
        minkowski() {
            cube([width-corner, depth-corner, height-corner]);
            translate([width, 0, 0]) sphere( d = corner );
        }
    }
}

difference() {
    capsule( radius = 35, height = 80, corner = 10 );
    translate([0, 0, 2.5]) capsule( radius = 30, height=70, corner=5);
    translate([0, 0, -15]) cylinder(d = (2*35)/3, h = 100 );

    rotate([0, 0, (0*360)/5]) translate([0, 0, 10]) slit( width = (2*30)/3, height = 70-(2*10), depth = 50, corner = 10);

    rotate([0, 0, (1*360)/5]) translate([0, 0, 10]) slit( width = (2*30)/3, height = 70-(2*10), depth = 50, corner = 10);

    rotate([0, 0, (2*360)/5]) translate([0, 0, 10]) slit( width = (2*30)/3, height = 70-(2*10), depth = 50, corner = 10);

    rotate([0, 0, (3*360)/5]) translate([0, 0, 10]) slit( width = (2*30)/3, height = 70-(2*10), depth = 50, corner = 10);

    rotate([0, 0, (4*360)/5]) translate([0, 0, 10]) slit( width = (2*30)/3, height = 70-(2*10), depth = 50, corner = 10);

}

/*******
* TEXT *
********/
    rotate([0, 0, 0.69*360/5-0*(360/5)]) translate([21, 0, 55]) rotate([0, 90, 0]) linear_extrude(2) text("Všechno nejlepší", size=4);

    rotate([0, 0, 0.69*360/5-1*(360/5)]) translate([21, 0, 55]) rotate([0, 90, 0]) linear_extrude(2) text("k narozeninám", size=4);

    rotate([0, 0, 0.69*360/5-2*(360/5)]) translate([21, 0, 55]) rotate([0, 90, 0]) linear_extrude(2) text("Honzovi", size=4);

    rotate([0, 0, 0.69*360/5-3*(360/5)]) translate([21, 0, 55]) rotate([0, 90, 0]) linear_extrude(2) text("přeje", size=4);

    rotate([0, 0, 0.69*360/5-4*(360/5)]) translate([21, 0, 55]) rotate([0, 90, 0]) linear_extrude(2) text("Pavel", size=4);

/********
* BRAIN *
********/
//using
//brain from https://www.thingiverse.com/thing:2903048
//generated according to https://github.com/miykael/3dprintyourbrain

color([1, 0, 0]) translate([ 0, 0.5, 35]) scale([0.205, 0.205, 0.205]) import("brain.stl");
