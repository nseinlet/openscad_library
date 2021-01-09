include <n20_linear_actuator.scad>
include <tools.scad>

cylinder_y = 13;
cylinder_z = 77;

module fixation_chassis(pos_x) {
    translate([pos_x,0,30]) difference(){
        union(){
            translate([0,0,40]) cube([2,10,80], center=true);
              translate([0, 0, 80]) rotate(90, [0,1,0]) cylinder(r=5,h=2, center=true);
        };
        //rotation axle
        translate([0,0,80]) rotate(90, [0,1,0]) cylinder(r=2,h=2.1, center=true);
        //cylinder_fix fixings
        for (pos_z=[45:10:70]) translate([0, 0, pos_z]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
    };
}

module bras(pos_x) {
    translate([pos_x, 0, 0]) difference(){
        union(){
            hull() {
                translate([0, 0, 110]) rotate(90, [0, 1, 0]) cylinder(r=5,h=2, center=true);
                translate([0, 130, 100]) rotate(20, [-1, 0, 0]) cube([2,0.1,15], center=true);
            };
            hull() {
                translate([0, 130, 100]) rotate(20, [-1, 0, 0]) cube([2,0.1,15], center=true);
                translate([0, 190, 0]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
            };
            hull() {
                translate([0, 190, 0]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
                translate([0, 200, 0]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
            };
            //cylinder fixture
            hull(){
                translate([0, 123, 85]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
                translate([0, 128, 100]) cube([2,15,1],center=true);
                translate([0, 138, 87]) cube([2,1,15],center=true);
            };
        };
        //rotation axle
        translate([0, 0, 110]) rotate(90, [0,1,0]) cylinder(r=2, h=2.1, center=true);
        //bucket axle
        translate([0, 200, 0]) rotate(90, [0, 1, 0]) cylinder(r=2, h=2.1, center=true);
        //cylinder
        translate([0, 123, 85]) rotate(90, [0, 1, 0]) cylinder(r=2, h=2.1, center=true);
        //rotation triangle
        translate([0, 129, 103]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
        //bucket parrallel
        translate([0, 180, 15]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
        //fixtures
        translate([0, 30, 107]) rotate(90, [0,1,0]) cylinder(r=1, h=2.1, center=true);
        translate([0, 70, 105]) rotate(90, [0,1,0]) cylinder(r=1, h=2.1, center=true);
        translate([0, 110, 101]) rotate(90, [0,1,0]) cylinder(r=1, h=2.1, center=true);
        translate([0, 142, 80]) rotate(90, [0,1,0]) cylinder(r=1, h=2.1, center=true);
        translate([0, 166, 40]) rotate(90, [0,1,0]) cylinder(r=1.5, h=2.1, center=true);
    };
}

module inter_bras(pos_x) {
    translate([pos_x, 0, 0]) difference(){
        union(){
            hull() {
                translate([0, 0, 110]) rotate(90, [0, 1, 0]) cylinder(r=5,h=2, center=true);
                translate([0, 130, 100]) rotate(20, [-1, 0, 0]) cube([2,0.1,15], center=true);
            };
            hull() {
                translate([0, 130, 100]) rotate(20, [-1, 0, 0]) cube([2,0.1,15], center=true);
                translate([0, 190, 0]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
            };
            hull() {
                translate([0, 190, 0]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
                translate([0, 200, 0]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
            };
        };
        //rotation axle
        translate([0, 0, 110]) rotate(90, [0,1,0]) cylinder(r=10, h=2.1, center=true);
        //bucket axle
        translate([0, 200, 0]) rotate(90, [0, 1, 0]) cylinder(r=2, h=2.1, center=true);
        //rotation triangle
        translate([0, 129, 103]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
        //bucket parrallel
        translate([0, 180, 15]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
        //fixtures
        translate([0, 30, 107]) rotate(90, [0,1,0]) cylinder(r=1, h=2.1, center=true);
        translate([0, 70, 105]) rotate(90, [0,1,0]) cylinder(r=1, h=2.1, center=true);
        translate([0, 110, 101]) rotate(90, [0,1,0]) cylinder(r=1, h=2.1, center=true);
        translate([0, 142, 80]) rotate(90, [0,1,0]) cylinder(r=1, h=2.1, center=true);
        translate([0, 166, 40]) rotate(90, [0,1,0]) cylinder(r=1.5, h=2.1, center=true);
    };
}

module cylinder_fix(pos_x){
    translate([pos_x, 0, 0]) difference(){
        union(){
            hull(){
              translate([0, cylinder_y, cylinder_z]) rotate(90, [0, 1, 0]) cylinder(r=4, h=2, center=true);
              translate([0, 0, cylinder_z-5]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
              translate([0, 0, cylinder_z+1]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
            };
            hull()
            {
              translate([0, -9, 120]) rotate(90, [0, 1, 0]) cylinder(r=3, h=2, center=true);
              translate([0, -7, 100]) rotate(90, [0, 1, 0]) cylinder(r=4, h=2, center=true);
            };
            hull()
            {
              translate([0, -7, 100]) rotate(90, [0, 1, 0]) cylinder(r=4, h=2, center=true);
              translate([0, 0, 95]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
            };
            hull()
            {
              translate([0, 0, 95]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
              translate([0, 0, 75]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
            };
        }
        //rotation axle
        translate([0, 0, 110]) rotate(90, [0,1,0]) cylinder(r=6, h=2.1, center=true);
        //cylinder
        translate([0, cylinder_y, cylinder_z]) rotate(90, [0, 1, 0]) cylinder(r=2, h=2.1, center=true);
        //parallel girder
        translate([0, -9, 120]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
        //fixings
        for (pos_z=[75:10:100]) translate([0, 0, pos_z]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
    }
};

module parallel_girder(pos_x){
    translate([pos_x, -9, 120]) difference() {
        union(){
            rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
            hull(){
                rotate(90, [0, 1, 0]) cylinder(r=2, h=2, center=true);
                translate([0,130,0]) rotate(90, [0, 1, 0]) cylinder(r=2, h=2, center=true);
            };
            translate([0,130,0]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
        };
        rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
        translate([0,130,0]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
    };
};

module rotation_triangle(pos_x, angle=0) {
    translate([pos_x, 129, 103]) {
      rotate(angle, [1, 0, 0]) difference() {
        hull(){
            rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
            translate([0, 10, 20]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
            translate([0, -5, 20]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
        }
        rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
        translate([0, 10, 20]) rotate(90, [0, 1, 0]) cylinder(r=2, h=2.1, center=true);
        translate([0, -5, 20]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
      }
  };
};

module bucket_parrallel(pos_x, angle){
    translate([pos_x, 180, 15]) rotate(angle, [1, 0, 0]) difference(){
        union() {
          hull() {
            rotate(90, [0, 1, 0]) cylinder(r=4, h=2, center=true);
            translate([0, 6, 29]) rotate(90, [0, 1, 0]) cylinder(r=4, h=2, center=true);
          };
          hull() {
            translate([0, 6, 29]) rotate(90, [0, 1, 0]) cylinder(r=4, h=2, center=true);
            translate([0, 0, 39]) rotate(90, [0, 1, 0]) cylinder(r=4, h=2, center=true);
          };
        };
        rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
        translate([0, 4, 32]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
        translate([0, 0, 39]) rotate(90, [0, 1, 0]) cylinder(r=2, h=2.1, center=true);
    };
};

module bucket_perpendicular(pos_x, angle){
  translate([pos_x, 204.5, 23]) rotate(angle, [1, 0, 0]) difference(){
      union() {
          hull() {
            rotate(90, [0, 1, 0]) cylinder(r=4, h=2, center=true);
            translate([0, -5, 10]) rotate(90, [0, 1, 0]) cylinder(r=4, h=2, center=true);
          };
          hull() {
            translate([0, -5, 10]) rotate(90, [0, 1, 0]) cylinder(r=4, h=2, center=true);
            translate([0, 0, 31]) rotate(90, [0, 1, 0]) cylinder(r=4, h=2, center=true);
          };
      };
      rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
      translate([0, 0, 31]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
  };
};

module bucket_vertical_fix(pos_x, angle){
  translate([pos_x, 200, 0]) rotate(angle, [1, 0, 0]) difference(){
    hull(){
        rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
        translate([0, 15, 0]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
        translate([0, 10, 40]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
    };
    rotate(90, [0, 1, 0]) cylinder(r=2, h=2.1, center=true);
    translate([0, 15, 0]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
    translate([0, 12, 20]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
    translate([0, 10, 40]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.1, center=true);
  };
};

module girder() {
  translate([0, 166, 40]) difference() {
    union() {
      hull(){
        translate([22, 0, 0]) rotate(30, [1,0,0]) rounded_cube(2, 10, 10, 2);
        translate([10, 0, 0]) rotate(30, [1,0,0]) rounded_cube(2, 10, 7, 2);
      };
      hull(){
        translate([10, 0, 0]) rotate(30, [1,0,0]) rounded_cube(2, 10, 7, 2);
        translate([-10, 0, 0]) rotate(30, [1,0,0]) rounded_cube(2, 10, 7, 2);
      };
      hull(){
        translate([-10, 0, 0]) rotate(30, [1,0,0]) rounded_cube(2, 10, 7, 2);
        translate([-22, 0, 0]) rotate(30, [1,0,0]) rounded_cube(2, 10, 10, 2);
      };
    };
    rotate([0, 90, 0]) cylinder(r=1.5, h=60, center=true);
  };
};

//folded
module _front_loader_folded() {
for (mult=[1,-1]) {
  rotate_around_axle(mult*29, 0, 110, -8, 1, 0, 0) {
      for (pos_x=[24,34]) {
        bras(mult*pos_x);
        bucket_perpendicular(mult*pos_x, 40);
      };
      for (pos_x=[26:2:32]) inter_bras(mult*pos_x);
      for (pos_x=[22,36]) {
        rotation_triangle(mult*pos_x, 15);
        bucket_parrallel(mult*pos_x, -1);
        bucket_vertical_fix(mult*pos_x, 20);
      };
      girder();
  };
  rotate_around_axle(0, -9, 120, -7, 1, 0, 0) for (tmp_z=[26:2:32]){
     parallel_girder(mult*tmp_z);
     rotate_around_axle(0, 135, 124, 56, -1, 0, 0) translate([mult*29, 220, 122]) rotate([180, 180, 90]) n20_folded(30);
  };
  for (pos_x=[24,34]) {
    cylinder_fix(mult*pos_x);
  };
  for (tmp_z=[26:2:32])fixation_chassis(mult*tmp_z);
  rotate_around_axle(mult*29, cylinder_y, cylinder_z, -5, 1, 0, 0) translate([mult*29, cylinder_y, cylinder_z]) rotate([180, 0, 90]) n20_folded(50);
}
}

//base position
module _front_loader(){
for (mult=[1,-1]) {
  for (pos_x=[24,34]) {
    bras(mult*pos_x);
    translate([0, 2.9, -0.3]) bucket_perpendicular(mult*pos_x, 41);
  };
  for (pos_x=[26:2:32]) inter_bras(mult*pos_x);
  for (pos_x=[22,36]) {
    rotation_triangle(mult*pos_x, 9);
    bucket_parrallel(mult*pos_x, -5);
    bucket_vertical_fix(mult*pos_x, 15);
  };
  girder();
  rotate_around_axle(0, -9, 120, 0.5, 1, 0, 0) for (tmp_z=[26:2:32]){
    parallel_girder(mult*tmp_z);
    rotate_around_axle(0, 136, 123, 56, -1, 0, 0) translate([mult*29,221,122]) rotate([180, 180, 90]) n20_folded(30);
    //translate([mult*29,136,123]) rotate(90, [0, 1, 0]) cylinder(r=2, h=21, center=true);
  };
  for (pos_x=[24,34]) {
    cylinder_fix(mult*pos_x);
  };
  for (tmp_z=[26:2:32])fixation_chassis(mult*tmp_z);
  rotate_around_axle(mult*29, cylinder_y, cylinder_z, 4, 1, 0, 0) translate([mult*29, cylinder_y, cylinder_z]) rotate([180, 0, 90]) n20_unfolded_partial(50, 4.5);
}
}

//unfolded
module _front_loader_unfolded() {
for (mult=[1,-1]) {
  rotate_around_axle(mult*29, 0, 110, 81, 1, 0, 0) {
      for (pos_x=[24,34]) {
        bras(mult*pos_x);
        translate([0, 31, -33.6]) bucket_perpendicular(mult*pos_x, 55);
      };
      for (pos_x=[26:2:32]) inter_bras(mult*pos_x);
      for (pos_x=[22,36]) {
        rotation_triangle(mult*pos_x,-42);
        bucket_parrallel(mult*pos_x, -84);
        bucket_vertical_fix(mult*pos_x, -70);
      };
      girder();
  };
  rotate_around_axle(0, -9, 120, 81.5, 1, 0, 0) for (tmp_z=[26:2:32]){
    parallel_girder(mult*tmp_z);
    rotate_around_axle(0, 132.4, 109.5, 54, -1, 0, 0) translate([mult*29, 247, 109.5]) rotate([180, 180, 90]) n20_unfolded(30);
    //translate([mult*29, 132.4, 109.5]) rotate(90, [0, 1, 0]) cylinder(r=2, h=21, center=true);
  };
  for (pos_x=[24,34]) {
    cylinder_fix(mult*pos_x);
  };
  for (tmp_z=[26:2:32])fixation_chassis(mult*tmp_z);
  rotate_around_axle(mult*29, cylinder_y, cylinder_z, 78, 1, 0, 0) translate([mult*29, cylinder_y, cylinder_z]) rotate([180, 0, 90]) n20_unfolded(50);
}
}
