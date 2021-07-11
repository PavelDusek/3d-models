screw        =   4;
screw_margin =   5;
base         =  41;
wall         =  10;
large_rod    =  30;
small_rod    =  20;
slit         =   5;
height       = 320;

module platform() {
    difference() {
        cube([base, base, wall]);
        translate([0*base+1*screw_margin, 0*base+1*screw_margin, -wall]) cylinder(d = screw, h = 3*wall);
        translate([0*base+1*screw_margin, 1*base-1*screw_margin, -wall]) cylinder(d = screw, h = 3*wall);
        translate([1*base-1*screw_margin, 0*base+1*screw_margin, -wall]) cylinder(d = screw, h = 3*wall);
        translate([1*base-1*screw_margin, 1*base-1*screw_margin, -wall]) cylinder(d = screw, h = 3*wall);
    }
}

module side_bar() {
    cube([0.5*(base-slit), wall, height]);
}
module side_bar_connection() {
    cube([ base, wall, wall ]);
}

module rod(rod_width) {
    translate([-5*large_rod, 0, 0]) rotate([0, 90, 0])
    cylinder(d = rod_width, h = 10*large_rod);
}

module rod_holder(rod_width = large_rod, holder_width = base) {
    translate([0, 0, -0.5*base])
    difference() {
        translate([-0.5*holder_width, -0.5*base, 0]) cube([holder_width, base, base]);
        translate([-1.5*base, -0.125*base, -base]) cube([3*base, 0.25*base, 3*base]); 
        translate([0, 0, 0.5*base]) rod(rod_width);
    }
}

translate([-0.5*base, -0.5*base, 0]) platform();

translate([-0.0*base+0.5*slit, +0.5*base-0*wall, 0]) side_bar();
translate([-0.5*base-0.0*slit, +0.5*base-0*wall, 0]) side_bar();
translate([-0.0*base+0.5*slit, -0.5*base-1*wall, 0]) side_bar();
translate([-0.5*base-0.0*slit, -0.5*base-1*wall, 0]) side_bar();

translate([-0.5*base, 0.5*base-0*wall, height-wall]) side_bar_connection();
translate([-0.5*base, -0.5*base-1*wall, height-wall]) side_bar_connection();

//full width rod holders:
color([0.5, 0, 0]) translate([0, 0, 0.11*height]) rod_holder(rod_width = large_rod, holder_width = base);
color([1.0, 0, 0]) translate([0, 0, 0.11*height]) rod(rod_width = large_rod);

color([0, 0.5, 0]) translate([0, 0, 0.25*height]) rod_holder(rod_width = small_rod, holder_width = base);
color([0, 1.0, 0]) translate([0, 0, 0.25*height]) rod(rod_width = small_rod);

color([0, 0, 0.5]) translate([0, 0, 0.40*height]) rod_holder(rod_width = 25, holder_width = base);
color([0, 0, 1.0]) translate([0, 0, 0.40*height]) rod(rod_width = 25);

color([0, 0, 0.5]) translate([0, 0, 0.40*height]) rod_holder(rod_width = 25, holder_width = base);
color([0, 0, 1.0]) translate([0, 0, 0.40*height]) rod(rod_width = 25);

////half width rod holders
color([0.5, 0, 0.5]) translate([0, 0, 0.54*height]) rod_holder(rod_width = large_rod, holder_width = 0.5*base);
color([1.0, 0, 1.0]) translate([0, 0, 0.54*height]) rod(rod_width = large_rod);

color([0, 0.5, 0.5]) translate([0, 0, 0.68*height]) rod_holder(rod_width = small_rod, holder_width = 0.5*base);
color([0, 1.0, 1.0]) translate([0, 0, 0.68*height]) rod(rod_width = small_rod);

color([0.75, 0.75, 0.5]) translate([0, 0, 0.82*height]) rod_holder(rod_width = 25, holder_width = 0.5*base);
color([1.00, 1.00, 1.00]) translate([0, 0, 0.82*height]) rod(rod_width = 25);