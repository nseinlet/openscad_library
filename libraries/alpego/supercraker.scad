include <tools.scad>

girder_pos=[[49, 49.5], [108, 49.5], [78.5, 84], [18.5, 78.5]];
ploughshare_holes=[[0, -4, -18],[0, -6, -22],[0, -8, -26],[0, -10, -30],[0, -12, -34]];
spacer_height=2.1;

inter_ploughshare=30;

module girder(pos_y, pos_z) {
translate([0, pos_y, pos_z]) rotate(45, [1, 0, 0])  difference(){
    cube([266, 8, 8], center=true);
    //cube([266, 6, 6], center=true);
  }
}

module girder_square_bolt(pos_x, pos_y, pos_z) {
  translate([pos_x, pos_y, pos_z]) rotate(45, [1, 0, 0])  difference(){
      cube([16, 6, 6], center=true);
      rotate(90, [0, 1, 0]) cylinder(r=1.25, h=17, center=true);
    }
}

module girder_locker(pos_x, pos_y, pos_z) {
  translate([pos_x, pos_y, pos_z]) rotate(45, [1, 0, 0])  difference(){
    rounded_cube(2, 16, 16, 2);
    rotate(90, [0, 1, 0]) cylinder(r=1.25, h=3, center=true);
    for(y_mult=[1,-1]){for(z_mult=[1,-1]){
       translate([0,y_mult*6,z_mult*6]) rotate(90, [0, 1, 0]) cylinder(r=1, h=3, center=true);
    }}
  }
}

module side_panel(pos_x){
  translate([pos_x, 0, 0]) difference(){
    union() {
      hull() {
        translate([0, 45  , 45]) cube([2, 12  ,  4], center=true);
        translate([0, 48  , 49]) cube([2, 14.5, 12], center=true);
        translate([0, 60.5, 60]) cube([2,  8  , 12], center=true);
      };
      translate([0, 78.5, 53]) scale([1.0, 2.1, 1.0]) difference() {
        rotate(90, [0, 1, 0]) cylinder(r=18, h=2, center=true);
        rotate(90, [0, 1, 0]) cylinder(r=6.6, h=2.5, center=true);
        translate([0, 0, -19]) cube([2.5, 40, 40],center=true);
      };
      hull() {
        translate([0, 112  , 45]) cube([2, 12  ,  4], center=true);
        translate([0, 109  , 49]) cube([2, 14.5, 12], center=true);
        translate([0,  96.5, 60]) cube([2, 8   , 12], center=true);
      };
    }
    _girders(true);
  }
}

module depth_control(pos_x){
  translate([pos_x, 150, 30]) rotate(21, [1, 0, 0]) difference(){
    translate([0, 6, 60]) rounded_cube(2, 12, 120, 2);
    translate([0, 6, 6]) rotate(90, [0, 1, 0]) cylinder(r=1, h=10, center=true);
    translate([0, 6, 10]) rotate(90, [0, 1, 0]) cylinder(r=1, h=10, center=true);
  };
}

module depth_control_roll_fix(pos_x){
  translate([pos_x, 150, 30]) rotate(21, [1, 0, 0]) difference(){
    union(){
      translate([0, 6, 5]) rounded_cube(2, 12, 16, 5);
      translate([0, 12, 2]) cube([2, 16, 10], center=true);
      intersection() {
        difference(){
          translate([0, 20, -10]) rotate(90, [0, 1, 0]) cylinder(r=17, h=2, center=true);
          translate([0, 18, -15]) rotate(90, [0, 1, 0]) cylinder(r=12, h=2.5, center=true);
        }
        translate([0, 30,0]) cube([2,20,40], center=true);
      };
      translate([0, 31, -20]) rotate(90, [0, 1, 0]) cylinder(r=2.8, h=2, center=true);
    };
    //Leveller
    translate([0, 6, 6]) rotate(90, [0, 1, 0]) cylinder(r=1, h=10, center=true);
    translate([0, 6, 10]) rotate(90, [0, 1, 0]) cylinder(r=1, h=10, center=true);
    //leveller cylinder
    translate([0, 18, 4]) rotate(90, [0, 1, 0]) cylinder(r=1, h=2.5, center=true);
    //roll cylinder
    translate([0, 33, -5]) rotate(90, [0, 1, 0]) cylinder(r=1, h=2.5, center=true);
    //roll
    translate([0, 31, -20]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=2.5, center=true);
  };
}

