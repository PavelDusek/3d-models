r         = 80;
thickness =  8;

module half_hex() {
    linear_extrude(thickness) {
        polygon([
            [-r, 0 ],
            [-r/2, r*sin(60)],
            [+r/2, r*sin(60)],
            [r, 0],
        ]);
    }
}

difference() {
    half_hex();
    translate([-1, -1, -1]) scale([0.75, 0.75, 1.5]) half_hex();
}