include <profiles.scad>
include <tools.scad>

module main_frame_girder(y){
  translate([0, y, 34]) cube([129, 5, 5], center=true);
}

module transversal_girder(x){
  translate([x, -26.75, 34]) cube([5, 37.5, 5], center=true);
}

module girder_support_support(x){
  translate([x-4, -50 ,31]) difference(){
    translate([0, 1.5, 0]) profile_carre(8, 63.5);
    //Front girder
    translate([0,-0.5,0]) cube([8, 5, 5.5]);
    hull(){
      translate([0,5,0]) cube([8, 6, 0.1]);
      translate([0,10,0]) cube([8, 6, 6]);
      translate([0,30,0]) cube([8, 6, 6]);
      translate([0,35.5,0]) cube([8, 6, 0.1]);
    }
    //Rear girder
    translate([0,42,0]) cube([8.1, 5, 5.5]);
    //girder_support fix
    translate([4, 53, 8]) cylinder(r=1.1,h=4,center=true);
    translate([4, 60, 8]) cylinder(r=1.1,h=4,center=true);
  };
}

module girder_support(x){
  translate([x-3, -2 ,32]) difference(){
    cube([6,40,6]);
    //girder_support fix
    translate([3, 5, 3]) cylinder(r=1.1,h=7,center=true);
    translate([3, 12, 3]) cylinder(r=1.1,h=7,center=true);
  }
}

module girder_vertical_support(x){
  translate([x, 44, 35]) difference(){
    hull(){
      rotate(90, [0,0,1]) rounded_cube(8, 8, 8, 2);
      translate([0, 0, -12.5]) rotate(90, [0,0,1]) rounded_cube(8, 6, 8, 2);
    };
    translate([0, 0, 0]) cube([6, 9, 6], center=true);
    translate([0, 1.2, 1]) rotate(90, [0, 1, 0]) cylinder(r=1, h=10, center=true);
    translate([0, 1.2, -12]) rotate(90, [0, 0, 0]) cylinder(r=1, h=10, center=true);
  }
}

module girder_support_limit(x){
  translate([x, -49.5, 36.5]) hull(){
    cube([12, 2, 0.1], center=true);
    translate([0, 0, 3]) cube([6, 2, 0.1], center=true);
  }
}


module inner_arm(pos_x){
  union() {
    outer_arm(pos_x);
    translate([pos_x, -50, 40]) {
      hull(){
        translate([0,-2,-0.9])  cube([2,0.1,5], center=true);
        translate([0,13,-3.4])  cube([2,0.1,0.1], center=true);
      };
      hull(){
        translate([0,-2,-10])  cube([2,0.1,3], center=true);
        translate([0,13,-8.5])  cube([2,0.1,0.1], center=true);
      };
    };
  };
}

module outer_arm(pos_x){
    translate([pos_x, -50, 40]) difference(){
        hull(){
          translate([0,-9,3.5]) rounded_cube(2, 17, 10, 1);
          translate([0, -5, -7]) rounded_cube(2, 9, 10, 1);
        };
      translate([0, -3.5, 4.5]) rotate(90, [0, 1, 0]) cylinder(r=1.6,h=3,center=true);
      translate([0, -11, 4]) rotate(90, [0, 1, 0]) cylinder(r=2, h=3, center=true);
      hull(){
        translate([0, -11, 4]) rotate(90, [0, 1, 0]) cylinder(r=0.8,h=3,center=true);
        translate([0, -11, -12]) rotate(90, [0, 1, 0]) cylinder(r=2,h=3,center=true);
      };
    }
};

module rotation_plate(pos_x, pos_y){
  translate([pos_x, pos_y ,38]) difference(){
    rotate(90, [0, 0, 1]) rounded_cube(2, 7, 13, 1);
    translate([0, 0, 3]) rotate(90, [1, 0, 0]) cylinder(r=1.7, h=3, center=true);
  }
}

module foot_support(pos_x){
  translate([pos_x-3, -50.5, 30]) rotate(90, [1,0,0]) profile_carre(6, 12);
}

module foot(pos_x){
  translate([pos_x-2, -51.5, 0]) rotate(90, [1,0,0]) profile_carre(4, 48);
}

module thirdpoint_rear_fix(pos_x){
  translate([pos_x, -7.5, 38]) difference(){
    rounded_cube(2, 8, 16, 1);
    translate([0, 2,-4]) cube([3,5,5], center=true);
    translate([0, 0, 5]) rotate(90, [0,1,0]) cylinder(r=1.7, h=3, center=true);
  }
}

