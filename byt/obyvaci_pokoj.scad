vyska  = 196+64;
tenka  = 10;
tlusta = 45;


vychod = 19 + 90 + 1 + 90 + 149 + 184;
//zapad  = 143 + 273;
zapad = vychod - 76;
jih    = 62 + 120 + 145 + 120 + 70 + 144 + 45;
sever1 = 147+59 +  28+69+82+111;
sever2 = 210;
sever_posun = 76;
sever = sever1+sever2;

severni_pricka_pozice   = 147+59;
severni_pricka_delka    = 108;
severni_pricka_tloustka = 28;

dvere_pozice = 147 + 59 + 28 + 69;
dvere_sirka = 82;
dvere_vyska = 196;

okno_vyska = 155;
okno_vertikalni_pozice = 48;
vetsi_okno_sirka = 144;
mensi_okno_sirka = 120;

vetsi_okno_pozice = 45;
mensi_okno_pozice1 = 45+144+70;
mensi_okno_pozice2 = 45+144+70+120+145;

balkonove_dvere_sirka = 130;
balkonove_dvere_vyska = 235;
balkonove_dvere_pozice = 45+144+70+120+7;

police_vyska = 180;
police_sirka = 90;
police_tloustka = 35;
police_pozice = 19;

akvarium_delka = 88;
akvarium_tloustka = 70.5;
akvarium_vyska = 60;

pracovni_deska_sirka = 132;
pracovni_deska_hloubka = 94;

gauc_vyska = 43;
gauc_A_delka = 150;
gauc_A_sirka = 88;
gauc_B_delka = 150;
gauc_B_sirka = 80;

stul_delka = 180;
stul_sirka = 90;
stul_vyska = 75;

module gauc() {
    color("gray")
    translate([gauc_B_delka-gauc_A_sirka, gauc_B_sirka, 0])
    cube([gauc_A_sirka, gauc_A_delka, gauc_vyska]);
    
    
    color("gray")
    cube([gauc_B_delka, gauc_B_sirka, gauc_vyska]);
}

//severni stena
color("white")
translate([sever1, zapad, 0])
cube([tenka, sever_posun+tenka, vyska]);

color("white")
translate([sever1, vychod, 0])
cube([sever2 + tenka, tenka, vyska]);

difference () {
    color("white")
    translate([-tenka, zapad, 0])
    cube([sever1 + tenka, tenka, vyska]);

    //dvere
    translate([dvere_pozice, zapad - 3*tenka, 0])
    cube([dvere_sirka, 10*tenka, dvere_vyska]);
};

//severni pricka
color("white")
translate([severni_pricka_pozice, zapad-severni_pricka_delka, 0])
cube([severni_pricka_tloustka, severni_pricka_delka, vyska]);


//vychodni stena
color("white")
translate([max(sever, jih), -tlusta, 0])
cube([tenka, vychod + tenka + tlusta, vyska]);

//jizni stena
difference() {
    color("white")
    translate([-tenka, -tlusta, 0])
    cube([jih + 2*tenka, tlusta, vyska]);
    
    //zapadni okno
    translate([vetsi_okno_pozice, -2*tlusta, okno_vertikalni_pozice])
    cube([vetsi_okno_sirka, 3*tlusta, okno_vyska]);

    //prostreni okno
    translate([mensi_okno_pozice1, -2*tlusta, okno_vertikalni_pozice])
    cube([mensi_okno_sirka, 3*tlusta, okno_vyska]);

    //balkonove dvere
    translate([balkonove_dvere_pozice, -2*tlusta, 0])
    cube([balkonove_dvere_sirka, 3*tlusta, balkonove_dvere_vyska]);

    //vychodni okno
    translate([mensi_okno_pozice2, -2*tlusta, okno_vertikalni_pozice])
    cube([mensi_okno_sirka, 3*tlusta, okno_vyska]);

}

//zapadni stena
color("white")
translate([-tenka, -tlusta, 0])
cube([tenka, zapad  + tenka + tlusta, vyska]);


////nabytek
////police1
//color("gray")
//translate([jih-police_tloustka-1, police_pozice, 0])
//cube([police_tloustka, police_sirka, police_vyska]);
//
////police2
//color("gray")
//translate([jih-police_tloustka-1, police_pozice+1+police_sirka, 0])
//cube([police_tloustka, police_sirka, police_vyska]);
//
////akvarium
//color("blue")
//translate([jih-akvarium_tloustka-1, vychod-akvarium_delka-1, 0])
//cube([akvarium_tloustka, akvarium_delka, akvarium_vyska]);
//
////pracovni_deska
//color("brown")
//translate([sever1+tenka, vychod-pracovni_deska_hloubka-1, akvarium_vyska])
//cube([pracovni_deska_sirka, pracovni_deska_hloubka, 2]);
//
////gauc
//translate([ jih - 1 - gauc_B_delka, vychod - akvarium_delka - 10 - gauc_A_delka-gauc_B_sirka, 0])
//gauc();