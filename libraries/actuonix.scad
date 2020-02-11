module _lr16motor(){
  difference(){
    union(){
      rotate(90, [1,0,0]) cylinder(r=5,h=8,center=true);
      translate([0,-4,-5]) cube([10, 8, 10]);
      translate([9,-9,-8.5]) cube([53,18,20]);

    }
    rotate(90, [1,0,0]) cylinder(r=2,h=9,center=true);
  }
}

module _lr16_end(x){
  translate([x,0,0]) difference() {
    rotate(90, [1,0,0]) cylinder(r=5,h=8,center=true);
    rotate(90, [1,0,0]) cylinder(r=2,h=9,center=true);
  }
}

module lr16_folded(length) {
  union(){
    _lr16motor();
    cylinder_length=68+length-62-4;
    translate([62+(cylinder_length/2), 0, 0]) rotate(90, [0, 1, 0]) cylinder(r=6, h=cylinder_length, center=true);
    _lr16_end(68+length);
  }
}

module lr16_unfolded(length) {
  union(){
    _lr16motor();
    cylinder_length=68+length-62-4;
    translate([62+(cylinder_length/2), 0, 0]) rotate(90, [0, 1, 0]) cylinder(r=6, h=cylinder_length, center=true);
    translate([62+(cylinder_length/2)+cylinder_length, 0, 0]) rotate(90, [0, 1, 0]) cylinder(r=4.5, h=cylinder_length, center=true);
    _lr16_end(68+2*length);
  }
}
