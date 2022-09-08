module plow_furrow() {
  union() {
    //vertical side
    hull() {
        translate([-1, 27.5, 0]) cube([2, 55, 0.1], center=true);
        translate([-1, 35, 10]) cube([2, 40, 0.1], center=true);
    };
    hull() {
        translate([-1, 27.5, 10]) cube([2, 25, 0.1], center=true);
        translate([-1, 32.5, 20]) cube([2, 25, 0.1], center=true);
    };
    hull() {
        translate([-1, 40, 20]) cube([2, 10, 0.1], center=true);
        translate([-1, 50, 50]) cube([2, 10, 0.1], center=true);
    };
    hull() {
        translate([-1, 45, 50]) cube([2, 20, 0.1], center=true);
        translate([-1, 45, 57]) cube([2, 20, 0.1], center=true);
    };
    // end of vertical side

    //Furrow
    rotate(48, [0, 0, 1]) union() {
      hull() {
        translate([-4, 7, -1]) cube([2, 20, 0.1], center=true);
        translate([2, 13, 1]) cube([2, 20, 0.1], center=true);
      }
      hull() {
        translate([0, 2, 0]) cube([2, 55, 0.1], center=false);
        translate([10, 11, 10]) cube([2, 60, 0.1], center=false);
      };
      hull() {
        translate([10, 11, 10]) cube([2, 60, 0.1], center=false);
        translate([14, 14, 20]) cube([2, 55, 0.1], center=false);
      };
      hull() {
        translate([14, 14, 20]) cube([2, 55, 0.1], center=false);
        translate([10, 45, 30]) cube([2, 10, 0.1], center=false);
      };
    }
  };
}