gap         =   3.7;
board       =  19.0;
thickness   =   2.0;
height      =  60.0;
depth       =  20.0;
width       = 14*gap;
hook_height =  12.0;
hook_thick  =   4.0;
mono        =   6.2;

module text_plate( t = "Text", t_position) {
    cube([width, 0.25*height, thickness]);

    color([0, 1, 1])
    translate([t_position*width, 0.05*height, 0])
    linear_extrude(2*thickness)
    text(t, size = 0.15*width);
}

translate([0, 0.0*height, 0])
text_plate("Madlenka", 0.05);

translate([0, 0.3*height, 0])
text_plate("Cecilka", 0.17);

translate([0, 0.6*height, 0])
text_plate("Šárka", 0.25);

translate([0, 0.9*height, 0])
text_plate("Pavel", 0.25);