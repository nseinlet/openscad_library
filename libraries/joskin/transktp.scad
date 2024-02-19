/******************************************

Joskin TransKTP 22/50 for blocher chassis
Variable width. 160 for wheeled chassis, 210 for tracked one.

******************************************/

include <servo.scad>

module door_arm(){
  rotate(90, [0, -1, 0]) difference() {
    translate([0, 0, -1]) linear_extrude(2) {
      polygon(points = [
        [36, 0],
        [31.5, 36],
        [32, 38.5],
        [34.6, 41.8],
        [38, 43],
        [35.7, 90.2],
        [34.5, 93],
        [0, 143.5],
        [48, 143.5],
        [56.8, 120],
        [56.8, 0]
      ]);
    };
    //Rotation
    translate([53.7, 23,0]) cylinder(h=3, r=1.5, center=true);
    
    //Cylinder
    translate([38, 3,0]) cylinder(h=3, r=1, center=true);

    //Door fix
    translate([41, 140, 0]) cylinder(h=3, r=1.5, center=true);
    translate([24, 140, 0]) cylinder(h=3, r=1.5, center=true);
    translate([7, 140, 0])  cylinder(h=3, r=1.5, center=true);
  }
}

module door(width){
  size = width/2;
  rotate(90, [1, 0, 0]) difference() {
    cube([width-2, 86, 7], center=true);
    for (mult=[-1,1]){
      translate([0, 0, -4]) linear_extrude(4) polygon(points = [
          [mult*(size-47), -28],
          [mult*(size-15), -28],
          [mult*(size-15), 33],
          [mult*(size-41), 33]
      ]);
      translate([0, 0, -4]) linear_extrude(4) polygon(points = [
          [mult*(size-61), -28],
          [mult*(size-99), -28],
          [mult*(size-95), 33],
          [mult*(size-61), 33]
      ]);
    }

  }
}

module _box(size, width){
  lrg=width/2;
  translate([0, 6, 0]) difference() {
    translate([0, size, 0]) rotate(90, [1, 0, 0])  linear_extrude(size+22) {
      polygon(points = [
        [lrg-8, 95],
        [lrg-8, 45],
        [lrg-11, 31],
        [lrg-16, 23],
        [lrg-25, 15],
        [25-lrg, 15],
        [16-lrg, 23],
        [11-lrg, 31],
        [8-lrg, 45],
        [8-lrg, 95],
        [6-lrg, 95],
        [6-lrg, 45],
        [9-lrg, 31],
        [14-lrg, 23],
        [25-lrg, 13],
        [lrg-25, 13],
        [lrg-14, 23],
        [lrg-9, 31],
        [lrg-6, 45],
        [lrg-6, 95],
      ]);
    };
    rotate(13, [1,0,0]) translate([0,-20,0]) cube([210, 46, 250], center=true);
  };
}

module box_rear_block(size, width){
lrg=width/2;
translate([0, size + 6, 0]) rotate(90, [1, 0, 0])  linear_extrude(15) {
      polygon(points = [
        [6-lrg, 95],
        [6-lrg, 45],
        [9-lrg, 31],
        [14-lrg, 23],
        [25-lrg, 13],
        [-25+lrg, 13],
        [-14+lrg, 23],
        [-9+lrg, 31],
        [-6+lrg, 45],
        [-6+lrg, 95],
        [lrg-2, 95],
        [lrg-2, 8],
        [2-lrg, 8],
        [2-lrg, 95],
      ]);
    };
};

module box_border(size){
  translate([-2, -19, 80]) difference() {
    cube([4, size+10,15]);
    rotate(13, [1, 0, 0]) translate([0, -17.5, 7]) cube([20, 50, 20], center=true);
  }
}

module box_beam(size){
  translate([0, size/2-14, 8]) cube([12, size-40, 10], center=true);
}

module box_front_bottom(){
  translate([0, 3, 3.05]) hull(){
    translate([0, 0, 0]) cube([80, 6, 0.1], center=true);
    translate([0, 0, 9.9]) cube([90, 6, 0.1], center=true);
  }
}

module box_front(width){
  lrg=width/2;
  translate([0, 9, 0]) rotate(103, [1, 0, 0]) difference() {
    union() {
      linear_extrude(2) {
        polygon(points = [
          [6-lrg, 98],
          [6-lrg, 46],
          [9-lrg, 31.8],
          [14-lrg, 23.5],
          [25-lrg, 13],
          [lrg-25, 13],
          [lrg-14, 23.5],
          [lrg-9, 31.8],
          [lrg-6, 46],
          [lrg-6, 98],
        ]);
      };
      translate([0,91,4]) cube([width-4, 17, 4], center=true);
      for (mult=[-1,1]) hull(){
        translate([mult*39.7, 13, 4]) cube([10, 0.1, 4], center=true);
        translate([mult*47, 84, 4]) cube([25, 0.1, 4], center=true);
      }
    };

    translate([0,8.9,3]) rotate(13, [-1,0,0]) cube([width+30,10,10], center=true);
    translate([0,102.6,0]) rotate(13, [-1,0,0]) cube([width+30,10,10], center=true);
  };
}