module side_leveller_fixture(pos_x){
  translate([pos_x, 136, 83]) rotate(21, [1,0,0]) difference(){
    union() {
      rounded_cube(2, 20, 32, 4);
      hull() {
        translate([0,9,10]) rotate(90, [0,1,0]) cylinder(r=5, h=2, center=true);
        translate([0,15,10]) rotate(90, [0,1,0]) cylinder(r=2.5, h=2, center=true);
      }
    }
    for (pos_y=[-7,7]){
      for (pos_z=[-10:5:10]){
        translate([0,pos_y,pos_z]) rotate(90, [0,1,0]) cylinder(r=1, h=2.5, center=true);
      };
    };
    translate([0,15,10]) rotate(90, [0,1,0]) cylinder(r=1, h=2.5, center=true);
  };
}

module side_leveller(pos_x){
  translate([pos_x, 0, 0]) difference(){
    union() {
      hull() {
        translate([0, 78.5, 81]) rounded_cube(2, 20, 20, 4);
        translate([0, 108, 49.5]) rotate(70, [1,0,0]) rounded_cube(2, 16, 16, 4);
        translate([0, 118, 75]) rotate(21, [1,0,0]) cube([2, 20, 30], center=true);
      };
      translate([0, 133.5, 67.5]) rotate(21, [1,0,0]) cube([2, 4, 5], center=true);
      side_leveller_fixture(0);
    }
    translate([0, 70, 41]) rotate(90, [0,1,0]) cylinder(r=30, h=2.5, center=true);
    _girders(true);
  }
}

module roll_support(pos_x){
  translate([pos_x, 188, 21]) difference(){
    union() {
      hull() {
        rounded_cube(2, 48, 12, 2);
        translate([0, -26.5, 4]) rotate(90, [0,1,0]) cylinder(r=2, h=2, center=true);
        translate([0, -26.5, 3]) rotate(90, [0,1,0]) cylinder(r=2, h=2, center=true);
      };
      translate([0, -16, 1]) rounded_cube(2, 14, 14, 2);
      hull() {
        translate([0, 16, 3]) rounded_cube(2, 14, 14, 2);
        translate([0, 6, 4]) rotate(90, [0,1,0]) cylinder(r=2, h=2, center=true);
      }
      hull() {
        translate([0, 17, 1]) rounded_cube(2, 14, 14, 2);
        translate([0, 32, 21]) rounded_cube(2, 14, 14, 2);
      }
    };
    //Rounded rear
    hull() {
      translate([0, 12, 20.5]) rotate(90, [0,1,0]) cylinder(r=11, h=2.5, center=true);
      translate([0, 12, 28]) rotate(90, [0,1,0]) cylinder(r=11, h=2.5, center=true);
    };
    //Pivot axle
    translate([0, -2, 1.5]) rotate(90, [0,1,0]) cylinder(r=1.5, h=2.5, center=true);
    //Front roll
    translate([0, -16, 0]) rotate(90, [0,1,0]) cylinder(r=1.5, h=2.5, center=true);
    //Rear roll
    translate([0, 18, 0]) rotate(90, [0,1,0]) cylinder(r=1.5, h=2.5, center=true);
    //Fixture
    translate([0, 26, 22]) rotate(90, [0,1,0]) cylinder(r=1, h=2.5, center=true);
    //Protection
    translate([0, 36, 25]) rotate(90, [0,1,0]) cylinder(r=1, h=2.5, center=true);
  };
}

module _ploughshare_support(){
  difference(){
    union() {
      for(pos=girder_pos){translate([0, pos[0], pos[1]]) rotate(45, [1, 0, 0]) rounded_cube(2, 16, 16, 2);};
      hull(){for(pos=girder_pos){translate([0, pos[0], pos[1]]) cube([2, 20, 1], center=true);};};
      translate([0, 89.3, 56]) difference(){
        rotate(90, [0,1,0]) cylinder(r=30, h=2, center=true);
        translate([0,0,-36.5]) cube([2.5,60,60], center=true);
      }
    }
    translate([0, 21, 51]) rotate(90, [0,1,0]) cylinder(r=18, h=2.5, center=true);
  }
}

