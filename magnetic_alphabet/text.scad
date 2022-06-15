wall           =  1;
text_size      = 80;
//text_font      = "Liberation Sans:style=Bold";
text_font      = "Calibre";

magnet_height1 =   4.5;
magnet_height2 =  12.5;
magnet_diam    =  10;
screw_diam     =   4;
nut_height     =   3.2;
nut_diam       =   8;
$fn            =  40;

screw_height = magnet_height2-magnet_height1;
nut_radius   = 0.5 * nut_diam;

module hexagon(radius) {
    polygon(
        points = [
            [radius * sin(0*60), radius * cos(0*60)],
            [radius * sin(1*60), radius * cos(1*60)],
            [radius * sin(2*60), radius * cos(2*60)],
            [radius * sin(3*60), radius * cos(3*60)],
            [radius * sin(4*60), radius * cos(4*60)],
            [radius * sin(5*60), radius * cos(5*60)]
        ]
    );
}

module nut(radius, height) {
    linear_extrude(height) {
        hexagon(radius);
    };
}

module screw() {
    cylinder( d = screw_diam, h = screw_height );
}

module magnet() {
    cylinder( d = magnet_diam, h = magnet_height1+2 );
    translate([0, 0, magnet_height1]) screw();
}

module magnet_complet() {
    translate([0, 0, -1])
        magnet();
    translate([0, 0, magnet_height2-nut_height])
        nut(nut_radius, nut_height+1);
    translate([0, 0, magnet_height2])
        nut(nut_radius, nut_height+1);
}

module B_magnet() {
    difference() {
        linear_extrude( magnet_height1+wall+1 )
            text("B", size = text_size, font=text_font);
        translate([0.205*text_size, 0.93*text_size, 0])
            magnet_complet();
        translate([0.205*text_size, 0.07*text_size, 0])
            magnet_complet();
    }
}

