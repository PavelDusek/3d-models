phi = (1 + sqrt(5))/2;

points = [
    [ 2,  0,  0],
    [-2,  0,  0],
    [ 0,  2,  0],
    [ 0, -2,  0],
    [ 0,  0,  2],
    [ 0,  0, -2],

    [ phi,  1/phi,  1],
    [ phi,  1/phi,  1],
    [ phi,  1/phi, -1],
    [ phi, -1/phi,  1],
    [ phi, -1/phi, -1],
    [-phi,  1/phi,  1],
    [-phi,  1/phi, -1],
    [-phi, -1/phi,  1],
    [-phi, -1/phi, -1],

    [ 1,  phi,  1/phi],
    [ 1,  phi, -1/phi],
    [ 1, -phi,  1/phi],
    [ 1, -phi, -1/phi],
    [-1,  phi,  1/phi],
    [-1,  phi, -1/phi],
    [-1, -phi,  1/phi],
    [-1, -phi, -1/phi],
    
    [ 1/phi,  1,  phi],
    [ 1/phi,  1, -phi],
    [ 1/phi, -1,  phi],
    [ 1/phi, -1, -phi],
    [-1/phi,  1,  phi],
    [-1/phi,  1, -phi],
    [-1/phi, -1,  phi],
    [-1/phi, -1, -phi],

];

hull() {
    for (point = points) {
        translate( point ) sphere(0.1);
    }
}