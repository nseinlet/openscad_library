module profile_l(size, length, thickness=1) {
  union() {
    cube([size, length, thickness]);
    cube([thickness, length, size]);
  }
}

module profile_carre(size, length, cut=false, angle_cut=45, cut_bevel=false, thickness=1){
  difference(){
    cube([size, length, size]);
    translate([thickness, 0, thickness] ) cube([size-(2*thickness), length, size-(2*thickness)]);
    if (cut){
      translate([0, length, 0]) rotate(angle_cut, [0, 0, -1]) cube([size*2,size,size]);
      rotate(angle_cut, [0, 0, 1]) translate([0, -size, 0]) cube([size*2,size,size]);
    }
    if (cut_bevel){
      translate([0, length, 0]) rotate(angle_cut, [1, 0, 0]) cube([size, size, size*2]);
      translate([0, 0, size]) rotate(angle_cut, [1, 0, 0]) translate([0, -size, -size-4]) cube([size, size, size*2]);
    }
  }
}
