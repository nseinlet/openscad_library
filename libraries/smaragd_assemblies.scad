//Underscrore modules are assemblies not designed to be printed/cut
//Look at smaragd.scad for printed/cutted parts

include <smaragd.scad>

module _soc(x,y){
    translate([x,y]) union() {
      pointe_soc();
      ailette();
    }
}

module _double_disque(x) {
  te_disque(x);
}

module _3points(){
  attache_bras( 25);
  attache_bras(-25);
  base_3emepoint( 6);
  base_3emepoint(-6);
  barre_3emepoint( 4);
  barre_3emepoint(-4);
  contrevent_3emepoint(2);
  contrevent_3emepoint(-2,1);
}

module _large_frame(x, y) {
  translate([x,y,0]) union() {
    large_frame();
    //Attaches socs
    for (a =[0, 58, -58]) {
      demi_attache_soc(a-2, 0);
      demi_attache_soc(a+2, 0);
      _soc(a,0);
    }
    for (a =[29, 87, -29, -87]) {
      demi_attache_soc(a-2, 56);
      demi_attache_soc(a+2, 56);
      _soc(a, 56);
    }
  }
}

module _middle_frame(x, y) {
  translate([x,y,0]) union() {
    large_frame(80);

    //Attaches socs
    demi_attache_soc(-2, 56);
    demi_attache_soc(+2, 56);
    _soc(0,56);

    for (a =[29, -29, 29+58]) {
      demi_attache_soc(a-2, 0);
      demi_attache_soc(a+2, 0);
      _soc(a, 0);
    }
  }
}

module _small_frame(x, y, reversed=0) {
  translate([x,y,0]) mirror([reversed,0,0]) union() {
    small_frame();
    //Attaches socs
    demi_attache_soc(-13-2, 0);
    demi_attache_soc(-13+2, 0);
    _soc(-13,0);
    demi_attache_soc( 16-2, 56);
    demi_attache_soc( 16+2, 56);
    _soc(16,56);
    demi_attache_soc( 45-2, 0);
    demi_attache_soc( 45+2, 0);
    _soc(45,0);
  }
}

module _support_rouleaux_et_disques(x) {
  pivot(x-2);
  barre_1(x-2);
  support_rouleaux_et_disques(x);
  traverse(x);
  barre_1(x+2);
  pivot(x+2);
}

module _large_barre_disque(fix1, fix2, length=200, pos_first_disque=0) {
  poutre_disques(100, 37, length);
  //Attache au chassis
  demi_attache_disque(fix1-2, 0, 90);
  demi_attache_disque(fix1+2, 0, 90);
  demi_attache_disque(fix2-2, 0, 90);
  demi_attache_disque(fix2+2, 0, 90);
  //Attache des disques
  for (a=[pos_first_disque:58:length/2]) { for (mult=[-1,1]){
      translate([a*mult,0,-3]) demi_attache_disque(-2, 3, 0);
      translate([a*mult,0,-3]) demi_attache_disque( 2, 3, 0);
      _double_disque(a*mult);
    }}
}

module _rouleau(length, y) {
  diam = 30;
  for(angl=[0:45:360]){
    translate([0, y, diam/2])  rotate(angl, [1,0,0]) translate([0, diam/2, 0]) rotate(90,[0,1,0]) cylinder(r=1.5, h=length, center=true);
  }
  for(x=[(length/2)-10:-30:0]){
    disque_rouleau(x, y, diam);
    disque_rouleau(-x, y, diam);
  }
}

module _rouleau_simple(fix1=70,fix2=-70,length=200){
  te_simple_rouleau(-length/2);
  poutre_disques(145, 36.5, length);
  te_simple_rouleau(length/2);

  demi_attache_disque(fix1+2, 45, 90, -1);
  demi_attache_disque(fix1-2, 45, 90, -1);
  demi_attache_disque(fix2+2, 45, 90, -1);
  demi_attache_disque(fix2-2, 45, 90, -1);

  _rouleau(length-4, 160);
}

module _rouleau_double(fix1=70,fix2=-70,length=200){
  te_double_rouleau(-length/2);
  poutre_disques(145, 36.5, length);
  te_double_rouleau( length/2);

  demi_attache_disque(fix1+2, 45, 90, -1);
  demi_attache_disque(fix1-2, 45, 90, -1);
  demi_attache_disque(fix2+2, 45, 90, -1);
  demi_attache_disque(fix2-2, 45, 90, -1);

  _rouleau(length-4, 140);
  _rouleau(length-4, 180);
}

module _semiport_arriere(){
  semiport_arriere_bas(-4);
  semiport_arriere_bas(4);
  semiport_arriere_haut(6);
  semiport_arriere_haut(-6, 1);
  semiport_arriere_axe();
}
