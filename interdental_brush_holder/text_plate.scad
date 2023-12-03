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

text_plate("text", 0.36);
