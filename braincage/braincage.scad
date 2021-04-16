$fn=50;
cagediameter = 70;
cageheight = 120;
cagecorner = 10;
cageslit   = 37;
cagewall   = 5;

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
    capsule(radius = cagediameter, height = cageheight, corner = cagecorner);
    translate([0, 0, cagewall/2]) capsule( radius = (cagediameter-cagewall), height= (cageheight - 2*cagewall), corner= cagecorner/2);
    translate([0, 0, -cageheight]) cylinder(d = (2*cagediameter)/3, h = 3*cageheight );

    rotate([0, 0, (0*360)/5]) translate([0, 0, 2*cagewall]) slit( width = cageslit, height = cageheight-(6*cagewall), depth = 2*cagediameter-4*cagewall, corner = cagecorner);

    rotate([0, 0, (1*360)/5]) translate([0, 0, 2*cagewall]) slit( width = cageslit, height = cageheight-(6*cagewall), depth = 2*cagediameter-4*cagewall, corner = cagecorner);

    rotate([0, 0, (2*360)/5]) translate([0, 0, 2*cagewall]) slit( width = cageslit, height = cageheight-(6*cagewall), depth = 2*cagediameter-4*cagewall, corner = cagecorner);

    rotate([0, 0, (3*360)/5]) translate([0, 0, 2*cagewall]) slit( width = cageslit, height = cageheight-(6*cagewall), depth = 2*cagediameter-4*cagewall, corner = cagecorner);

    rotate([0, 0, (4*360)/5]) translate([0, 0, 2*cagewall]) slit( width = cageslit, height = cageheight-(6*cagewall), depth = 2*cagediameter-4*cagewall, corner = cagecorner);

}

/*******
* TEXT *
********/
    rotate([0, 0, 0.69*360/5-0*(360/5)]) translate([0.549*cagediameter, 0, 0.75*cageheight]) rotate([0, 90, 0]) linear_extrude(cagewall/2) text("Všechno nejlepší", size=cagewall);

    rotate([0, 0, 0.69*360/5-1*(360/5)]) translate([0.549*cagediameter, 0, 0.75*cageheight]) rotate([0, 90, 0]) linear_extrude(cagewall/2) text("k narozeninám", size=cagewall);

    rotate([0, 0, 0.69*360/5-2*(360/5)]) translate([0.549*cagediameter, 0, 0.75*cageheight]) rotate([0, 90, 0]) linear_extrude(cagewall/2) text("Honzovi", size=cagewall);

    rotate([0, 0, 0.69*360/5-3*(360/5)]) translate([0.549*cagediameter, 0, 0.75*cageheight]) rotate([0, 90, 0]) linear_extrude(cagewall/2) text("přeje", size=cagewall);

    rotate([0, 0, 0.69*360/5-4*(360/5)]) translate([0.549*cagediameter, 0, 0.75*cageheight]) rotate([0, 90, 0]) linear_extrude(cagewall/2) text("Pavel", size=cagewall);

/********
* BRAIN *
********/
//using
//brain from https://www.thingiverse.com/thing:2903048
//generated according to https://github.com/miykael/3dprintyourbrain

//color([1, 0, 0]) translate([ 0, 0.5, 35]) scale([0.4, 0.4, 0.4]) rotate([-90, 0, 0]) import("brain.stl");
