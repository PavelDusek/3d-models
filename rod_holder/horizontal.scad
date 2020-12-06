//the base
c1 = 78.846;
c2 = 51.154;
v  = 61.508;
alfa = 37.958;
beta = 50.2512;

//slope
angle = 17; // slope angle, set to 21.8014; if you want sharp edge
d  = 10; //depth and width of the slope

//rod radius
r  = 12.5;

//screw
screw1 = 8; //width of the screw head
screw2 = 4; //width of the screw body
screwhead = 5; //height of the screw head
screwlength = 10; //length of the screw body

module triangleA() {
    color([1,0,0])
    difference() {
        cube( [ c1, v, d ] );
        rotate( [ 0, 0, alfa] ) translate([0, 0, -5]) cube( [ 120, 120, 30 ] );
    }
}
module triangelB() {
    color([1,0,0])
    difference() {
        cube( [ c2, v, d ] );
        rotate( [ 0, 0, beta ] ) translate( [ 0, 0, -5]) cube ([ 120, 120, 30 ] );
    }
}
module triangle() {
    translate( [ 0, 0, -d] ) triangleA();
    translate( [c1+c2, 0, 0] ) rotate( [0, 180, 0] ) triangelB();
}

module rod() {
    color([0,1,0])
    translate( [ 0, r, 0 ] ) cylinder( r = r, h = 100 );
}

module screw() {
    color( [0, 0, 1] ) {
        cylinder( d1 = screw1, d2 = screw2, h = screwhead);
        translate([0, 0, screwhead]) cylinder( d=screw2, h = screwlength);
    }
}

module slope() {
    difference() {
        cube ( [ 2*r, 0.75 * r, d] );
        rotate( [ 0, angle, 0] ) translate( [ -r, -r, d] ) cube ( [ 3*r, 2*r, d] );
        translate( [0.5*r, 0.75*0.5*r, 1.2*screwhead]) rotate([180, 0, 0] ) screw();
        translate( [0.5*r, 0.75*0.5*r, 1.2* screwhead] ) cylinder ( d=screw1, h=10);
    }
}

module horizontal_rod_holder() {
    difference() {
        cylinder( r = 1.75*r, h = d );
        translate( [ 0, 0, -1.5*d ] ) cylinder( r = r, h = 3*d );
        translate( [ 0, -3*r, -1.5*d ] ) cube( [ 100, 100, 3*d ] );
    }
    translate( [0, -1.75*r, 0]) slope();
    translate( [0, r, 0]) slope();
}

//triangle();
//translate( [ 0.9*c1, v/5, 0 ] ) rod();

/*
translate( [ 0.85*c1, v/2.5, 0] )
translate( [0.5*r, 0.75*0.5*r, 1.2*screwhead])
translate( [0.5*r, 0.75*0.5*r, 1.2*screwhead]) rotate([180, 0, 0] ) screw();
*/
translate( [ 0.85*c1, v/2.5, 0] ) horizontal_rod_holder();