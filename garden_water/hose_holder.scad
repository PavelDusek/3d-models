hose_diam = 15;
//barrel    = 22;
barrel    =  8;

difference() {
    //holder
    cube( [ 1.5*hose_diam, 0.3*hose_diam+barrel, 4*hose_diam ] );
    
    //hose
    translate([0.75*hose_diam, 2*hose_diam, 3.2*hose_diam]) rotate([ 90, 0, 0 ]) cylinder( d = 1.05*hose_diam, h = 3*hose_diam );

    //barrel
    translate([-hose_diam, 0.15*hose_diam, -1]) cube( [ 4*hose_diam, barrel, 2*hose_diam ] );

}
