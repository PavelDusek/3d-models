gap         =   3.7;
board       =  19.0;
thickness   =   2.0;
height      =  60.0;
depth       =  20.0;
width       = 14*gap;
hook_height =  12.0;
hook_thick  =   4.0;
mono        =   6.2;

cube([ width, height, thickness]);

translate([0.82*width, 0.5*height, 0])
linear_extrude(2*thickness)
rotate([0,0,180])
text("Text1", size = 0.15*width);

translate([0.75*width, 0.5*height, 0])
linear_extrude(2*thickness)
rotate([0,0,180])
text("Text2", size = 0.15*width);

translate([0.75*width, 0.5*height, 0])
linear_extrude(2*thickness)
rotate([0,0,180])
text("Text3", size = 0.15*width);

translate([0.95*width, 0.5*height, 0])
linear_extrude(2*thickness)
rotate([0,0,180])
text("Text4", size = 0.15*width);

//hanger for interdental brushes
difference() {
    translate([0, height, 0])
    cube([ width, hook_thick, hook_height]);

    
    //interdental
    for (i = [0:1:5]) {
        color([1, 0, 1])
        translate([(2*i+2)*gap, height-hook_thick, thickness])
        cube([gap, 3*hook_thick, hook_height]);
    }
    
    //mono brush
    color([0, 0, 1])
    translate([3*gap-mono, height-hook_thick, thickness])
    cube([mono, 3*hook_thick, hook_height]);    

}
