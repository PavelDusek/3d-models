vnitrni_prumer = 29;
vnejsi_prumer  = 39;
tloustka       =  4;
vyska          = 65;
delka_tyce     = 50;
sirka_ramene   = 40;

module uchytka() {
    difference() {
        cube([sirka_ramene, 0.2*sirka_ramene, 3*tloustka]);
        translate( [ (1/3)*sirka_ramene, 0.3*sirka_ramene, 1.5*tloustka ] )
            rotate( [90, 0, 0] )
                cylinder( d=1.5*tloustka, h=0.4*sirka_ramene);

        translate( [ (2/3)*sirka_ramene, 0.3*sirka_ramene, 1.5*tloustka ] )
            rotate( [90, 0, 0] )
                cylinder( d=1.5*tloustka, h=0.4*sirka_ramene);
    }
}

module zakladna() {
    translate( [0, -20, 0] ) cube([ 2*(sirka_ramene), sirka_ramene, tloustka ] );
    translate( [-2*sirka_ramene, -20, 0] ) cube([ 2*(sirka_ramene), sirka_ramene, tloustka ] );

    translate( [-80, -20, 0] ) cube([ sirka_ramene, 108, tloustka ] );
    translate( [-80, -88, 0] ) cube([ sirka_ramene, 108, tloustka ] );
    translate( [sirka_ramene, -20, 0]  ) cube([ sirka_ramene, 108, tloustka ] );
    translate( [sirka_ramene, -88, 0]  ) cube([ sirka_ramene, 108, tloustka ] );
}

module nasada_na_tyc() {
    translate([ 0, 0, -(vyska - tloustka) ] ) {
        difference() {
            union() {
                difference() {
                    cylinder( d = vnejsi_prumer, h = vyska );
                    translate( [0, 0, -1] ) cylinder( d = vnitrni_prumer, h = delka_tyce );
                }
            }
            translate( [500, 0, 20] ) rotate([0, -90, 0] ) cylinder( d=6, h=1000);
        }
    }
}

nasada_na_tyc();
zakladna();
translate([sirka_ramene, 2*sirka_ramene, -3*tloustka]) uchytka();
translate([sirka_ramene, -2*sirka_ramene-2*tloustka, -3*tloustka]) uchytka();
translate([- 2*sirka_ramene, 2*sirka_ramene, -3*tloustka]) uchytka();
translate([- 2*sirka_ramene, -2*sirka_ramene-2*tloustka, -3*tloustka]) uchytka();