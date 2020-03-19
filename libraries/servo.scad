module servo_powerhd_1501mg() {
  difference(){
    union(){
      translate([0, 0, 2.5]) cube([40, 20, 8]);
      translate([-7, 0, 0]) cube([52, 20, 2.5]);
      translate([0, 0, -26]) cube([40, 20, 26]);
      translate([10, 10, 10.5]) cylinder(r=3, h=6);
    }
    translate([-5, 5, -0.25]) cylinder(r=2.3, h=3);
    translate([-5, 15, -0.25]) cylinder(r=2.3, h=3);
    translate([43, 5, -0.25]) cylinder(r=2.3, h=3);
    translate([43, 15, -0.25]) cylinder(r=2.3, h=3);
  }
}

module servo_turnigy_tgy225mg() {
  difference(){
    union(){
      translate([0, 0, 2.5]) cube([32, 16, 5]);
      translate([-6, 0, 0]) cube([44, 16, 2.5]);
      translate([0, 0, -22]) cube([32, 16, 22]);
      translate([10, 8, 7.5]) cylinder(r=3, h=6);
    }
    translate([-4, 4, -0.25]) cylinder(r=2.3, h=3);
    translate([-4, 12, -0.25]) cylinder(r=2.3, h=3);
    translate([36, 4, -0.25]) cylinder(r=2.3, h=3);
    translate([36, 12, -0.25]) cylinder(r=2.3, h=3);
  }
}
