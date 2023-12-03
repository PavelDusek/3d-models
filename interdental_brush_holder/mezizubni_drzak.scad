gap         =   3.7;
board       =  19.0;
thickness   =   2.0;
height      =  60.0;
depth       =  20.0;
width       = 14*gap;
hook_height =  12.0;
hook_thick  =   4.0;
mono        =   6.2;

//attachement to the board
translate([0, -board-2*thickness, 0])
difference() {
    cube([ width, board + 2* thickness, depth ]);

    translate([-thickness, thickness, thickness])
    cube([width + 2*thickness, board, depth ] );
}

//body
cube([ width, height, thickness]);

//text plate holder
color([1,1,1])
translate([0,0.25*height-thickness, thickness])
cube([width, thickness, thickness]);
color([1,1,1])
translate([0,0.5*height, thickness])
cube([width, thickness, thickness]);

//hanger for interdental brushes
difference() {
    union() {
        for (angle = [0:0.1:10]) {
            rotate([angle, 0, 0])
            translate([0, height, 0])
            cube([ width, hook_thick, 0.1*hook_height]);
        }
    }
    
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
