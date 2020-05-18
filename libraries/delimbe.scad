include <servo.scad>

module main_tank() {
  /*
  Real one is 950mm high
              700mm diameter
  in 1/16:
  59 mm high
  43 mm diameter, 21.5 r
  */
    difference() {
      //Outside tank
      union() {
        hull(){
         translate([0,0,25]) cylinder(r=21.5, h=30, center=true);
         translate([0,0,-12]) cylinder(r=15, h=20, center=true);
        }
        hull(){
         translate([0,0,25]) cylinder(r=21.5, h=7, center=true);
         translate([0,0,25]) cylinder(r=23, h=5, center=true);
        }
      }
      hull(){
       translate([0,0,20]) cylinder(r=19, h=40, center=true);
       translate([0,0,-12]) cylinder(r=12, h=20, center=true);
      }
      base();
    }
}

module base() {
  union() {
    //Motor fixture
    difference() {
        translate([-6, -7, -20]) cube([12, 14, 10]);
        translate([-5, -6, -21]) cube([10, 12, 12]);
    }
    //Bottom
    translate([0,0,-21]) difference(){
      //Main
      translate([0,-5,0]) cube([35, 42, 2], center=true);
      cylinder(r=14, h=2.2, center=true);
      //Servo arm
      hull() {
        translate([0,-15,0]) cylinder(r=2, h=2.2, center=true);
        translate([0,-27,0]) cylinder(r=2, h=2.2, center=true);
      }
      //Stand fixture
      translate([ 15.5, -15, 0]) cylinder(r=1, h=18, center=true);
      translate([ 15.5,   5, 0]) cylinder(r=1, h=18, center=true);
      translate([-15.5, -15, 0]) cylinder(r=1, h=18, center=true);
      translate([-15.5,   5, 0]) cylinder(r=1, h=18, center=true);
    }
    translate([0,0,-21]) difference(){
      //motor
      cube([12, 28, 2], center=true);
      cylinder(r=1.5, h=2.2, center=true);
      translate([0,-15,0]) cylinder(r=2, h=2.2, center=true);
    }
    //Servo fix
      for (mult=[1,-1]){
        difference(){
          hull(){
             translate([mult*14.5, -21, -20  ]) cube([6, 10, 0.1], center=true);
             translate([mult*14.5, -30,  -8.5]) cube([6, 12, 0.1], center=true);
          }
          translate([mult*14.5, -30,  -18.5]) cylinder(r=1,h=20);
        }
      }
      //translate([-12, -24, -5]) rotate(180, [1, 0, 0])  servo_9g();

  }
}

module stand() {
  translate([0, 0, -25.5]) difference() {
      translate([0, -5, -1]) cube([35, 42, 9], center=true);
      //base
      translate([0,-5,3.5]) cube([28, 42, 4], center=true);
      //propeller
      hull() {
        translate([0, 0, -1.3]) cylinder(r=12.2, h=6, center=true);
        translate([0, 16, 1]) cube([32, 1, 9], center=true);
      }
      translate([0, 0, -5.3]) cylinder(r=3.1, h=6, center=true);
      //Servo arm
      hull() {
        translate([0,-15,0]) cylinder(r=2, h=3.2, center=true);
        translate([5, -27,0]) cube([20, 1, 3], center=true);
      }
      //Base fixture
      translate([ 15.5, -15, 0]) cylinder(r=1, h=18, center=true);
      translate([ 15.5,   5, 0]) cylinder(r=1, h=18, center=true);
      translate([-15.5, -15, 0]) cylinder(r=1, h=18, center=true);
      translate([-15.5,   5, 0]) cylinder(r=1, h=18, center=true);

      //Smaragd fixture
      translate([0, -21, -5.5]) cube([40, 8, 8], center=true);
  }
}

module _half_valve() {
  union() {
    translate([13,-5,-23]) cube([2, 42, 2], center=true);
    translate([7, -2,-23]) cube([10, 29, 2], center=true);
    translate([7, -15,-23]) cube([14, 22, 2], center=true);
  }
}

module valve() {
  difference() {
  union() {
    _half_valve();
    mirror([1,0,0]) _half_valve();
  }
  //Servo arm fixture
  translate([0,-15,-23]) cylinder(r=1, h=2.2, center=true);
 }
}

module propeller(){
  translate([0, 0, -26]) difference() {union() {
    translate([0, 0, -1.5]) cylinder(r=12, h=1, center=true);
    cylinder(r=6, h=4, center=true);
    for (ang=[0:45:179]) {
      rotate(ang, [0,0,1])cube([24, 1, 4], center=true);
    }
  }
  cylinder(r=1.5, h=4, center=true);
  rotate(15, [0, 0, 1]) rotate(90,[0,1,0]) cylinder(r=0.7, h=15);
}
}

module servo_arm() {
  translate([0, 0, -25]) difference() {
    hull() {
      translate([0,-15,0]) cylinder(r=1.8, h=2, center=true);
      translate([10,-30,0]) cylinder(r=1.8, h=2, center=true);

    }
    translate([0,-15,0]) cylinder(r=1, h=3.2, center=true);
    translate([10,-30,0]) cylinder(r=1, h=3.2, center=true);
  }
}
