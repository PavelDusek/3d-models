wall   =  3;
diam   = 60;
inner  = 40;
height = 15;

cylinder( d = diam, h = wall );

translate( [ 0, 0, wall ] )
difference() {
    cylinder( d = inner, h = height );
    cylinder( d = inner-wall, h = height+1 );
}