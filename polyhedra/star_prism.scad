a = 360/8;
size      = 100;
thickness =   4;


for (i = [0:7]) {
    rotate([0, 0, i*a])
    translate([-0.5*size, -0.5*size, 0])
    cube([size, thickness, size]);
}