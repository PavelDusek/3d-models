tap_length = 30;
tap_width1 =  9;
tap_width2 = 11;
tap_height = 15;
$fn = 60;
iterations = 30;
module tap() {
    cylinder( d = tap_width1, h = tap_height );
}

//tap();

module Rack(m = 2, z = 10, x = 0, w = 20, clearance = 0)
{
  polygon(rack(m, z, x, w, clearance)); 
}

module gear2D(m = 1, z = 10, x = 0, w = 20, clearance = 0)
{
  	r_wk = m*z/2 + x; 
    U = m*z*PI; 
   	dy = m;  
  	r_fkc = r_wk + 2*dy *(1-clearance/2);  
  s = 360/iterations; 
  difference()
  {
    circle(r_fkc, $fn = 300);  // workpiece
    for(i=[0:s:360])
      rotate([0, 0, -i])
      translate([-i/360 * U, 0, 0])
      Rack(m, z, x, w, clearance);  // Tool
  }
}

linear_extrude(3) gear2D(m = 1, z = 15);


function rack(m = 2, z = 10, x = 0, w = 20, clearance = 0) = 
  let (dx = 2*tan(w)) 
  let (c = clearance/m) 
  let (o = dx/2-PI/4) 
  let (r = z/2 + x + 1) 
  let(X=[c, PI/2-dx-c, PI/2-c, PI-dx+c]) 
  let(Y=[r-c, r-c, r-2-c, r-2-c])
  m*concat([[-PI+o, r+5]], 
           [for(i=[-1:z], j=[0:3]) [o+i*PI+X[j], Y[j]]], 
           [[o+PI*(z+1)+c, r-c], [o+PI*(z+1)+c, r+5]]);