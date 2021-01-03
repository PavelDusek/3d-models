//Raspberry Pi dimensions
width  = 30;
length = 65;
extra_length = 10;

holes_width = 23;
holes_length = 58;
holes_diameter = 2.5;
corner = 3.5;
holes_margin = (corner - holes_diameter)/2;

corrected_length = length - corner;

wall  = 2.5;
tower_width = 22;
margin = 0.5;
tower_width_with_margin = tower_width + margin;

module raspi_platform() {
    //platform
    hull() {
    translate([0, 0, 0 ] )
        cylinder( d = corner, h = wall );
    translate([corrected_length+extra_length, 0, 0 ] )
        cylinder( d = corner, h = wall );
    translate([0, width, 0 ] )
        cylinder( d = corner, h = wall );
    translate([corrected_length+extra_length, width, 0 ] )
        cylinder( d = corner, h = wall );
    }
    //pins
    translate([(1/2)*(length-holes_length), (1/2)*(width-holes_width), wall] )
        cylinder( d = holes_diameter, h = wall );
    translate([(1/2)*(length+holes_length), (1/2)*(width-holes_width), wall] )
        cylinder( d = holes_diameter, h = wall );
    translate([(1/2)*(length-holes_length), (1/2)*(width+holes_width), wall] )
        cylinder( d = holes_diameter, h = wall );
    translate([(1/2)*(length+holes_length), (1/2)*(width+holes_width), wall] )
        cylinder( d = holes_diameter, h = wall );
}

module tower_mount() {
    color( [ 1, 1, 1 ] )
    cube([tower_width_with_margin, tower_width_with_margin, wall ] );
    
    color([ 1, 0, 0 ])
    translate( [0, -wall, 0 ] )
        cube( [ tower_width_with_margin, wall, tower_width_with_margin] );
    
    color([ 0, 1, 0 ])
    translate( [-wall, 0, 0 ] )
        difference() {
            cube( [ wall, tower_width_with_margin, tower_width_with_margin] );
            translate([-wall, 0, wall])
                cube( [3*wall, tower_width_with_margin, 2*wall]);
        }
    color([ 0, 0, 1 ])
    translate( [tower_width_with_margin, 0, 0 ] )
        cube( [ wall, tower_width_with_margin, tower_width_with_margin] );
    
    color([ 1, 1, 0 ])
    translate( [0, tower_width_with_margin, 0 ] )
        cube( [ tower_width_with_margin+0.5*wall, wall, tower_width_with_margin] );

    translate( [-wall, -wall, 0 ] )
        cube([ wall, wall, tower_width_with_margin ] );

    translate( [-wall, tower_width_with_margin, 0 ] )
        cube([ wall, wall, tower_width_with_margin ] );

    translate( [tower_width_with_margin, -wall, 0 ] )
        cube([ wall, wall, tower_width_with_margin ] );

    translate( [tower_width_with_margin, tower_width_with_margin, 0 ] )
        cube([ wall, wall, tower_width_with_margin ] );

}

raspi_platform();
translate( [length+(1/8)*corner+extra_length, (1/2)*(width-tower_width_with_margin), 0 ] )
    tower_mount();