module warnsign_support(pos_x){
  translate([pos_x-2.5, -13, 36.5]) difference(){
    profile_carre(5, 16);
    translate([2.5, 3, 0]) cylinder(r=1, h=12, center=true);
    translate([2.5, 13, 0]) cylinder(r=1, h=12, center=true);
  }
}

module warnsign_support_girder(pos_x){
  translate([pos_x-1.5, -18, 37.5]) cube([3, 97, 3]);
}

module warnsign_girder(){
  translate([0, 75, 42]) difference(){
    cube([160, 3, 3], center=true);
  };
}

module half_thirdpoint(){
  translate([25, -56.5, 44]) difference(){
    union(){
      rounded_cube(2, 8, 12, 1);
      hull(){
        translate([0,0,5]) rounded_cube(2, 8, 2, 1);
        translate([-21,0,22]) rounded_cube(2, 8, 2, 1);
      }
      hull(){
        translate([-21,0,22]) rounded_cube(2, 8, 2, 1);
        translate([-21,0,40]) rounded_cube(2, 8, 2, 1);
      }
    }
    translate([0, 0, -4.5]) rotate(90, [0,1,0]) cylinder(r=1, h=3, center=true);
    translate([-21, 0, 28.5]) rotate(90, [0,1,0]) cylinder(r=1, h=3, center=true);
    translate([-21, 0, 36.5]) rotate(90, [0,1,0]) cylinder(r=1, h=3, center=true);
  }
}

module thirdpoint_standrecross(){
  translate([0, -54.5, 55]) hull(){
    cube([31, 2, 0.1], center=true);
    translate([0, 0, 4]) cube([21, 2, 0.1], center=true);
  }
}

module thirdpoint_flat(){
  translate([0, -56.5, 67]) cube([6, 8, 2], center=true);
}

module thirdpoint_central_fixture(pos_x){
  translate([pos_x, -53.3, 70]) rotate(50, [1,0,0]) difference(){
    rounded_cube(2, 5, 14, 1);
    translate([0, 0, 4]) rotate(90, [0,1,0]) cylinder(r=1, h=3, center=true);
  }
}

module thirdpoint_central_fixture_girder(){
  translate([0, -50, 70]) rotate(50, [1, 0, 0]) cube([10, 6, 6],center=true);
}

module _thirdpoint(){
  half_thirdpoint();
  mirror([1,0,0]) half_thirdpoint();
  thirdpoint_standrecross();
  thirdpoint_flat();
}

module rack_vertical_support() {
    translate([-1.5, 45, 21]) difference(){
      rounded_cube(2, 12, 10, 1);
      rotate(90, [0,1,0]) cylinder(r=1.7, h=3, center=true);
    }
}

module rack_girder(){
difference() {
  union(){
    for (pos=[[-5, -24.3, -2.2, 5.5], [5.5, -2.2, 19.9, -0.1], [-0.1, 19.9, 42, -7], [-7, 42, 64, 3], [3, 64, 64, 3]]) {
      translate([pos[0], pos[1], 15.5]) union(){
        hull(){
            translate([-26.5, 0, 0]) cylinder(r=3, h=2, center=true);
            translate([ 26.2, 0, 0]) cylinder(r=3, h=2, center=true);
        };
        for (x=[-26.5, 8.5, -9,26.2]) {
            hull(){
                translate([x, 0, 0]) cylinder(r=3, h=2, center=true);
                translate([x+pos[3]-pos[0], pos[2]-pos[1], 0]) cylinder(r=3, h=2, center=true);
            }
        };
       };
   };
   translate([15, -27, 15.5])cylinder(r=3, h=2, center=true);
   translate([-25, -27, 15.5])cylinder(r=3, h=2, center=true);
   //rear girder fix hole
   translate([0, 48, 15.5])cylinder(r=5, h=2, center=true);
 };
 for (pos=[[-5, -24.3], [5.5, -2.2], [-0.1, 19.9], [-7, 42], [3, 64]]) {
   translate([pos[0], pos[1], 15.5]) for (x=[-26.5, 8.5, -9,26.2]) {translate([x, 0, 0]) cylinder(r=1.7, h=2.1, center=true);};
  };
  translate([15, -27, 15.5])cylinder(r=1.7, h=2.1, center=true);
  translate([-25, -27, 15.5])cylinder(r=1.7, h=2.1, center=true);
  //rear girder fix hole
  translate([0, 48, 15.5])cylinder(r=1.7, h=2.1, center=true);
 };

};

module rack_counter_girder(pos_x){
  translate([pos_x+6.6, 0, 16.5]) rotate(64, [0, 0, 1]) translate([-14.5,0,0]) difference(){
    rotate(90, [0, 1, 0]) rounded_cube(1, 4, 29, 1);
    for (x=[-1, 1]) {translate([x*12, 0, 0]) cylinder(r=1, h=2, center=true);};
  }
}

