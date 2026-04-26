box_length = 37;
box_width  = 15;
box_height = 62;
wall       =  2;
box_no     =  6;
box_series =  2;
$fn        = 60;


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

difference() {
    rounded_cube( box_no * (box_width + wall), box_series * (box_length + wall), 0.6 * box_height + wall, wall);
    
    for (series = [0: box_series-1]) {
        for (number = [0: box_no-1]) {
            translate([ wall+number*(box_width+wall), wall+series*(box_length+wall), wall ])
            cube([box_width, box_length, box_height]);
        }
    }
}