include <servo.scad>
include <profiles.scad>

module _servo_cut() {
  translate([1.5, 37, 12]) cube([3, 40, 20], center=true);
  translate([1.5, 5, 7]) cube([3, 10, 10], center=true);
}

module low_loader() {
  difference(){
    union(){
      //Right
      profile_carre(10, 281, true);
      translate([10, 10, 0]) profile_carre(6, 261, false);
      //Rear
      translate([0, 281, 0]) rotate(90, [0, 0, -1]) profile_carre(10, 170, true);
      //Left
      translate([160, 10, 0]) mirror([1, 0, 0]) profile_carre(6, 261, false);
      translate([170, 0, 0]) mirror([1, 0, 0]) profile_carre(10, 281, true);
      //Center
      translate([80, 10, 0]) mirror([1, 0, 0]) profile_carre(6, 261, false);
      translate([80, -79, 0]) profile_carre(10, 350, false);
      translate([90, 10, 0]) profile_carre(6, 261, false);
      //Front
      translate([170, 0, 0]) rotate(90, [0, 0, 1]) profile_carre(10, 170, true);
      //Support servos
      translate([117, 271, -2]) difference() {
        rotate(90, [0, -1, 0]) profile_l(20, 65, thickness=2);
        translate([-2.5, 0, 0]) _servo_cut();
      };
      translate([53, 271, -2]) difference() {
        profile_l(20, 65, thickness=2);
        _servo_cut();
      };
      //Servos
      translate([58, 288, 20]) rotate(90, [-1, 0, 0]) rotate(90, [0, -1, 0]) servo_powerhd_1501mg();
      translate([112, 288, 0]) rotate(90, [-1, 0, 0]) rotate(180, [0, 0, 1]) rotate(90, [0, -1, 0]) servo_powerhd_1501mg();
    }
  }
}
