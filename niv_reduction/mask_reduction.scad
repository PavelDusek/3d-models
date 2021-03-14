$fn=100;
difference() {
    cylinder( d=31.1, h=13);
    translate([0, 0, -1])
    cylinder( d=22.3, h=42 );
}

difference() {
    cylinder( d=25.3, h=30 );
    translate([0, 0, -1])
    cylinder( d=22.3, h=42 );
}