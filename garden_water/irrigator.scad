translate([-26,0,193.5])
color("blue",1.0)
rotate([0,90,0])
difference(){
cylinder(h=52,r1=6.5,r2=6.5,center=false,$fn=31);

translate([0,0,-13])
cylinder(h=78,r1=4.875,r2=4.875,center=false,$fn=31);

translate([0,0,26])
rotate([0,90,0])
cylinder(h=13,r1=0.5,r2=0.5,center=false,$fn=31);

}
difference(){
translate([-13,0,0])
color("green",1.0)
cube([26, 13, 200],center=false);

rotate([0,3.7189939731580433,0])
translate([0,-1,0])
color("red",1.0)
cube([13, 39, 200],center=false);

rotate([0,-3.7189939731580433,0])
translate([-13,-1,0])
color("yellow",1.0)
cube([13, 39, 200],center=false);

color("green",1.0)
translate([-26,0,193.5])
rotate([0,90,0])
cylinder(h=52,r1=6.5,r2=6.5,center=false,$fn=31);

translate([0,0,200])
rotate([180,0,0])
cylinder(h=398.7,r1=9.75,r2=0,center=false,$fn=31);

}
translate([0,6.5,200])
rotate([180,0,0])
cylinder(h=200,r1=4.875,r2=0,center=false,$fn=31);

