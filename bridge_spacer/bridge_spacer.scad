space    =   9.0;
hole_pos = 125.0;
hole_rad =   7.5;
hole_y   =  24.0;
height   =  10.0;
thickness =  2.0;
$fn = 30;

module spacer() {
    cube( [hole_pos+2*hole_rad+thickness, space, height] );

    translate([-thickness, -hole_y-thickness, 0] )
    cube( [thickness, space+2*hole_y+2*thickness, height] );

    translate([-thickness, -hole_y-thickness, height] )
    cube( [hole_pos+2*hole_rad+2*thickness, space+2*hole_y+2*thickness, thickness] );
}

difference() {
    spacer();

    translate([hole_pos, -hole_y, 0 ])
    cylinder( r = thickness/2, h = 3*height );

    translate([hole_pos, space+hole_y, 0 ])
    cylinder( r = thickness/2, h = 3*height );

    
}

/*
//bridge spacer small
difference() {
    spacer();
    translate([2*hole_y, -3*hole_pos, -2*hole_pos])
    cube([5*hole_pos, 5*hole_pos, 5*hole_pos]);
}
*/