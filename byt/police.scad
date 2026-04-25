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

//police1
color("gray")
translate([jih-police_tloustka-1, police_pozice, 0])
cube([police_tloustka, police_sirka, police_vyska]);