module rack_s(pos_x){
  translate([pos_x, 0, 16]) union(){
    hull(){
      translate([-8.75, -25, 0]) cube([1, 1, 4]);
      translate([1.7, -3, 0]) cube([1, 1, 4]);
    }
    hull(){
      translate([1.7, -3, 0]) cube([1, 1, 4]);
      translate([-4, 19.5, 0]) cube([1, 1, 4]);
    }
    hull(){
      translate([-4, 19.5, 0]) cube([1, 1, 4]);
      translate([-10.5, 41.5, 0]) cube([1, 1, 4]);
    }
    hull(){
      translate([-10.5, 41.5, 0]) cube([1, 1, 4]);
      translate([-0.5, 64, 0]) cube([1, 1, 4]);
    }
  };
}

module thick_rack_girder(pos_x, pos_y){
  translate([pos_x, pos_y, 15.5]) difference(){
    cube([60.5, 5, 2], center=true);
    for (x=[-26.5, 8.5, -9,26.2]) {translate([x, 0, 0]) cylinder(r=1, h=2.5, center=true);};
  }
}

module thick_rack_counter_girder(pos_x){
  translate([pos_x+6.6, 0, 16.5]) rotate(64, [0, 0, 1]) translate([-14.5,0,1]) difference(){
    rotate(90, [0, 1, 0]) rounded_cube(2, 4, 29, 1);
    for (x=[-1, 1]) {translate([x*12, 0, 0]) cylinder(r=1, h=2.5, center=true);};
  }
}

module thick_rack_s(pos_x){
  translate([pos_x, 0, 16]) union(){
    hull(){
      translate([-8.75, -25, 0]) cube([2, 2, 6]);
      translate([1.7, -3, 0]) cube([2, 2, 6]);
    }
    hull(){
      translate([1.7, -3, 0]) cube([2, 2, 6]);
      translate([-4, 19.5, 0]) cube([2, 2, 6]);
    }
    hull(){
      translate([-4, 19.5, 0]) cube([2, 2, 6]);
      translate([-10.5, 41.5, 0]) cube([2, 2, 6]);
    }
    hull(){
      translate([-10.5, 41.5, 0]) cube([2, 2, 6]);
      translate([-0.5, 64, 0]) cube([2, 2, 6]);
    }
  };
}

module thick_rack_chain(pos_x, pos_y){
  translate([pos_x, pos_y, 15.5]) difference(){
    cylinder(r=5, h=2, center=true);
    cylinder(r=3, h=2.5, center=true);
    translate([0, 5, 0]) cube([10, 10, 2.5], center=true);
  }
}

module rack_arrow(pos_x, pos_y){
  translate([pos_x, pos_y, 0]) difference(){
    hull(){
      translate([0, 0, 2.5]) cylinder(r=1, h=5, center=true);
      translate([0, 0, 5+5]) rotate(45, [0, 0, 1]) cube([4, 4, 10], center=true);
    };
    translate([0, 0, 12.6]) cylinder(r=1, h=5, center=true);
  }
}

module _rack(pos_x, arrow=true){
  translate([pos_x,0,0]) union(){
    //rack_vertical_support();
    rack_girder();
    for (pos=[[-5, -24.3], [5.5, -2.2], [-0.1, 19.9], [-7, 42], [3, 64]]) {
      if (arrow){
      for (x=[-26.5, -9, 8.5, 26.2]){
        //rack_arrow(pos[0]+x, pos[1]);
      }}
    }
    //for (pos_y=[-26.5, -9, 8.5, 26.2]){rack_counter_girder(pos_y);}
    //for (pos_y=[-26.5, -9, 15,32]){rack_s(pos_y);}
  }
}

module _thick_rack(pos_x, arrow=true){
  translate([pos_x,0,0]) union(){
    translate([0, 0, 0.5]) rack_vertical_support();
    for (pos=[[-5, -24.3], [5.5, -2.2], [-0.1, 19.9], [-7, 42], [3, 64]]) {
      thick_rack_girder(pos[0], pos[1]);
      if (arrow){
      for (x=[-26.5, -9, 8.5, 26.2]){
        thick_rack_arrow(pos[0]+x, pos[1]);
      }}
    }
    for (pos_y=[-26.5, -9, 8.5, 26.2]){thick_rack_counter_girder(pos_y);}
    for (pos_y=[-26.5, -9, 15,32]){translate([0, 0, -1.5]) thick_rack_s(pos_y);}
    for (pos_x=[10,-20]) {thick_rack_chain(pos_x, -26.8);};
  }
}

