small_diameter  = 23.00;
small_thickness =  1.85;
large_diameter  = 24.50;
large_thickness =  2.55;

module coin(diameter, thickness) {
    translate([0.175*diameter, 0.175*diameter, 0])
    difference() {
        cylinder( d = diameter, h = thickness );
        
        translate([0, 0, 0.8*thickness])
        cylinder( d = 0.9*diameter, h = 0.2*thickness+1 );
    }
}

translate([0.0*small_diameter, 0.0*small_diameter, 0])
difference() {
    coin(small_diameter, small_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("1");
}

translate([1.1*small_diameter, 0.0*small_diameter, 0])
difference() {
    coin(small_diameter, small_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("2");
}

translate([2.2*small_diameter, 0.0*small_diameter, 0])
difference() {
    coin(small_diameter, small_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("3");
}

translate([3.3*small_diameter, 0.0*small_diameter, 0])
difference() {
    coin(small_diameter, small_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("4");
}

translate([4.4*small_diameter, 0.0*small_diameter, 0])
difference() {
    coin(small_diameter, small_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("5");
}


translate([4.4*small_diameter, 0.0*small_diameter, 0])
difference() {
    coin(small_diameter, small_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("5");
}



translate([0.0*small_diameter, 1.1*small_diameter, 0])
difference() {
    coin(large_diameter, large_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("6");
}

translate([1.1*small_diameter, 1.1*small_diameter, 0])
difference() {
    coin(large_diameter, large_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("7");
}

translate([2.2*small_diameter, 1.1*small_diameter, 0])
difference() {
    coin(large_diameter, large_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("8");
}

translate([3.3*small_diameter, 1.1*small_diameter, 0])
difference() {
    coin(large_diameter, large_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("9");
}

translate([4.4*small_diameter, 1.1*small_diameter, 0])
difference() {
    coin(large_diameter, large_thickness);
    translate([-0.12*large_diameter, 0, -1])
    linear_extrude(2*large_thickness+1) text("10");
}


translate([0.0*small_diameter, 2.2*small_diameter, 0])
difference() {
    coin(small_diameter, small_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("♥");
}

translate([1.1*small_diameter, 2.2*small_diameter, 0])
difference() {
    coin(small_diameter, small_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("♠");
}

translate([2.2*small_diameter, 2.2*small_diameter, 0])
difference() {
    coin(small_diameter, small_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("♣");
}

translate([3.3*small_diameter, 2.2*small_diameter, 0])
difference() {
    coin(small_diameter, small_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("♦");
}


translate([4.4*small_diameter, 2.2*small_diameter, 0])
difference() {
    coin(small_diameter, small_thickness);
    translate([0, 0, -1])
    linear_extrude(2*large_thickness+1) text("≈");
}