ring_outer   =  4.20;
ring_inner   =  3.00;
ring_height  =  5.00;
peg_distance =  4.75;
peg_diam     =  2.00;
peg_height   =  2.50;
width        =  5;
length       = 10;

//square
//width        = 30;
//length       = 30;
// circle 9x58

module ring() {
    difference() {
        cylinder( d = ring_outer, h = ring_height, $fn = 30 );
        translate([0, 0, -1])
        cylinder( d = ring_inner, h = ring_height+2, $fn = 30 );
    }
}

module peg() {
    cylinder( d = peg_diam, h = peg_height, $fn = 30);
}
module board() {
    cube([ peg_distance*(length+1), peg_distance*(width+1), 0.25*peg_height ]);
}

//ring();
translate([-peg_distance, -peg_distance, -0.25*peg_height])
    board();

for ( row_index = [0:length-1] ) {
    for ( col_index = [0:width-1] ) {
        translate( [row_index*peg_distance, col_index*peg_distance, 0] )
            color([1, 0, 0]) peg();
    }
}