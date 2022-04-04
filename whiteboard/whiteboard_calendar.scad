whiteboard_width  = 600;
whiteboard_height = 900;

day_width  = whiteboard_width/7;
day_height = whiteboard_height/16;

wall      = 5;
thickness =  4;

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