module profile_l(size, length, thickness=1) {
  union() {
    cube([size, length, thickness]);
    cube([thickness, length, size]);
  }
}

module profile_carre(size, length, 45cut=false){
  difference(){
    cube([size, length, size]);
    translate([1, 0, 1] ) cube([size-2, length, size-2]);
    if (45cut){
      translate([0, length, 0]) rotate(45, [0, 0, -1]) cube([size*2,size,size]);
      rotate(45, [0, 0, 1]) translate([0, -size, 0]) cube([size*2,size,size]);
    }
  }
}
