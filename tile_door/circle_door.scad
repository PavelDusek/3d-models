diameter = 100;
rim      =  10;
wall     =   2;
height   =  25;
$fn      =  60;


cylinder( d = diameter+rim, h = wall);
translate([0, 0, wall])
difference() {
    cylinder( d = diameter, h = height );
    translate([0, 0, wall])
    cylinder( d = diameter-wall, h = height);
}