module _ploughshare_fixture(pos_y){
  translate([0, pos_y, 46]) difference(){
    union(){
      hull(){
        rounded_cube(2,21,8,3);
        translate([0, 0, -5]) rounded_cube(2,21,8,3);
      }
      hull(){
        translate([0, 0, -5]) rounded_cube(2,21,8,3);
        translate([0, -2, -10]) rounded_cube(2,19,8,3);
      }
      hull(){
        translate([0, -2, -10]) rounded_cube(2,19,8,3);
        translate([0, -8, -26]) rounded_cube(2,12,6,3);
      }
    };
    //Square hole
    translate([0, -2, -10]) rounded_cube(2.5,4,7,1);
    //ploughshare screwing
    for (hole=ploughshare_holes) translate(hole) rotate(90, [0,1,0]) cylinder(r=1, h=2.5, center=true);
  }
}

module ploughshare(pos_x, pos_y){
  translate([pos_x, pos_y, 46]) difference(){
    union(){
      hull(){
        translate([0, -4, -18]) rounded_cube(2,14,8,3);
        translate([0, -8, -26]) rounded_cube(2,12,6,3);
      }
      hull(){
        translate([0, -8, -26]) rounded_cube(2,12,6,3);
        translate([0, -22, -50]) rounded_cube(2,8,3,1);
      }
      hull(){
        translate([0, -22, -50]) rounded_cube(2,8,3,1);
        translate([0, -44, -64]) cube([2,1,1], center=true);
      }
    };
    //ploughshare screwing
    for (hole=ploughshare_holes) translate(hole) rotate(90, [0,1,0]) cylinder(r=1, h=2.5, center=true);
  }
}

module front_ploughshare(pos_x){
  translate([pos_x,0,0]) {
    difference(){
      union(){
        _ploughshare_support();
        _ploughshare_fixture(49);
      };
      _girders(true);
    };
  }
}

module front_ploughshare_fix(pos_x){
  translate([pos_x,0,0]) {
    difference(){
      union(){
        difference(){
          union() {
            for(pos=[girder_pos[0], girder_pos[3]]){translate([0, pos[0], pos[1]]) rotate(45, [1, 0, 0]) rounded_cube(2, 16, 16, 2);};
            hull(){for(pos=[girder_pos[0], girder_pos[3]]){translate([0, pos[0], pos[1]]) cube([2, 20, 1], center=true);};};
            translate([0, 25, 54]) difference(){
              translate([0,5,-3]) rotate(90, [0,1,0]) cylinder(r=30, h=2, center=true);
              translate([0,0,-36.5]) cube([2.5,60,60], center=true);
              translate([0,-37,5]) cube([2.5,60,60], center=true);
            }
          }
          translate([0, 21, 51]) rotate(90, [0,1,0]) cylinder(r=18, h=2.5, center=true);
        }
        _ploughshare_fixture(49);
      };
      _girders(true);
    };
  }
}

module rear_ploughshare(pos_x){
  translate([pos_x,0,0]) {
    difference(){
      union(){
        _ploughshare_support();
        _ploughshare_fixture(108);
      };
      _girders(true);
    };
  }
}

module rear_ploughshare_fix(pos_x){
  translate([pos_x,0,0]) {
    difference(){
      union(){
        difference(){
          union() {
            for(pos=[girder_pos[1], girder_pos[2]]){translate([0, pos[0], pos[1]]) rotate(45, [1, 0, 0]) rounded_cube(2, 16, 16, 2);};
            hull(){for(pos=[girder_pos[1], girder_pos[2]]){translate([0, pos[0], pos[1]]) cube([2, 20, 1], center=true);};};
            translate([0, 89.3, 56]) difference(){
              rotate(90, [0,1,0]) cylinder(r=30, h=2, center=true);
              translate([0,0,-36.5]) cube([2.5,60,60], center=true);
              translate([0,-40,0]) cube([2.5,60,60], center=true);
            }
          }
          translate([0, 74, 51]) rotate(90, [0,1,0]) cylinder(r=24, h=2.5, center=true);
        }
        _ploughshare_fixture(108);
      };
      _girders(true);
    };
  }
}

