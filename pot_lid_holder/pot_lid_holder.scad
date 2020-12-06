module triangle() {
    //side parts
    difference() {
        cube([60, 30, 10]);
        translate([0,0,-15])
            rotate([0,0,45])
                cube([60, 30, 30]);
        translate([45,30,-15])
            rotate([0,0,-60])
                cube([60, 30, 30]);
        }
}

module poklicka() {
    //side parts with bottom and holes
    difference() {
        union() {
            cube([60, 30, 5]);
            translate([0, 10,  0]) rotate([90, 0, 0] ) triangle();
            translate([0, 30, 0]) rotate([90, 0, 0] ) triangle();
        }
        translate([40, 5, 20]) rotate([-90, 0, 0]) cylinder( h=50, d=10, center=false, $fn=30);
        translate([10, 15, -10]) cylinder( h=20, d=3, center=false, $fn=30);
        
        //bottom holes
        translate([50, 15, -10]) cylinder( h=20, d=3, center=false, $fn=30);
        translate([10, 15, 3]) cylinder( h=20, d=7, center=false, $fn=30);
        translate([50, 15, 3]) cylinder( h=20, d=7, center=false, $fn=30);
    }
}

poklicka();
translate([0, 100, 0] ) mirror([0, 1, 0]) poklicka();