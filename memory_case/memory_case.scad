wall =   3;
corner = 5;
space =  0.3;

case_width  = 55 + 2*wall;
case_length = 55 + 2*wall;
case_height = 35;
$fn =    30;


module rounded_cube( x, y, z, corner ) {
    hull() {
        translate([ 0*x+0.5*corner, 0*y+0.5*corner, 0*z+0.5*corner]) sphere(d=corner);
        translate([ 0*x+0.5*corner, 1*y-0.5*corner, 0*z+0.5*corner]) sphere(d=corner);
        translate([ 1*x-0.5*corner, 0*y+0.5*corner, 0*z+0.5*corner]) sphere(d=corner);
        translate([ 1*x-0.5*corner, 1*y-0.5*corner, 0*z+0.5*corner]) sphere(d=corner);

        translate([ 0*x+0.5*corner, 0*y+0.5*corner, 1*z+0.5*corner]) sphere(d=corner);
        translate([ 0*x+0.5*corner, 1*y-0.5*corner, 1*z+0.5*corner]) sphere(d=corner);
        translate([ 1*x-0.5*corner, 0*y+0.5*corner, 1*z+0.5*corner]) sphere(d=corner);
        translate([ 1*x-0.5*corner, 1*y-0.5*corner, 1*z+0.5*corner]) sphere(d=corner);

        
    }
}

module case() {
    difference() {
        rounded_cube(case_width, case_length, case_height, corner);
        translate([wall, wall, wall])
        rounded_cube(case_width-2*wall, case_length-2*wall, case_height+wall, corner);
    }
}

module lid() {
    difference() {
        rounded_cube(case_width+2*wall+space, case_length+2*wall+space, 0.25*case_height, corner);
        translate([wall, wall, wall])
        rounded_cube(case_width+space, case_length+space, 0.25*case_height+wall, corner);

        translate([case_width, 2*wall+space, -0.0001])
        mirror([1, 0, 0])
        linear_extrude( 3*wall ) text("Concentration", size = 6.5);
        //linear_extrude( 3*wall ) text("Pexeso", size = 12);
    }
}


//translate([wall+0.5*space, wall+0.5*space, wall])
translate([1.2*case_width, 0, 0])
case();
lid();
