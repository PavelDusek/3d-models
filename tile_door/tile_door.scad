width  = 120;
height = 130;
hole_w =  54;
hole_h =  54;
hole_x =  10;
hole_y =  0.5 * (height - hole_h);
corner =  10;
inner  =  20;
depth  =   2;
left   =  33;
bottom =  28;
top    =  48;
right  =   8;

module rounded_hole() {
    //translate([ -0.5*hole_w, -0.5*hole_h, -depth ] )
    translate([ 0, 0, -2*depth ] )
        hull() {
            translate([ 0*hole_w+0.5*corner, 0*hole_h+0.5*corner, 0])
                cylinder( d = corner, h = 6*depth );
        
            translate([ 0*hole_w+0.5*corner, 1*hole_h-0.5*corner, 0])
                cylinder( d = corner, h = 6*depth );
        
            translate([ 1*hole_w-0.5*corner, 1*hole_h-0.5*corner, 0])
                cylinder( d = corner, h = 6*depth );
        
            translate([ 1*hole_w-0.5*corner, 0*hole_h+0.5*corner, 0])
                cylinder( d = corner, h = 6*depth );
        }
}

module hole_walls() {
    //translate([ -0.5*hole_w, -0.5*hole_h, 0 ] ) {
    translate([ 0, 0, 0 ] ) {
            translate([ 0*hole_w - depth, 0*hole_h, 0])
                cube( [ depth, hole_h, inner ] );
    
            translate([ 0*hole_w, 0*hole_h - depth, 0])
                cube( [ hole_w, depth, inner ] );
        
            translate([ 1*hole_w, 0*hole_h, 0])
                cube( [ depth, hole_h, inner ] );
        
            translate([ 0*hole_w, 1*hole_h, 0])
                cube( [ hole_w, depth, inner ] );
    }
}

module tile_walls() {
    color( [0, 1, 0] )
    translate([ 0*width-0*depth, 0*height-0*depth, depth])
        cube( [ width, depth, inner ] );
    
    color( [1, 0, 0] )
    translate([ 0*width-0*depth, 1*height-1*depth, depth])
        cube( [ width, depth, inner ] );
    
    color( [0, 1, 1] )
    translate([ 1*width-1*depth, 0*height-0*depth, depth])
        cube( [ depth, height, inner ] );
    
    color( [0, 1, 1] )
    translate([ 1*width-1*depth, 0*height-0*depth, depth])
        cube( [ depth, height, inner ] );
    
    color( [1, 0, 1] )
    translate([ 0*width-0*depth, 0*height-0*depth, depth])
        cube( [ depth, height, inner ] );
}

module tile_margins() {
    translate( [ -left, -top, -depth ] )
    cube( [width + left + right, height + top + bottom, depth ] );
}

color( [0, 0, 1] )
difference() {
    union() {
        cube( [ width, height, depth ] );
        tile_margins();
    }
    translate([hole_x, hole_y, 0 ] )
        rounded_hole();
}
translate([hole_x, hole_y, 0 ] )
    hole_walls();
tile_walls();