module extend_actuator_fix(pos_y){
  translate([84.5, pos_y, 34]) difference(){
    hull(){
      cube([30,2, 5], center=true);
      translate([-7, 0, 20]) rotate(90, [1, 0, 0]) cylinder(r=3, h=2, center=true);
    };
    //actuator
    translate([-7, 0, 20]) rotate(90, [1, 0, 0]) cylinder(r=2, h=6, center=true);
    //girder fix
    for(posx=[-10, 10]) translate([posx, 0, 0]) rotate(90, [1, 0, 0]) cylinder(r=1.1, h=6, center=true);
  }
}

module extend_rotation_girder(y){
  translate([66, y, 41])difference(){
    union(){
      translate([3,0,0]) cube([14, 5, 5], center=true);
      translate([4.25, 0, -2.5]) cube([11.5, 5, 4], center=true);
      translate([-4, 0, 0]) rotate(90, [1, 0, 0]) cylinder(r=2.5, h=5, center=true);
    };
    translate([-4, 0, 0]) rotate(90, [1, 0, 0]) cylinder(r=1.7, h=6, center=true);
  };
}

module extend_small_girder(y){
  translate([100, y, 34]) cube([71, 5, 5], center=true);
}

module extend_mid_girder(y){
  translate([133, y, 34]) cube([137, 5, 5], center=true);
}

module extend_large_girder(y){
  difference(){
    translate([165, y, 34]) cube([201, 5, 5], center=true);
    for (x=[67, 133, 198.5, 263]) translate([x, y, 34]) rotate(90, [1, 0, 0]) cylinder(r=1.1, h=6, center=true);
  };
}

module _extend_small(){
  for (y=[-5.5, -48]){
    extend_small_girder(y);
    extend_rotation_girder(y);
  }
  for (pos_y=[-2,-9]){extend_actuator_fix(pos_y);};

  for (x=[67, 133]){transversal_girder(x);};
  for (x=[105.5]){
    girder_vertical_support(x);
    girder_support(x);
    girder_support_support(x);
    girder_support_limit(x);
    _rack(x);
  };
}

module _extend_mid(){
  for (y=[-5.5, -48]){
    extend_mid_girder(y);
    extend_rotation_girder(y);
  }
  for (pos_y=[-2,-9]){extend_actuator_fix(pos_y);};

  for (x=[67, 133, 198.5]){transversal_girder(x);};
  for (x=[105.5, 175.5]){
    girder_vertical_support(x);
    girder_support(x);
    girder_support_support(x);
    girder_support_limit(x);
    _rack(x);
  };
}

module extend_large_front_girder(){
  extend_large_girder(-48);
  extend_rotation_girder(-48);
  for (x=[105.5, 175.5, 246]){
    girder_support_limit(x);
  };
};

module extend_large_rear_girder(){
  difference(){
    union(){
      extend_large_girder(-5.5);
      extend_rotation_girder(-5.5);
    };
    //extend_actuator_fix fixings
    for(posx=[-90.5, -70.5]) translate([posx+165, -5.5, 34]) rotate(90, [1, 0, 0]) cylinder(r=1.1, h=10, center=true);
  };
};

module _extend_large(){
  extend_large_front_girder();
  extend_large_rear_girder();

  for (pos_y=[-2,-9]){extend_actuator_fix(pos_y);};

  for (x=[67, 133, 198.5, 263]){transversal_girder(x);};
  for (x=[105.5, 175.5, 246]){
    //girder_vertical_support(x);
    //girder_support(x);
    //girder_support_support(x);
    //_rack(x);
  };
}

module _main_frame(){
  main_frame_girder (-5.5);
  main_frame_girder (-48);
  //warnsign_girder();
  //_thirdpoint();
  //thirdpoint_central_fixture_girder();

  for(mult=[1,-1]){
    thirdpoint_rear_fix(mult*3);
    //thirdpoint_central_fixture(mult*6);
    transversal_girder(mult*23);
    inner_arm(mult*23);
    outer_arm(mult*31.5);
    girder_vertical_support(mult*35);
    girder_support(mult*35);
    girder_support_support(mult*35);
    //_rack(mult*35);
    foot_support(mult*35.5);
    //foot(mult*35.5);
    warnsign_support(mult*43);
    warnsign_support_girder(mult*43);
    //thirdpoint_rear_fix(mult*49);
    transversal_girder(mult*62);
    for (pos_y=[-51.5,-44.5,-9,-2]){
      rotation_plate(mult*62,pos_y);
    };
  };
}