module third_point(pos_x){
  translate([pos_x, 0, 0]) difference(){
    union(){
      hull() {
        translate([0, 18.5, 78.5]) rotate(45, [1, 0, 0]) rounded_cube(2, 16, 16, 2);
        translate([0, 7, 102]) rotate(15, [1, 0, 0]) rounded_cube(2, 8, 12, 2);
      }
      translate([0, 78.5, 84]) rotate(45, [1, 0, 0]) rounded_cube(2, 16, 16, 2);
      hull() {
        translate([0, 78.5, 88]) rotate(45, [1, 0, 0]) rounded_cube(2, 10, 10, 2);
        translate([0, 7, 102]) rotate(15, [1, 0, 0]) rounded_cube(2, 8, 12, 2);
      };
      hull() {
        translate([0,3,78]) rotate(90, [0,1,0]) cylinder(r=3, h=2, center=true);
        translate([0,10,90]) rotate(90, [0,1,0]) cylinder(r=3, h=2, center=true);
        translate([0,3,104]) rotate(90, [0,1,0]) cylinder(r=3, h=2, center=true);
      };
    };
    //Third point
    for (pos_z=[78:5:104]){translate([0, 3, pos_z]) rotate(90, [0, 1, 0]) cylinder(r=1, h=2.5, center=true);};
    //Spacers
    translate([0, 20, 100]) rotate(90, [0, 1, 0]) cylinder(r=1, h=2.5, center=true);
    translate([0, 55, 93]) rotate(90, [0, 1, 0]) cylinder(r=1, h=2.5, center=true);

    _girders(true);
  };
}

module arm(pos_x){
  translate([pos_x, 0, 0]) difference(){
    union(){
      hull(){
        translate([0, 18.5, 78.5]) rotate(45, [1, 0, 0]) rounded_cube(2, 16, 16, 2);
        translate([0, 58, 49.5]) cube([2,1,1], center=true);
        translate([0, 0, 49.5]) cube([2,1,1], center=true);
      }
      translate([0, 49, 49.5]) rotate(45, [1, 0, 0]) rounded_cube(2, 16, 16, 2);
      translate([0, 4, 36]) rounded_cube(2, 10, 30, 2);
      difference(){
        translate([0, 24, 44]) cube([2,30,20], center=true);
        translate([0, 35, 34]) scale([1,1.74,1]) rotate(90, [0, 1, 0]) cylinder(r=15, h=2.5, center=true);
      };
    };
    _girders(true);
    for (pos_z=[24:5:50]){translate([0, 3, pos_z]) rotate(90, [0, 1, 0]) cylinder(r=1, h=2.5, center=true);};
    //Spacers
    translate([0, 5, 55]) rotate(90, [0, 1, 0]) cylinder(r=1, h=2.5, center=true);
    translate([0, 8, 65]) rotate(90, [0, 1, 0]) cylinder(r=1, h=2.5, center=true);
    translate([0, 20, 55]) rotate(90, [0, 1, 0]) cylinder(r=1, h=2.5, center=true);
  };
}

module _girders(sliders=false, lockers=false) {
  for (pos=girder_pos){
    girder(pos[0], pos[1]);
    for(pos_x=[-1,1]){
      girder_square_bolt(pos_x*125,pos[0],pos[1]);
      if (lockers) {
        girder_locker(pos_x*135,pos[0],pos[1]);
      }
    }
    if (sliders) {
      translate([0, pos[0], pos[1]]) cube([264, 13.35, 2], center=true);
    }
  }
}

module _frame(){
  side_leveller_fixture(-133);
  side_panel(-132);
  depth_control_roll_fix(-133);
  roll_support(-131);
  depth_control(-131);
  depth_control_roll_fix(-129);
  side_leveller(-129);

  arm(-36);
  arm(-30);
  arm(-24);

  third_point(-6);
  for (position=[0:inter_ploughshare:120]){for (mult=[1,-1]){
    if (position%(inter_ploughshare*2)==0){
      rear_ploughshare_fix(mult*(position-2));
      ploughshare(mult*position, 108);
      rear_ploughshare(mult*(position+2));
    } else {
      front_ploughshare_fix(mult*(position-2));
      ploughshare(mult*position, 49);
      front_ploughshare(mult*(position+2));
    }
  };};
  third_point(6);


  arm(24);
  arm(30);
  arm(36);


  side_leveller(129);
  depth_control_roll_fix(129);
  depth_control(131);
  roll_support(131);
  depth_control_roll_fix(133);
  side_panel(132);
  side_leveller_fixture(133);
};

module spacer() {
    difference() {
        rounded_cube(2, 16, 16, 2);
        cube([3, 8, 8],center=true);
        for (mult=[[-1,-1], [-1, 1], [1, 1], [1, -1]]) hull() {
            translate([0, mult[0]*3, mult[1]*3]) rotate(90, [0, 1, 0]) cylinder(r=1.1, h=3, center=true);
            translate([0, mult[0]*3.4, mult[1]*3.4]) rotate(90, [0, 1, 0]) cylinder(r=1.1, h=3, center=true);
        };
    }
}
