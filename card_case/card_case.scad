//// Empiric game:
//width  = 67;
//length = 92;
//height = 15;
//wall   =  1;
//slit   =  1;
//name   = "EmpiricGame";

// Recepty:
width  = 60;
length = 90;
height = 25;
wall   =  1;
slit   =  1;
name   = "Recepty";

module rounded_cube(width, length, height, corner) {
    hull() {
        translate([ 0*width+1*corner, 0*length+1*corner, 0*height+1*corner])
            sphere( r = corner );

        translate([ 1*width-0*corner, 0*length+1*corner, 0*height+1*corner ])
            sphere( r = corner );

        translate([ 0*width+1*corner, 1*length-0*corner, 0*height+1*corner ])
            sphere( r = corner );

        translate([ 1*width-0*corner, 1*length-0*corner, 0*height+1*corner ])
            sphere( r = corner );

        translate([ 0*width+1*corner, 0*length+1*corner, 1*height-0*corner ])
            sphere( r = corner );

        translate([ 1*width-0*corner, 0*length+1*corner, 1*height-0*corner ])
            sphere( r = corner );

        translate([ 0*width+1*corner, 1*length-0*corner, 1*height-0*corner ])
            sphere( r = corner );

        translate([ 1*width-0*corner, 1*length-0*corner, 1*height-0*corner ])
            sphere( r = corner );
    }
}


module case() {
    difference() {
        rounded_cube(
            width+2*wall,
            length+2*wall,
            height+wall,
            wall
        );
        
        translate([wall, wall, wall])
        cube([width, length, height+1]);
    }
}

module lid() {
    difference() {
        rounded_cube(
            width+4*wall+slit,
            length+4*wall+slit,
            0.4*height+wall,
            wall
        );
        
        translate([wall+0.5*slit, wall+0.5*slit, wall])
        cube([ width+2*wall+slit, length+2*wall+slit, 0.4*height+wall+1]);
    
        linear_extrude(3*wall)
        translate([3*wall, 20*wall,-1])
        rotate([180, 0, 0])
        text(name, size=8);
            
    }
}

translate([ width+8*wall, 0, 0])
case();
lid();