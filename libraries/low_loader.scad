include <servo.scad>
include <profiles.scad>

module _servo_cut() {
  translate([1.5, 33, 10.5]) cube([3, 32, 17], center=true);
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
        rotate(90, [0, -1, 0]) profile_l(20, 57, thickness=2);
        translate([-2.5, 0, 0]) _servo_cut();
      };
      translate([53, 271, -2]) difference() {
        profile_l(20, 57, thickness=2);
        _servo_cut();
      };
      //Servos
      translate([58, 288, 16]) rotate(90, [-1, 0, 0]) rotate(90, [0, -1, 0]) servo_turnigy_tgy225mg();
      translate([112, 288, 0]) rotate(90, [-1, 0, 0]) rotate(180, [0, 0, 1]) rotate(90, [0, -1, 0]) servo_turnigy_tgy225mg();
    }
  }
}

module corner_join(inner_size, length) {
  difference(){
    union(){
      cube([inner_size, length, inner_size]);
      cube([length, inner_size, inner_size]);
    }
    for(pos=[inner_size*2:10:length]) {
      translate([inner_size/2, pos, -0.5]) cylinder(r=1.1, h=inner_size+1);
      translate([pos, inner_size/2, -0.5]) cylinder(r=1.1, h=inner_size+1);
    }
  }
}

module cross_join(inner_size, profile_width) {
  difference(){
    union(){
      translate([profile_width, 0, 0]) cube([inner_size, inner_size+2*profile_width, inner_size/2]);
      translate([0, profile_width, inner_size/2]) cube([inner_size+2*profile_width, inner_size, inner_size/2]);
    }
    translate([inner_size/2+profile_width, inner_size/2+profile_width, -0.5]) cylinder(r=1.1, h=inner_size+1);
  }
}

module wheel_support() {
  difference() {
    union(){
      translate([0,0,10]) cylinder(r=6, h=10);
      hull() {
          //Main axle
          cylinder(r=6, h=10);
          translate([20,0,0]) cylinder(r=6, h=10);
      }
    }
    //Wheel axle
    cylinder(r=3.5, h=20);
    //Servo fixing
    hull() {
      translate([16,0,0]) cylinder(r=4, h=2.5);
      translate([30,0,0]) cylinder(r=4, h=2.5);
    }
    hull() {
      translate([15,0,2.5]) cylinder(r=3, h=4.5);
      translate([30,0,2.5]) cylinder(r=3, h=4.5);
    }
  }
}
