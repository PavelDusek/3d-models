case_diameter   = 10;
case_height     =  4.3;
//case_height     =  5;

/*
//big magnet
magnet_diameter =  8.3;
magnet_height   =  3.3;
text_size       =  5;
*/

//medium magnet
magnet_diameter =  5.2;
//magnet_height   =  3.2;
magnet_height   =  3.9;
text_size       =  5;

/*
//small magnet
magnet_diameter =  3.3;
magnet_height   =  2.3;
text_size       =  5;
*/

$fn = 50;

module magnet() {    
    cylinder( d = magnet_diameter, h = magnet_height );
}

module magnet_case() {
    difference() {
        cylinder( d = case_diameter, h = case_height );
        translate([0, 0, -1]) cylinder( d = magnet_diameter, h = magnet_height + 1 );
    }
}

module magnet_text(mtext) {
    linear_extrude((1/2)*text_size) text(mtext, size=text_size);
}

color([1, 0, 0]) magnet_case();
//color([1, 1, 0]) translate([(-1/2)*text_size, (-1/2)*text_size, case_height] ) magnet_text("S");