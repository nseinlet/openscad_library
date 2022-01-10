include <tools.scad>

module _elementcrosskilldent(rang, angle){
    translate([rang,0,0])
    rotate(angle, [0, 1, 0])
    rotate(90, [0, 1, 0])
    for(angle = [0 : 30 : 180]) rotate(angle,[0,0,1])
       difference() {
            cylinder(h=4.5, r=10);
            cylinder(h=4.5, r1=7, r2=9);
            translate([11, 0, 3]) cube(size=[20,20,6], center=true);
            translate([-11, 0, 3]) cube(size=[20,20,6], center=true);
        }
};

module elementcrosskill(rang){
    translate([0,rang,10])
    union(){
        rotate(90, [0, 1, 0]) difference() {
            cylinder(h=3, r=10);
            cylinder(h=3, r=7);
        }

        difference() {
            union()
            {
                translate([1.5, 0, 4]) cube(size=[3, 3, 9], center=true);
                rotate(120, [1, 0, 0])translate([0, -1.5, 0]) cube(size=[3, 3, 9]);
                rotate(-120, [1, 0, 0])translate([0, -1.5, 0]) cube(size=[3, 3, 9]);
                translate([1.5, 0, 0]) rotate(90, [0, 1, 0]) cylinder(h=13, r=2.5, center=true);
            }
            translate([1.5, 0, 0]) rotate(90, [0, 1, 0]) cylinder(h=14, r=1.5, center=true);
        }
        _elementcrosskilldent(3,0);
        _elementcrosskilldent(0,180);
    }
}

module chassiscrosskill(){
  difference() {
    union() {
      translate([-100, 8, 0]) cube(size=[10, 26, 10], center=true);
      translate([100, 8, 0]) cube(size=[10, 26, 10], center=true);
      translate([0, -2, 0]) difference() {
          cube(size=[190.2, 6, 10], center=true);
          translate([0,-3, 0]) cube(size=[190, 3, 6], center=true);
          translate([0, 3, 0]) cube(size=[190, 3, 6], center=true);
      };
      translate([0, 18, 0]) difference() {
          cube(size=[190, 6, 10], center=true);
          translate([0,-3, 0]) cube(size=[190, 3, 6], center=true);
          translate([0, 3, 0]) cube(size=[190, 3, 6], center=true);
      };
      hull() {
          translate([30, 10, 5]) cube([14, 30, 0.1], center=true);
          translate([2, 15,45]) cube([4, 10, 0.1], center=true);
      };
      hull() {
          translate([-30, 10, 5]) cube([14, 30, 0.1], center=true);
          translate([-2, 15, 45]) cube([4, 10, 0.1], center=true);
      };
      translate([0, 15, 47]) difference() {
        cube([10, 10, 10], center=true);
        translate ([0,0,3]) cube([4, 10, 10], center=true);
      };
      translate([3.5, 20, 47]) rotate(90,[0,1,0]) cylinder(r=5,h=3, center=true);
      translate([-3.5, 20, 47]) rotate(90,[0,1,0]) cylinder(r=5,h=3, center=true);

      translate([-35, 22, 0]) cube(size=[3, 6, 10], center=true);
      translate([-25, 22, 0]) cube(size=[3, 6, 10], center=true);
      translate([25, 22, 0]) cube(size=[3, 6, 10], center=true);
      translate([35, 22, 0]) cube(size=[3, 6, 10], center=true);

      translate([-35, 26, 0]) rotate(90,[0,1,0]) cylinder(r=5,h=3, center=true);
      translate([-25, 26, 0]) rotate(90,[0,1,0]) cylinder(r=5,h=3, center=true);
      translate([25, 26, 0]) rotate(90,[0,1,0]) cylinder(r=5,h=3, center=true);
      translate([35, 26, 0]) rotate(90,[0,1,0]) cylinder(r=5,h=3, center=true);
    };
    translate ([0, 25, 0]) rotate (90, [0,1,0]) cylinder(r=1.5, h=80, center=true);
    translate ([0, 20, 47]) rotate (90, [0,1,0]) cylinder(r=1.5, h=80, center=true);

    translate ([100, 8, 0]) cylinder(r=1.5, h=12, center=true);
    translate ([-100, 8, 0]) cylinder(r=1.5, h=12, center=true);
  };
}

