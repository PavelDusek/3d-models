difference(){
color("white",1.0)
cylinder(h=10,r1=10.0,r2=10.0,center=false,$fn=31);

translate([0,0,-1])
cylinder(h=12,r1=5.0,r2=5.0,center=false,$fn=31);

translate([-40,-20,-1])
cube([40, 40, 12],center=false);

}
difference(){
color("white",1.0)
translate([0,5.0,0])
cube([5.0, 15.0, 10],center=false);

translate([6.0,15.0,5.0])
rotate([0,-90,0])
union(){
cylinder(h=5,r1=4.0,r2=2.0,center=false,$fn=31);

translate([0,0,5])
cylinder(h=10,r1=2.0,r2=2.0,center=false,$fn=31);

}
}
difference(){
color("white",1.0)
translate([0,-20,0])
cube([5.0, 15.0, 10],center=false);

translate([6.0,-15.0,5.0])
rotate([0,-90,0])
union(){
cylinder(h=5,r1=4.0,r2=2.0,center=false,$fn=31);

translate([0,0,5])
cylinder(h=10,r1=2.0,r2=2.0,center=false,$fn=31);

}
}
