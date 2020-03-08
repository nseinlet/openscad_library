module titan_folded(length) {
  union(){

    cylinder_length=68+length-62-4;
    translate([62+(cylinder_length/2), 0, 0]) rotate(90, [0, 1, 0]) cylinder(r=6, h=cylinder_length, center=true);
    _lr16_end(68+length);
  }
}

module titan_unfolded(length) {
  union(){
    
    cylinder_length=68+length-62-4;
    translate([62+(cylinder_length/2), 0, 0]) rotate(90, [0, 1, 0]) cylinder(r=6, h=cylinder_length, center=true);
    translate([62+(cylinder_length/2)+cylinder_length, 0, 0]) rotate(90, [0, 1, 0]) cylinder(r=4.5, h=cylinder_length, center=true);
    _lr16_end(68+2*length);
  }
}
