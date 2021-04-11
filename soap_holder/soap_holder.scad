$fn = 150;
rod_diameter = 20;
saddle_diameter = 34;

bottle_diameter = 72;

module cat() {
    linear_extrude(4*rod_diameter) import("cat.svg");
}

module heart() {
    linear_extrude(4*rod_diameter) text("♥", size=rod_diameter);
}

module holder() {
    difference() {
        translate([0, 0, -2*rod_diameter]) cylinder( d = 2*rod_diameter, h = 4*rod_diameter);
        translate([0, 0, -1])
            cylinder( d = rod_diameter, h = 3*rod_diameter);
        translate([0, -1.5*rod_diameter, -0.25*rod_diameter])
            rotate([-90, 0, 0])
                cylinder( d = saddle_diameter , h = 3*rod_diameter);        

   rotate([0, -30, 0]) translate([-2*rod_diameter, -2*rod_diameter, -5.5*rod_diameter])cube([4*rod_diameter, 4*rod_diameter, 4*rod_diameter]);
 
    }
}

module connection() {
    translate([-0.5*rod_diameter, 0.5*rod_diameter, rod_diameter])
        cube([rod_diameter, 0.5*rod_diameter, 0.9*rod_diameter]);
}

module bottle() {
    difference() {
    translate([0, (0.5+0.075)*bottle_diameter+0.9*rod_diameter, -4*rod_diameter])
        difference() {
            cylinder( d = 1.15*bottle_diameter, h = 6*rod_diameter);
            translate([0, 0, 0.15*rod_diameter]) cylinder( d = bottle_diameter, h = 6*rod_diameter);
        }
        
            translate([-0.5*1.15*bottle_diameter, 0.9*rod_diameter, 2*rod_diameter]) rotate([-45, 0, 0]) cube([1.15*bottle_diameter, 30*bottle_diameter, 1.15*bottle_diameter]);
        
            translate([ -0.38*bottle_diameter, 0.35*bottle_diameter, -5*rod_diameter]) scale([0.2, 0.2, 1]) cat();

    }
}

module case() {
    hull() {
        translate( [ (+1)*0.5*bottle_diameter, (+1)*0.15*bottle_diameter, 0 ] )
            sphere( d = bottle_diameter );
                
        translate( [ (+1)*0.5*bottle_diameter, (-1)*0.15*bottle_diameter, 0] )
            sphere( d = bottle_diameter );
        
        translate( [ (-1)*0.5*bottle_diameter, (+1)*0.15*bottle_diameter, 0 ] )
            sphere( d = bottle_diameter );

        translate( [ (-1)*0.5*bottle_diameter, (-1)*0.15*bottle_diameter, 0] )
            sphere( d = bottle_diameter);

    }
}

module bar() {
    difference() {
        case();
        scale([0.9, 0.9, 0.9]) case();
        translate([-5*bottle_diameter, -5*bottle_diameter,  0])
            cube([10*bottle_diameter, 10*bottle_diameter, 10*bottle_diameter]);
      
        translate([-0.5*rod_diameter, -0.5*rod_diameter, -3*rod_diameter]) heart();
        
        translate([0.5*bottle_diameter-0.5*rod_diameter, 0.25*bottle_diameter-0.5*rod_diameter, -3*rod_diameter]) heart();
        translate([0.5*bottle_diameter-0.5*rod_diameter, -0.25*bottle_diameter-0.5*rod_diameter, -3*rod_diameter]) heart();
        translate([-0.5*bottle_diameter-0.5*rod_diameter, 0.25*bottle_diameter-0.5*rod_diameter, -3*rod_diameter]) heart();
        translate([-0.5*bottle_diameter-0.5*rod_diameter, -0.25*bottle_diameter-0.5*rod_diameter, -3*rod_diameter]) heart();
        
    }
}

color([1, 0, 0]) holder();
//color([0, 1, 0]) connection();
//color([0, 1, 0]) translate([0, 0, -3*rod_diameter]) connection();
rotate([0, 0, 90]) color([0, 0, 1]) bottle();
rotate([0, 0, 90]) color([1, 0.25, 0.25]) translate([ -0.4*bottle_diameter, -0.33*bottle_diameter, (-4*rod_diameter)+(0.5*bottle_diameter)]) bar();