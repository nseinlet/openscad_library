module n20_motor_slot(){
   translate([0,-0.1,8]) cube([10,12,26], center=true);
   translate([0,-0.1,-13]) cube([10,10,16], center=true);
}

module n20_motor_endless_screw(){
 color([1,0,0]) union() {
   translate([0,-0.1,8]) cube([10,12,26], center=true);
   translate([0,-0.1,-13]) cylinder(r=4,h=16, center=true);
 }
}

module n20_motor(){
 color([1,0,0]) union() {
   translate([0,-0.1,8]) cube([10,12,26], center=true);
   translate([0,-0.1,-13]) cylinder(r=1.25,h=16, center=true);
 }
}
