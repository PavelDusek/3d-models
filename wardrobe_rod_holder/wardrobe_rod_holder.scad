module rod() {
    hull() {
        cylinder( r=9.5, h=10 );
        translate([17, 0, 0]) cylinder( r=9.5, h= 10);
    }
}

module holder() {
    translate([-0.5*19, 60-(0.5*20), 0]) 
    hull() {
        cylinder( r=10, h=10 );
        translate([19, 0, 0]) cylinder( r=10, h=10 ); 
    }
    translate([-0.5*39, 0, 0]) cube([39, 50, 1]);
    
    hull() {
        translate([-0.5*63, 0, 0]) cylinder( r=12, h=1);
        translate([0.5*63, 0, 0])  cylinder( r=12, h=1);
    }
}

difference() {
    color([0, 1, 0]) holder();
    color([1, 0, 0]) translate([-0.5*17, 60-(0.5*19)-0.75, 1]) rod();
    
    translate([-0.5*63, 0, -1]) cylinder( d=4, h=3);
    translate([0.5*63, 0, -1])  cylinder( d=4, h=3);
}