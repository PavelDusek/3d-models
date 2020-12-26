//Raspberry Pi dimensions
width  = 30;
length = 65;

holes_width = 23;
holes_length = 58;
holes_diameter = 2.75;
corner = 3.5;
holes_margin = (corner - holes_diameter)/2;

corrected_length = length - corner;

wall  = 2.5;
tower_width = 16;

module raspi_platform() {
    //platform
    hull() {
    translate([0, 0, 0 ] )
        cylinder( d = corner, h = wall );
    translate([corrected_length, 0, 0 ] )
        cylinder( d = corner, h = wall );
    translate([0, width, 0 ] )
        cylinder( d = corner, h = wall );
    translate([corrected_length, width, 0 ] )
        cylinder( d = corner, h = wall );
    }
    //pins
    translate([0, 0, wall] )
        cylinder( r = holes_margin, h = wall );
    translate([corrected_length, 0, wall] )
        cylinder( r = holes_margin, h = wall );
    translate([0, width, wall] )
        cylinder( r = holes_margin, h = wall );
    translate([corrected_length, width, wall] )
        cylinder( r = holes_margin, h = wall );
}

module tower_mount() {
    color( [ 1, 1, 1 ] )
    cube([tower_width, tower_width, wall ] );
    
    color([ 1, 0, 0 ])
    translate( [0, -wall, 0 ] )
        cube( [ tower_width, wall, tower_width] );
    
    color([ 0, 1, 0 ])
    translate( [-wall, 0, 0 ] )
        difference() {
            cube( [ wall, tower_width, tower_width] );
            translate([-wall, 0, wall])
                cube( [3*wall, tower_width, wall]);
        }
    color([ 0, 0, 1 ])
    translate( [tower_width, 0, 0 ] )
        cube( [ wall, tower_width, tower_width] );
    
    color([ 1, 1, 0 ])
    translate( [0, tower_width, 0 ] )
        cube( [ tower_width+0.5*wall, wall, tower_width] );

    translate( [-wall, -wall, 0 ] )
        cube([ wall, wall, tower_width ] );

    translate( [-wall, tower_width, 0 ] )
        cube([ wall, wall, tower_width ] );

    translate( [tower_width, -wall, 0 ] )
        cube([ wall, wall, tower_width ] );

    translate( [tower_width, tower_width, 0 ] )
        cube([ wall, wall, tower_width ] );

}

raspi_platform();
translate( [length+(1/8)*corner, width*(1/4), 0 ] )
    tower_mount();