module chassiscrosskill_axe(){
  difference() {
    hull() {
      translate([100, 8, -5]) cube(size=[10, 26, 1], center=true);
      translate([100, 8, -21]) rotate(90, [0, 1, 0]) cylinder(h=10, r=5, center=true);
    }
    //Ball bearing for axle
    translate([97.5, 8, -21]) rotate(90, [0, 1, 0]) cylinder(h=6, r=3, center=true);
    //Screw
    translate ([100, 8, 0]) cylinder(r=1.5, h=30, center=true);
    //nut
    translate([98, 8, -10]) cube(size=[10, 6, 2], center=true);
  };
};

module chassiscrosskill2(){
    union() {
        translate([0, 0, 2.5]) cube([210, 5, 5], center=true);
        translate([0, 20, 2.5]) cube([63, 5, 5], center=true);
        for (mult=[1,-1]) {
          translate([mult*29, 10, 2.5]) cube([5, 15, 5], center=true);
          translate([mult*67, 10, 2.5]) rotate(15, [0, 0, mult*-1]) cube([80, 5, 5], center=true);
          //arm support
          translate([mult*22, 27, 2.5]) cube([2, 10, 5], center=true);
          translate([mult*30, 27, 2.5]) cube([2, 10, 5], center=true);
          //thirdpoint
          translate([mult*14, 20, 24]) rotate(35, [0,mult*-1,0]) cube([5, 5, 50], center=true);
          //Warn sign
          translate([mult*90, 0, 5+7.5]) cube([5, 5, 15], center=true);
        }
        //thirdpoint support
        rotate(24, [-1, 0, 0]) translate([0, 0, 25]) cube([5, 5, 48], center=true);
        difference() {
        translate([0, 20, 50]) cube([7, 5, 20], center=true);
        translate([0, 20, 58]) cube([4, 5.1, 20], center=true);
        };
    }
}

module chassiscrosskill2_axle(x){
    translate([x, 0, 0]) difference() {
      hull() {
        translate([0, 0, 2.5]) cube([2, 5, 5], center=true);
        translate([0, -12, -12]) rotate(90, [0, 1, 0]) cylinder(r=6, h=2, center=true);
        translate([0,  12, -12]) rotate(90, [0, 1, 0]) cylinder(r=6, h=2, center=true);
      };
      translate([0, -12, -12]) rotate(90, [0, 1, 0]) cylinder(r=3, h=2.5, center=true);
      translate([0,  12, -12]) rotate(90, [0, 1, 0]) cylinder(r=3, h=2.5, center=true);
    }
}

module elementcrosskill2(rang){
    translate([0,rang,10]) union(){
        rotate(90, [0, 1, 0]) difference() {
            cylinder(h=5, r=10);
            translate([0,0,-0.1]) cylinder(h=5.2, r=8.5);
        };
        rotate(90, [0, 1, 0]) difference() {
            cylinder(h=5, r=3);
            translate([0,0,-0.1]) cylinder(h=5.2, r=1.5);
        };
        for (angle=[0:120:240]) rotate(angle, [1, 0, 0]) translate([0,-1, 2]) cube([5, 2, 7]);
        for (angle=[0:10:359]) rotate(angle, [1, 0, 0]) translate([0, 0, 10]) rotate(90, [0, 1, 0]) cylinder(h=5, r=1);
    };
}

module warnsign(rang) {
    translate([rang, -3.5, 22]) rotate(90, [0, 0, 1]) rounded_cube(2,20,20,2);
}
