thickness  =   3;
length     = 207;
width      =  85;
connection =   3;
hook       =  25;

translate([-50, 40, 0]) cube([ connection, length-40, thickness  ]);
translate([-50-25, 40, 0]) cube([25, 40, thickness]);
translate([-width, length-width, 0]) cube([width, width, thickness]);

//hook
translate([-width, length, -hook+connection]) cube([width, connection, hook]);
translate([0, length-width, -hook+connection]) cube([connection, width, hook]);