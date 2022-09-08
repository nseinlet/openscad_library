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
    color("Black") _n20_motor();
    cylinder_length=55+length-44-4;
    color("Silver") translate([44+(cylinder_length/2), 0, 0]) rotate(90, [0, 1, 0]) cylinder(r=6, h=cylinder_length, center=true);
    color("Black") _n20_end(55+length);
  }
}

module n20_unfolded(length) {
    n20_unfolded_partial(length, length);
};

module n20_unfolded_partial(length, unfolded_length) {
  union(){
    color("Black") _n20_motor();
    cylinder_length=55+length-44-4;
    color("Silver") translate([44+(cylinder_length/2), 0, 0]) rotate(90, [0, 1, 0]) cylinder(r=6, h=cylinder_length, center=true);
    color("Gray") translate([44+(unfolded_length/2)+cylinder_length, 0, 0]) rotate(90, [0, 1, 0]) cylinder(r=4.5, h=unfolded_length, center=true);
    color("Black") _n20_end(55+length+unfolded_length);
  }
}
