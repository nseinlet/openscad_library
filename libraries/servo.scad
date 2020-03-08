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
