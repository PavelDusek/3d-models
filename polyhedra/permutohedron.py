# coding: utf-8
import itertools as it
import numpy as np

phi = (1+np.sqrt(5))/2
t = (1 + np.cbrt( 19 + 3*np.sqrt(33)) + np.cbrt(19-3*np.sqrt(33)) )/ 3


c1 = np.sqrt(
    (1/12) * (4 - np.cbrt(17 + 3*np.sqrt(33)) - np.cbrt(17 - 3*np.sqrt(33)) )
)

c2 = np.sqrt(
    (1/12) * ( 2 + np.cbrt(17 + 3*np.sqrt(33)) + np.cbrt(17 - 3*np.sqrt(33)) )
)

c3 = np.sqrt(
    (1/12) * ( 4 + np.cbrt(199 + 3*np.sqrt(33)) + np.cbrt(199 - 3*np.sqrt(33)) )
)

pretty = {
            phi: "phi",
            -phi: "-phi",
            phi/2: "phi/2",
            -phi/2: "-phi/2",
            phi**2/2: "(phi^2)/2",
            -phi**2/2: "-(phi^2)/2",
            t: "t",
            -t: "-t",
            1/t: "1/t",
            -1/t: "-1/t",
            c1: "c1",
            -c1: "-c1",
            c2: "c2",
            -c2: "-c2",
            c3: "c3",
            -c3: "-c3",
        }

def parity(perm):
    p = 0
    for (first, second) in it.combinations(perm, 2):
        if first > second:
            p += 1
    #print("*", perm, p, (-1)**p)
    return (-1)**p


if __name__ == "__main__":
    ##########
    # Header #
    ##########
    print(f"""
phi = (1 + sqrt(5))/2;
t = (1 + pow( (19+3*sqrt(33)), (1/3) ) + pow( (19-3*sqrt(33)), (1/3)) )/ 3;
/*
c1 = sqrt(
    (1/12)*(
        4 - pow(17 + 3*sqrt(33), 1/3 ) - pow(17 - 3*sqrt(33), 1/3 )
    )
);
c2 = sqrt(
    (1/12)*(
        2 + pow(17 + 3*sqrt(33), 1/3 ) + pow(17 - 3*sqrt(33), 1/3 )
    )
);
c3 = sqrt(
    (1/12)*(
        4 + pow(199 + 3*sqrt(33), 1/3 ) + pow(199 - 3*sqrt(33), 1/3 )
    )
);
*/

c1 = {c1};
c2 = {c2};
c3 = {c3};

points = [
    """)


    ########
    # Body #
    ########

    ## Icosidodecahedron
    #for coordinates in it.product( (0.5, -0.5), (phi/2, -phi/2), (phi**2/2, -phi**2/2) ):
    #    for permutation in it.permutations(coordinates):
    #        if parity(permutation) == 1:
    #            pretty_perm = [ pretty[p] if p in pretty else p for p in permutation ]
    #            print(pretty_perm, ",")
    #for coordinates in [ (0, 0, phi), (0, 0, -phi)]:
    #    for permutation in it.permutations(coordinates):
    #        if parity(permutation) == 1:
    #            pretty_perm = [ pretty[p] if p in pretty else p for p in permutation ]
    #            print(pretty_perm, ",")




    # Other icosidodecahedron
    #for i in it.product( ("phi", "-phi"), ("1/phi", "-1/phi"), ("1", "-1") ):
    #    print(i)
    #for i, j, k in it.product( ("1", "-1"), ("phi", "-phi"), ("1/phi", "-1/phi") ):
    #    print(f"[{i}, {j}, {k}],")
    #for i, j, k in it.product( ("1/phi", "-1/phi"), ("1", "-1"), ("phi", "-phi") ):
    #    print(f"[{i}, {j}, {k}],")



    # Snub cube
    # Even permutations with even number of plus sign
    #for coordinates in [
    #        (-1, +1/t, +t),
    #        (+1, -1/t, +t),
    #        (+1, +1/t, -t),
    #        (-1, -1/t, -t),
    #        ]:
    #    for permutation in it.permutations(coordinates):
    #        if parity(permutation) == 1:
    #            pretty_perm = [ pretty[p] if p in pretty else p for p in permutation ]
    #            first, second, third = pretty_perm
    #            print(f"    [{first}, {second}, {third}],")
    ##Odd permutations with odd number of plus sign
    #for coordinates in [
    #        (-1, +1/t, +t),
    #        (+1, -1/t, +t),
    #        (+1, +1/t, -t),
    #        (-1, -1/t, -t),
    #        ]:
    #    for permutation in it.permutations(coordinates):
    #        if parity(permutation) == -1:
    #            pretty_perm = [ pretty[p] if p in pretty else p for p in permutation ]
    #            first, second, third = pretty_perm
    #            print(f"    [{first}, {second}, {third}],")

    # Other snub cube
    # Even permutations with even number of plus sign
    #for coordinates in [
    #        (c1, c2, c3),
    #        (c1, -c2, -c3),
    #        (-c1, -c2, c3),
    #        (-c1, c2, -c3),

    #        (-c1, -c2, -c3),
    #        (-c1, c2, c3),
    #        (c1, -c2, c3),
    #        (c1, c2, -c3),
    #        ]:
    #    for permutation in it.permutations(coordinates):
    #        if parity(permutation) == -1:
    #            pretty_perm = [ pretty[p] if p in pretty else p for p in permutation ]
    #            first, second, third = pretty_perm
    #            print(f"    [{first}, {second}, {third}],")
    ##Odd permutations with odd number of plus sign
    #for coordinates in [
    #        (c1, c2, c3),
    #        (c1, -c2, -c3),
    #        (-c1, -c2, c3),
    #        (-c1, c2, -c3),
    #        (-c1, -c2, -c3),

    #        (-c1, c2, c3),
    #        (c1, -c2, c3),
    #        (c1, c2, -c3),
    #        ]:
    #    for permutation in it.permutations(coordinates):
    #        if parity(permutation) == +1:
    #            pretty_perm = [ pretty[p] if p in pretty else p for p in permutation ]
    #            first, second, third = pretty_perm
    #            print(f"    [{first}, {second}, {third}],")

    # Truncated cubooctahedron
    for coordinates in it.product( (1, -1), ( (1+np.sqrt(2)), -(1+np.sqrt(2)) ), ( (1+2*np.sqrt(2)), -(1+2*np.sqrt(2)) ) ):
        for permutation in it.permutations(coordinates):
            first, second, third = permutation
            print(f"    [{first}, {second}, {third}],")
    
    ##########
    # Footer #
    ##########
    print("""
];

hull() {
    for (point = points) {
        translate( point ) sphere(0.1);
    }
}
""")
