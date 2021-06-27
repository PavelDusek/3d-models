$fn                  =  60;
trunk_width          =  10;
trunk_diameter       = 120;
trunk_angle          =  90;
svg_width            = 240;
svg_height           =  70+80;
elephant_thickness   =   3;
elephant_trunk_ratio =   5;

module trunk() {
    translate([0, trunk_diameter/2, 0])
        rotate([90, 0, -90])
            rotate_extrude(angle = trunk_angle)
                translate([trunk_diameter/2, 0, 0])
                    scale([2, 1, 1]) circle(d = trunk_width );
}

scale([
    (elephant_trunk_ratio*trunk_width)/svg_height,
    (elephant_trunk_ratio*trunk_width)/svg_height,
    1
]) linear_extrude(elephant_thickness) import("elephant.svg");

resize(newsize = [trunk_width, trunk_diameter/3, trunk_diameter/2])
trunk();