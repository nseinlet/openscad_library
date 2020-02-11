module _n20_motor(){
  difference(){
    union(){
      rotate(90, [1,0,0]) cylinder(r=4,h=8,center=true);
      translate([0, -4, -4]) cube([10, 8, 8]);
      translate([4,-7.5,-8.5]) cube([40, 15, 20]);

    }
    rotate(90, [1,0,0]) cylinder(r=2, h=9, center=true);
  }
}

module _n20_end(x){
  translate([x,0,0]) difference() {
    rotate(90, [1,0,0]) cylinder(r=5,h=8,center=true);
    rotate(90, [1,0,0]) cylinder(r=2,h=9,center=true);
  }
}

module n20_folded(length) {
  union(){
    _n20_motor();
    cylinder_length=55+length-44-4;
    translate([44+(cylinder_length/2), 0, 0]) rotate(90, [0, 1, 0]) cylinder(r=6, h=cylinder_length, center=true);
    _n20_end(55+length);
  }
}

module n20_unfolded(length) {
  union(){
    _n20_motor();
    cylinder_length=55+length-44-4;
    translate([44+(cylinder_length/2), 0, 0]) rotate(90, [0, 1, 0]) cylinder(r=6, h=cylinder_length, center=true);
    translate([44+(length/2)+cylinder_length, 0, 0]) rotate(90, [0, 1, 0]) cylinder(r=4.5, h=length, center=true);
    _n20_end(55+2*length);
  }
}
