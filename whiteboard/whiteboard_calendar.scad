whiteboard_width  = 600;
whiteboard_height = 900;

day_width  = whiteboard_width/7;
day_height = whiteboard_height/16;

wall      = 2;
thickness =  2;

magnet_height1 =  4.5;
magnet_height2 = 12.5;
magnet_diam    = 10;
screw_height   = magnet_height2-magnet_height1;
screw_diam     =  4;

$fn = 30;

module screw() {
    cylinder( d = screw_diam, h = screw_height );
}

module magnet() {
    cylinder( d = magnet_diam, h = magnet_height1+2 );
    translate([0, 0, magnet_height1]) screw();
}

module magnet_case() {
    difference() {
        cylinder( d = magnet_diam+wall, h = magnet_height1+wall);
        translate([0, 0, -1]) magnet();
    }
}

module plate(plate_width, plate_height, plate_thickness) {
    hull() {
        translate( [
            0 * plate_width  + 0.5 * wall,
            0 * plate_height + 0.5 * wall,
            0 ] )
            cylinder(d = wall, h = plate_thickness);
        translate( [
            1 * plate_width  - 0.5 * wall,
            0 * plate_height + 0.5 * wall,
            0 ] )
            cylinder(d = wall, h = plate_thickness);
        translate( [
            0 * plate_width  + 0.5 * wall,
            1 * plate_height - 0.5 * wall,
            0 ] )
            cylinder(d = wall, h = plate_thickness);
        translate( [
            1 * plate_width  - 0.5 * wall,
            1 * plate_height - 0.5 * wall,
            0 ] )
            cylinder(d = wall, h = plate_thickness);
    }
}

module day() {
    difference() {
        plate(day_width, day_height, thickness);
        
        translate( [ wall, wall, -1 ] ) 
        plate(day_width - 2*wall, day_height - 2*wall, thickness+3);
    }
}

day();
translate([0.5*(magnet_diam+wall), 0.5*(magnet_diam+wall), 0]) magnet_case();