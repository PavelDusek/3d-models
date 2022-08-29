diameter  = 7;
connector = 5;
height    = 1.5;

plate_width     = 30;
plate_height    = 20;
plate_thickness =  1.5;
heart = 7;
$fn = 50;

translate([0, 0, 0.5*diameter+height+plate_thickness])
    sphere( d = diameter );
cylinder( d = connector, h = 1.5*height+plate_thickness );


//scale([plate_width/plate_height, 1, 1])
//cylinder( d = plate_height, h = plate_thickness );

translate([-0.595*plate_height, -0.595*plate_height, 0])
scale([plate_height/heart, plate_height/heart, 1])
linear_extrude(plate_thickness)
    text("♥");