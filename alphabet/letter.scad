height   =  5;
corner   =  5;
depth    =  2;
side     = 20;
$fn      = 60;
textsize = 15;


module plate() {
    hull() {
        translate( [ 0 * side + corner, 0 * side + corner, 0] ) cylinder(h = height, r = corner);
        translate( [ 1 * side - corner, 0 * side + corner, 0] ) cylinder(h = height, r = corner);
        translate( [ 0 * side + corner, 1 * side - corner, 0] ) cylinder(h = height, r = corner);
        translate( [ 1 * side - corner, 1 * side - corner, 0] ) cylinder(h = height, r = corner);
    }
}

module letter( t ) {
    difference() {
        plate();
        translate([side/2, side/2, height-depth])
        linear_extrude(depth+1) text(t, size = textsize, halign = "center", valign = "center" );
    }
}

letters = [
    [0, 0, "A"],
    [1, 0, "Á"],
    [2, 0, "B"],
    [3, 0, "C"],
    [4, 0, "Č"],
    [5, 0, "D"],
    [6, 0, "Ď"],
    [7, 0, "E"],
    [8, 0, "É"],
    [9, 0, "Ě"],

    [0, 1, "F"],
    [1, 1, "G"],
    [2, 1, "H"],
    [3, 1, "I"],
    [4, 1, "Í"],
    [5, 1, "J"],
    [6, 1, "K"],
    [7, 1, "L"],
    [8, 1, "M"],
    [9, 1, "N"],

    [0, 2, "Ň"],
    [1, 2, "O"],
    [2, 2, "Ó"],
    [3, 2, "P"],
    [4, 2, "Q"],
    [5, 2, "R"],
    [6, 2, "Ř"],
    [7, 2, "S"],
    [8, 2, "Š"],
    [9, 2, "T"],

    [0, 3, "Ť"],
    [1, 3, "U"],
    [2, 3, "Ú"],
    [3, 3, "Ů"],
    [4, 3, "V"],
    [5, 3, "W"],
    [6, 3, "X"],
    [7, 3, "Y"],
    [8, 3, "Ý"],
    [9, 3, "Z"],

    [0, 4, "Ž"],
    [1, 4, "A"],
    [2, 4, "E"],
    [3, 4, "I"],
    [4, 4, "O"],
    [5, 4, "U"],
    [6, 4, "Y"],
    [7, 4, "A"],
    [8, 4, "E"],
    [9, 4, "I"],

    [0, 5, "0"],
    [1, 5, "1"],
    [2, 5, "2"],
    [3, 5, "3"],
    [4, 5, "4"],
    [5, 5, "5"],
    [6, 5, "6"],
    [7, 5, "7"],
    [8, 5, "8"],
    [9, 5, "9"],

    [0, 6, "0"],
    [1, 6, "1"],
    [2, 6, "2"],
    [3, 6, "3"],
    [4, 6, "4"],
    [5, 6, "5"],
    [6, 6, "6"],
    [7, 6, "7"],
    [8, 6, "8"],
    [9, 6, "9"],
];

for (a = letters) {
    translate( [a[0] * (side+1), a[1] * (side+1), 0]) letter(a[2]);
}
