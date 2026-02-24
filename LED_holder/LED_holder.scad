thickness = 3;
width = 10;
length = 73;
height = 28;
offset = 33;

color([0, 0, 1])
cube([length, width, thickness]);

color([0, 1, 0])
translate([length, 0, -height-thickness])
cube([thickness, width, height+2*thickness]);

color([1, 0, 0])
translate([0, 0, -height])
cube([thickness, width, height]);

translate([length-offset, 0, -height-thickness])
cube([offset, width, thickness]);