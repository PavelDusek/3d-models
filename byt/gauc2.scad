gauc_vyska = 43;
gauc_A_delka = 150;
gauc_A_sirka = 88;
gauc_B_delka = 150;
gauc_B_sirka = 80;

module gauc() {
    color("gray")
    translate([gauc_B_delka-gauc_A_sirka, gauc_B_sirka, 0])
    cube([gauc_A_sirka, gauc_A_delka, gauc_vyska]);
    
    
    color("gray")
    cube([gauc_B_delka, gauc_B_sirka, gauc_vyska]);
}

mirror([1, 0, 0])
gauc();
