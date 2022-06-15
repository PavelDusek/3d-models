wide_tube_outer    = 56;
wide_tube_inner    = 52;
wide_tube_length   = 60;

narrow_tube_outer  = 19.05;
narrow_tube_inner  = 16.5;
narrow_tube_length = 30;

reduction_length   = 30;
$fn                = 99;

module wide_tube() {
    difference() {
        cylinder( d = wide_tube_outer, h = wide_tube_length );
        translate([0, 0, -1])
        cylinder( d = wide_tube_inner, h = wide_tube_length+2 );
    }
}

module narrow_tube() {
    rotate([0, -90, 0])
    difference() {
        cylinder( d = narrow_tube_outer, h = narrow_tube_length );
        translate([0, 0, -1])
        cylinder( d = narrow_tube_inner, h = narrow_tube_length+2 );
    }
}

module reduction() {
    difference() {
        linear_extrude(height = reduction_length, scale = (narrow_tube_outer/wide_tube_outer), center = false)
        circle( d = wide_tube_outer );

        translate([0, 0, -1])
        linear_extrude(height = reduction_length + 2, scale = (narrow_tube_inner/wide_tube_inner), center = false)
        circle( d = wide_tube_inner );
    }
}

module L_shape() {
    translate([-2*narrow_tube_outer, 0, 0])
    rotate([90, 0, 0])
    rotate_extrude(angle = 90, convexity = 10 )
    translate([2*narrow_tube_outer, 0, 0])
    difference() {
        circle( d = narrow_tube_outer );
        circle( d = narrow_tube_inner );
    }
}

translate([0, 0, -wide_tube_length]) wide_tube();
reduction();
translate([0, 0, reduction_length]) L_shape();

translate([-2*narrow_tube_outer, 0, reduction_length+2*narrow_tube_outer]) narrow_tube();