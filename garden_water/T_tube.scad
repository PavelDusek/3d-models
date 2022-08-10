hose_diameter = 13;

module T() {
    difference() {
        union() {    
            translate([0, 0, -4*hose_diameter])
            cylinder( d = hose_diameter, h = 8 * hose_diameter );
    
            rotate([0, 90,  0])
            cylinder( d = hose_diameter, h = 4 * hose_diameter );
        }
        translate([0, 0, -5*hose_diameter])
        cylinder( d = 0.75 * hose_diameter, h = 10 * hose_diameter );
    
        rotate([0, 90, 0])
        cylinder( d = 0.75 * hose_diameter, h = 5 * hose_diameter );
    }
}

translate([ 0, 0, 0*hose_diameter]) T();
//translate([ 0, 0, 4*hose_diameter]) T();
//translate([ 0, 0, 8*hose_diameter]) T();
//translate([ 0, 0,12*hose_diameter]) T();
//translate([ 0, 0,16*hose_diameter]) T();