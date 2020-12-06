r1 = 3.5; //radius of the circle
r2 = 20;  //radius of the axis of revolution


rotate_extrude( angle = 360, $fn=100 ) {
  translate([ r2, 0, 0]) rotate([0, 0, 90]) circle( r1, $fn=100 );
}