module B_cover() {
    difference() {
        linear_extrude( screw_height+wall+1 )
            text("B", size = text_size, font=text_font);
        
        translate([0.205*text_size, 0.93*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
        translate([0.205*text_size, 0.07*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}

module L_magnet() {
    difference() {
        linear_extrude( magnet_height1+wall+1 )
            text("L", size = text_size, font=text_font);
        translate([0.205*text_size, 0.93*text_size, 0])
            magnet_complet();
        translate([0.205*text_size, 0.07*text_size, 0])
            magnet_complet();
    }
}

module L_cover() {
    difference() {
        linear_extrude( screw_height+wall+1 )
            text("L", size = text_size, font=text_font);
        translate([0.205*text_size, 0.93*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
        translate([0.205*text_size, 0.07*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}

module I_carka_magnet() {
    difference() {
        union() {
            linear_extrude( magnet_height1+wall+1 )
                text("I", size = text_size, font=text_font);
            translate([-0.40*text_size, 0.7*text_size, 0])
            rotate([0, 0, -45])
            linear_extrude( magnet_height1+wall+1 )
                text("'", size = text_size, font=text_font);
        }
        translate([0.205*text_size, 0.07*text_size, 0])
            magnet_complet();
        translate([0.205*text_size, 0.93*text_size, 0])
            magnet_complet();
    }
}

module I_carka_cover() {
    difference() {
        union() {
            linear_extrude( screw_height+wall+1 )
                text("I", size = text_size, font=text_font);
            translate([-0.40*text_size, 0.7*text_size, 0])
            rotate([0, 0, -45])
            linear_extrude( screw_height+wall+1 )
                text("'", size = text_size, font=text_font);
        }
        translate([0.205*text_size, 0.07*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
        translate([0.205*text_size, 0.93*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}

module Z_hacek_magnet() {
    difference() {
        union() {
            linear_extrude( magnet_height1+wall+1 )
                text("Z", size = text_size, font=text_font);
            translate([ 0.1*text_size, 0.1*text_size, 0])
            linear_extrude( magnet_height1+wall+1 )
                text("ˇ", size = text_size, font=text_font);
        }
        translate([0.78*text_size, 0.93*text_size, 0])
            magnet_complet();
        translate([0.15*text_size, 0.08*text_size, 0])
            magnet_complet();
    }
}

module Z_hacek_cover() {
    difference() {
        union() {
            linear_extrude( screw_height+wall+1 )
                text("Z", size = text_size, font=text_font);
            translate([ 0.1*text_size, 0.1*text_size, 0])
            linear_extrude( screw_height+wall+1 )
                text("ˇ", size = text_size, font=text_font);
        }
        translate([0.78*text_size, 0.93*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
        translate([0.15*text_size, 0.08*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}

module O_magnet() {
    difference() {
        linear_extrude( magnet_height1+wall+1 )
            text("O", size = text_size, font=text_font);
        translate([0.15*text_size, 0.5*text_size, 0])
            magnet_complet();
        translate([0.94*text_size, 0.5*text_size, 0])
            magnet_complet();
    }
}

module O_cover() {
    difference() {
        linear_extrude( screw_height+wall+1 )
            text("O", size = text_size, font=text_font);
        translate([0.15*text_size, 0.5*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
        translate([0.94*text_size, 0.5*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}

module H_magnet() {
    difference() {
        linear_extrude( magnet_height1+wall+1 )
            text("H", size = text_size, font=text_font);
        translate([0.205*text_size, 0.54*text_size, 0])
            magnet_complet();
        translate([0.83*text_size, 0.54*text_size, 0])
            magnet_complet();
    }
}

module H_cover() {
    difference() {
        linear_extrude( screw_height+wall+1 )
            text("H", size = text_size, font=text_font);
        translate([0.205*text_size, 0.54*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
        translate([0.83*text_size, 0.54*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}

module U_magnet() {
    difference() {
        linear_extrude( magnet_height1+wall+1 )
            text("U", size = text_size, font=text_font);
        translate([0.189*text_size, 0.54*text_size, 0])
            magnet_complet();
        translate([0.8275*text_size, 0.54*text_size, 0])
            magnet_complet();
    }
}

module U_cover() {
    difference() {
        linear_extrude( screw_height+wall+1 )
            text("U", size = text_size, font=text_font);
        translate([0.189*text_size, 0.54*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
        translate([0.8275*text_size, 0.54*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}

module K_magnet() {
    difference() {
        linear_extrude( magnet_height1+wall+1 )
            text("K", size = text_size, font=text_font);
        translate([0.205*text_size, 0.10*text_size, 0])
            magnet_complet();
        translate([0.205*text_size, 0.90*text_size, 0])
            magnet_complet();
    }
}

module K_cover() {
    difference() {
        linear_extrude( screw_height+wall+1 )
            text("K", size = text_size, font=text_font);
        translate([0.205*text_size, 0.10*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
        translate([0.205*text_size, 0.90*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}

module S_magnet() {
    difference() {
        linear_extrude( magnet_height1+wall+1 )
            text("S", size = text_size, font=text_font);
        translate([0.16*text_size, 0.75*text_size, 0])
            magnet_complet();
        translate([0.731*text_size, 0.27*text_size, 0])
            magnet_complet();
    }
}

module S_cover() {
    difference() {
        linear_extrude( screw_height+wall+1 )
            text("S", size = text_size, font=text_font);
        translate([0.16*text_size, 0.75*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
        translate([0.731*text_size, 0.27*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}

module E_magnet() {
    difference() {
        linear_extrude( magnet_height1+wall+1 )
            text("E", size = text_size, font=text_font);
        translate([0.209*text_size, 0.08*text_size, 0])
            magnet_complet();
        translate([0.209*text_size, 0.94*text_size, 0])
            magnet_complet();
    }
}

module E_cover() {
    difference() {
        linear_extrude( screw_height+wall+1 )
            text("E", size = text_size, font=text_font);
        translate([0.209*text_size, 0.08*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
        translate([0.209*text_size, 0.94*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}

module E_hacek_magnet() {
    difference() {
        union() {
            linear_extrude( magnet_height1+wall+1 )
                text("E", size = text_size, font=text_font);
            translate([0.1*text_size, 0.1*text_size, 0])
            linear_extrude( magnet_height1+wall+1 )
                text("ˇ", size = text_size, font=text_font);
        }
        translate([0.209*text_size, 0.08*text_size, 0])
            magnet_complet();
        translate([0.209*text_size, 0.94*text_size, 0])
            magnet_complet();
    }
}

module E_hacek_cover() {
    difference() {
        union() {
            linear_extrude( screw_height+wall+1 )
                text("E", size = text_size, font=text_font);
            translate([0.1*text_size, 0.1*text_size, 0])
            linear_extrude( screw_height+wall+1 )
                text("ˇ", size = text_size, font=text_font);
        }
        translate([0.209*text_size, 0.08*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
        translate([0.209*text_size, 0.94*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}

module V_magnet() {
    difference() {
        linear_extrude( magnet_height1+wall+1 )
            text("V", size = text_size, font=text_font);
        translate([0.1145*text_size, 0.93*text_size, 0])
            magnet_complet();
        translate([0.836*text_size, 0.93*text_size, 0])
            magnet_complet();
    }
}

module V_cover() {
    difference() {
        linear_extrude( screw_height+wall+1 )
            text("V", size = text_size, font=text_font);
        translate([0.1145*text_size, 0.93*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
        translate([0.836*text_size, 0.93*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}

module T_magnet() {
    difference() {
        linear_extrude( magnet_height1+wall+1 )
            text("T", size = text_size, font=text_font);
        translate([0.425*text_size, 0.94*text_size, 0])
            magnet_complet();
        translate([0.425*text_size, 0.08*text_size, 0])
            magnet_complet();
    }
}

module T_cover() {
    difference() {
        linear_extrude( screw_height+wall+1 )
            text("T", size = text_size, font=text_font);
        translate([0.425*text_size, 0.94*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
        translate([0.425*text_size, 0.08*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}

module M_magnet() {
    difference() {
        linear_extrude( magnet_height1+wall+1 )
            text("M", size = text_size, font=text_font);
        translate([0.215*text_size, 0.94*text_size, 0])
            magnet_complet();
        translate([0.99*text_size, 0.94*text_size, 0])
            magnet_complet();
    }
}

module M_cover() {
    difference() {
        linear_extrude( screw_height+wall+1 )
            text("M", size = text_size, font=text_font);
        translate([0.215*text_size, 0.94*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
        translate([0.99*text_size, 0.94*text_size, -1])
            nut(nut_radius, 2*nut_height+1);
    }
}


//B
//translate([0*text_size, 0*text_size, 0]) B_magnet();
//translate([0.8*text_size, 0*text_size, 0]) B_cover();

//L
//translate([0.0*text_size, 0*text_size, 0]) L_magnet();
//translate([0.8*text_size, 0*text_size, 0]) L_cover();

//I_carka
//translate([0*text_size, 0*text_size, 0]) I_carka_magnet();
//translate([0.8*text_size, 0*text_size, 0]) I_carka_cover();

//Z_hacek
//translate([0*text_size, 0*text_size, 0]) Z_hacek_magnet();
//translate([1.0*text_size, 0*text_size, 0]) Z_hacek_cover();

//O
//translate([0*text_size, 0*text_size, 0]) O_magnet();
//translate([1.1*text_size, 0*text_size, 0]) O_cover();

//H
//translate([0*text_size, 0*text_size, 0]) H_magnet();
//translate([0.85*text_size, 0*text_size, 0]) H_cover();

//U
//translate([0*text_size, 0*text_size, 0]) U_magnet();
//translate([0.85*text_size, 0*text_size, 0]) U_cover();

//K
//translate([0*text_size, 0*text_size, 0]) K_magnet();
//translate([0.85*text_size, 0*text_size, 0]) K_cover();

//S
//translate([0*text_size, 0*text_size, 0]) S_magnet();
//translate([0.85*text_size, 0*text_size, 0]) S_cover();

//E
//translate([0*text_size, 0*text_size, 0]) E_magnet();
//translate([0.85*text_size, 0*text_size, 0]) E_cover();

//E_hacek
//translate([0*text_size, 0*text_size, 0]) E_hacek_magnet();
//translate([0.85*text_size, 0*text_size, 0]) E_hacek_cover();

//V
//translate([0*text_size, 0*text_size, 0]) V_magnet();
//translate([1.0*text_size, 0*text_size, 0]) V_cover();

//T
//translate([0*text_size, 0*text_size, 0]) T_magnet();
//translate([1.0*text_size, 0*text_size, 0]) T_cover();

//M
translate([0*text_size, 0*text_size, 0]) M_magnet();
translate([1.0*text_size, 0*text_size, 0]) M_cover();
