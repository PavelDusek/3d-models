scale_factor = 10;
a = scale_factor * (1 + 1/sqrt(5));
b = scale_factor * 1;

polyhedron(
  points=[
    //base points
    [+0.5*a, +0.0*b, 0.0*a], //0
    [-0.0*a, -0.5*b, 0.0*a], //1
    [-0.5*a, +0.0*b, 0.0*a], //2
    [+0.0*a, +0.5*b, 0.0*a], //3
    
    //top points
    [+0.5*a, +0.0*b, 1.0*a], //4
    [-0.0*a, -0.5*b, 1.0*a], //5
    [-0.5*a, +0.0*b, 1.0*a], //6
    [+0.0*a, +0.5*b, 1.0*a], //7
    
    //middle points
    [+0.5*a, -0.5*b, 0.5*a], //8
    [+0.0*a, -1.0*b, 0.5*a], //9
    [-0.5*a, -0.5*b, 0.5*a], //10
    [-0.5*a, +0.5*b, 0.5*a], //11
    [+0.0*a, +1.0*b, 0.5*a], //12
    [+0.5*a, +0.5*b, 0.5*a] //13
  ],
  faces=[
    [0,1,2,3], //base
    [4,5,6,7], //top
    [0,8,4,13], //front
    [2,10,6,11], //back

    [0,8,9,1], //right front lower
    [1,9,10,2], //right back lower
    [2,3,12,11], //left back lower
    [3,0,13,12], //left front lower

    [4,8,9,5], //right front upper
    [5,9,10,6], //right back upper
    [6,7,12,11], //left back upper
    [7,4,13,12], //left front upper
    
  ]
 );