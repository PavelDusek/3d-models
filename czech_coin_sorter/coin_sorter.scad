koeficient = 1.05;
vyska      = 2;
mezera     = 5;

mince1  = 20.0 * koeficient;
mince2  = 21.5 * koeficient;
mince5  = 23.0 * koeficient;
mince10 = 24.5 * koeficient;
mince20 = 26.0 * koeficient;
mince50 = 27.5 * koeficient;

module mince(diameter) {
    cylinder(d = diameter, h = 3*vyska);
}

module zakladna() {
    cube([
        mince1+mince2+mince5+mince10+mince20+mince50+8*mezera,
        mince50,
        vyska]);
    translate([0, -vyska,0])
    cube([
        mince1+mince2+mince5+mince10+mince20+mince50+8*mezera,
        vyska,
        5*vyska]);
        translate([0, -vyska,0])
    translate([0, mince50+vyska,0])
    cube([
        mince1+mince2+mince5+mince10+mince20+mince50+8*mezera,
        vyska,
        5*vyska]);
    translate([-vyska, -vyska, 0])
    cube([
        vyska,
        mince50+2*vyska,
        5*vyska]);

}

difference() {
zakladna();
translate([0.5*mince1+mince2+mince5+mince10+mince20+mince50+5*mezera, 0.5*mince1, -vyska])
    mince(mince1);
translate([0.5*mince2+mince5+mince10+mince20+mince50+4*mezera, 0.5*mince2, -vyska])
    mince(mince2);
translate([0.5*mince5+mince10+mince20+mince50+3*mezera, 0.5*mince5, -vyska])
    mince(mince5);
translate([0.5*mince10+mince20+mince50+2*mezera, 0.5*mince10, -vyska])
    mince(mince10);
translate([0.5*mince20+mince50+1*mezera, 0.5*mince20, -vyska])
    mince(mince20);
translate([0.5*mince50, 0.5*mince50, -vyska])
    mince(mince50);
}