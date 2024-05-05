tablet_width     = 127;
tablet_height    = 226;
tablet_thickness =   9;
thickness        =   2.5;
corner           =   4;
$fn              =  30;

module rounded_cube( length, width, height, corner ) {
    hull() {
            translate( [0 * length + corner, 0 * width + corner, 0 * height + corner ]) sphere( r = corner );
            translate( [0 * length + corner, 1 * width - corner, 0 * height + corner ]) sphere( r = corner );
            translate( [1 * length - corner, 0 * width + corner, 0 * height + corner ]) sphere( r = corner );
            translate( [1 * length - corner, 1 * width - corner, 0 * height + corner ]) sphere( r = corner );
            translate( [0 * length + corner, 0 * width + corner, 1 * height - corner ]) sphere( r = corner );
            translate( [0 * length + corner, 1 * width - corner, 1 * height - corner ]) sphere( r = corner );
            translate( [1 * length - corner, 0 * width + corner, 1 * height - corner ]) sphere( r = corner );
            translate( [1 * length - corner, 1 * width - corner, 1 * height - corner ]) sphere( r = corner );
    }
}

module holder() {
    difference() {
        rounded_cube(
            length = tablet_width + 2 * thickness,
            width  = tablet_height + 2 * thickness,
            height = tablet_thickness + 2 * thickness,
            corner = corner
        );
  
        //slit for tablet
        translate([thickness, -thickness, thickness])
            cube([
                tablet_width,
                tablet_height+2*thickness,
                tablet_thickness
            ]);

        //slit to view screen
        translate([2*thickness, 2*thickness, tablet_thickness])
            cube([
                tablet_width - 2 * thickness,
                tablet_height - 2 * thickness,
                tablet_thickness
            ]);

        //slit for buttons
        translate([ tablet_width-thickness, 0.5*tablet_height, thickness])
        rounded_cube(4*thickness, 0.5*tablet_height, tablet_thickness, corner);        
        
        //holes for string attachmentt
        color([1, 0, 0])
        translate( [
            thickness+0.25*tablet_width,
            thickness+0.25*tablet_height,
            -thickness
        ])
        cylinder( h = 4 * thickness, d = 2*thickness );
    
        color([1, 0, 0])
        translate( [
            thickness+0.75*tablet_width,
            thickness+0.25*tablet_height,
            -thickness
        ])
        cylinder( h = 4 * thickness, d = 2*thickness );
    
        color([1, 0, 0])
        translate( [
            thickness+0.25*tablet_width,
            thickness+0.75*tablet_height,
            -thickness
        ])
        cylinder( h = 4 * thickness, d = 2*thickness );
    
    
        color([1, 0, 0])
        translate( [
            thickness+0.75*tablet_width,
            thickness+0.75*tablet_height,
            -thickness
        ])
        cylinder( h = 4 * thickness, d = 2*thickness );
   
    }
}

holder();