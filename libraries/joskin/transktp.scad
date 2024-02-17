/******************************************

Joskin TransKTP 22/50 for blocher chassis

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

module door(){
  rotate(90, [1, 0, 0]) difference() {
    cube([158, 86, 7], center=true);
    translate([0, 0, -4]) linear_extrude(4) polygon(points = [
        [33, -28],
        [70, -28],
        [70, 33],
        [40, 33]
    ]);
    translate([0, 0, -4]) linear_extrude(4) polygon(points = [
        [-33, -28],
        [-70, -28],
        [-70, 33],
        [-40, 33]
    ]);
    translate([0, 0, -4]) linear_extrude(4) polygon(points = [
        [19, -28],
        [-19, -28],
        [-19, 33],
        [19, 33]
    ]);

  }
}