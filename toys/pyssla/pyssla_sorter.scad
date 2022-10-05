d = 5; //pyssla diameter
h = 5; //pyssla height
n = 10; //no of pyssla in the sorter

module pyssla() {
    color([1, 0, 1])
    rotate([-90, 0, 0])
    cylinder(d = d, h = h);
}

module cover() {
    hull() {
        cube([d/4, d/4, 1.1*n*h]);
        translate([1.5*d, 0, 0])
        rotate([0, 15, 0])
        cube([d/4, d/4, 1.2*n*h]);
    }
}

module funnel() {
    cube([d/3, 1.7*d, 1.1*n*h]);
    
    translate([1.5*d, 0, 0])
    rotate([0, 15, 0])
    cube([d/3, 1.75*d, 1.2*n*h]);
    
    cover();
    translate([0, 1.5*d, 0])
    cover();
}

module tube() {    
    cube([d/3, 1.7*d, 1.1*n*h]);
    translate([1.5*d, 0, 0])
    cube([d/3, 1.7*d, 1.1*n*h]);
    cube([1.5*d, d/4, 1.1*n*h]);
    translate([0, 1.5*d, 0])
    cube([1.8*d, d/4, 1.1*n*h]);
}

module base() {
    cube([15*d, 1.7*d, d/3]);
}

module pusher() {
    cube([5*d, 1.2*d, d/3]);
    cube([0.3*d, 1.2*d, 0.75*d]);
    
    translate([2*d, -0.25*d, 0])
    cube([3*d, 1.7*d, d/3]);
}

/*
for (i = [0 : 1 : n] ) {
    translate([d, 0.25*d, 1.1*(i-0.25)*h]) pyssla();
}
*/

difference() {
    union() {
        translate([0, 0, n*h])
        funnel();
        tube();
        base();
    }
    translate([-d, 0.25*d, d/3]) cube([n*d, 1.25*d, 1.1*d]);
}

translate([2*d, 0.25*d, 0.4*d])
    pusher();