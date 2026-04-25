outer_diameter = 183;
inner_diameter =  45;
wall           =   2;
height         =   6;
$fn            =  120;

difference() {
    cylinder(h = height, d = outer_diameter + 2*wall);
    
    translate([0, 0, wall])
    cylinder(h = height+1, d = outer_diameter);

    translate([0, 0, -1])
    cylinder(h = wall+4, d=inner_diameter);
}


