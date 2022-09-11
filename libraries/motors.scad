module contactor(){
  union(){
    cube([12.5, 11, 20.5], center=true);
    translate([0, 0, (20.5 + 1.6) / 2]) cylinder(r=2, h=1.6, center=true);
    translate([0, 0, (20.5 + 6) / -2]) cylinder(r=3.5, h=6, center=true);
    translate([0, 0, (20.5 + 19) / -2]) cylinder(r=1.5, h=19, center=true);
  }
}

module contactor_folded(){
  union(){
    cube([12.5, 11, 20.5], center=true);
    translate([0, 0, (20.5 + 5) / 2]) cylinder(r=2, h=5, center=true);
    translate([0, 0, (20.5 + 2) / -2]) cylinder(r=3.5, h=2, center=true);
    translate([0, 0, (20.5 + 15) / -2]) cylinder(r=1.5, h=15, center=true);
  }
}