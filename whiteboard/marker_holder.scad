thickness =  3;
width     = 20;
marker1   = 25;
marker2   = 12;
marker_l  = 45;

module marker1() {
    cylinder(d = marker1, h = marker_l);
}

module marker2() {
    cylinder(d = marker2, h = marker_l);
}

module holder() {
        difference() {
        cube( [ 5 * marker1 + 4.5 * marker2, 1.2 * marker1, width ] );

        translate([ (1.1-0.3) * marker2 + 4.7*marker1, 0.85*marker1, -1]) marker2();
        translate([ (2.2-0.3) * marker2 + 4.7*marker1, 0.85*marker1, -1]) marker2();
        translate([ (3.3-0.3) * marker2 + 4.7*marker1, 0.85*marker1, -1]) marker2();
        translate([ (4.4-0.3) * marker2 + 4.7*marker1, 0.85*marker1, -1]) marker2();
    
        translate([ (1.1-0.3) * marker1, 0.6*marker1, -1]) marker1();
        translate([ (2.2-0.3) * marker1, 0.6*marker1, -1]) marker1();
        translate([ (3.3-0.3) * marker1, 0.6*marker1, -1]) marker1();
        translate([ (4.4-0.3) * marker1, 0.6*marker1, -1]) marker1();
    }
}

module hanger() {
    difference() {
        cube( [ 5*marker1, width, 3*thickness ] );
        translate([ marker1, -width, thickness ]) cube( [ 4*marker1+1, 3*width, thickness ] );
    }
}
module connection() {
    cube([ 5*marker1, 0.1*marker1, width+1.2*marker_l]);
}

holder();
translate([ 0, 0, width+1.2*marker_l ]) hanger();
connection();