include <tools.scad>
include <profiles.scad>

module ploughshare(){
  difference(){
    union(){
      hull(){
        translate([0, -2, 37]) rounded_cube(2, 14, 20, 2);
        translate([0, -6, 15]) rounded_cube(2, 12, 20, 2);
      };
      translate([0, -12, 16]) cube([2, 12, 22], center=true);
    }
    translate([0, -6, 43]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 3, 43]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
  }
};

module ploughshare_arrow(){
  rotate(15, [1,0,0]) difference(){
    union(){
     translate([-10, -19, 10]) cube([2, 28, 2], center=true);
     hull(){
       translate([-10, -16, 10]) cube([2, 24, 2], center=true);
       translate([-7, -12, 10]) cube([2, 24, 2], center=true);
       translate([6, -8, 10]) cube([2, 16, 2], center=true);
     };
    };
    translate([0, -10, 16]) cube([2, 12, 22], center=true);
  };
};

module _ploughshare(x){
  translate([x, 0, 0]) union(){
    ploughshare();
    ploughshare_arrow();
  }
};

module main_girder(){
  translate([33, 4, 56]) rotate(90, [0,0,-1]) profile_carre(12, 45);
}

module thirdpoint_girder(){
  translate([-13, 4, 102]) rotate(90, [0,0,-1]) profile_carre(12, 26);
}

module upper_girder(){
  translate([10, 4, 103]) rotate(25, [0,1,0]) rotate(90, [0,0,-1]) profile_carre(12, 75, angle_cut=25, cut_bevel=true);
}

module middle_ploughshare_support(){
  translate([79, 0, 0]) difference(){
    union(){
      extend_plowshare_support(0);
      translate([0, -2, 75]) rounded_cube(2, 14, 20, 2);
    };
    for (y=[-3.5,3.5]){
      for (z=[-8,8]){
        translate([0, y-2, 62+z]) rotate(90, [0, 1, 0]) cylinder(r=1, h=3, center=true);
      }
    }
    translate([0, -2, 79]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
  };
}

module arm_ploughshare_support(){
  translate([32, 0, 0]) difference(){
    union(){
      extend_plowshare_support(0);
      hull(){
        translate([0, -2, 85]) rounded_cube(2, 14, 40, 2);
        translate([0, -16, 57]) rounded_cube(2, 14, 6, 2);
        translate([0, 4, 69]) rounded_cube(2, 14, 30, 2);
      };
      translate([0, -20, 50]) rounded_cube(2, 6, 16, 2);
    };
    //Tractor fix
    translate([0, -20, 56.5]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, -20, 51]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, -20, 45.5]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    //Lower limit
    translate([0, 7.5, 57]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 7.5, 62]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 7.5, 67]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 7.5, 72]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    //Arm axle
    translate([0, -6, 72]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    //Upper limit
    translate([0, 6, 76]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 4, 79]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 2, 82]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 0, 85]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    //Girder
    translate([0, -2, 102.2]) cube([2.5, 12, 20], center=true);
  };
}

module arm_support(){
  translate([23, 0, 0]) difference(){
    union(){
      hull(){
        translate([0, -2, 85]) rounded_cube(2, 14, 40, 2);
        translate([0, -16, 57]) rounded_cube(2, 14, 6, 2);
        translate([0, 4, 69]) rounded_cube(2, 14, 30, 2);
      };
      translate([0, -20, 50]) rounded_cube(2, 6, 16, 2);
    };
    //Tractor fix
    translate([0, -20, 56.5]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, -20, 51]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, -20, 45.5]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    //Lower limit
    translate([0, 7.5, 57]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 7.5, 62]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 7.5, 67]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 7.5, 72]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    //Arm axle
    translate([0, -6, 72]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    //Upper limit
    translate([0, 6, 76]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 4, 79]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 2, 82]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 0, 85]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    //Girder
    translate([0, -2, 106.4]) cube([2.5, 12, 20], center=true);
  };
}

module arm_support_link(){
  translate([24, -22.47, 60]) rotate(17.3, [-1, 0, 0]) cube([7, 2, 35]);
}

module arm(){
  translate([26, 0, 0]) difference(){
    union(){
      hull(){
        translate([0, -6, 72]) rotate(90, [0, 1, 0]) cylinder(r=3.5, h=2, center=true);
        translate([0, 10, 75]) rotate(90, [0, 1, 0]) cylinder(r=3.5, h=2, center=true);
      };
      hull(){
        translate([0, 10, 75]) rotate(90, [0, 1, 0]) cylinder(r=3.5, h=2, center=true);
        translate([0, 18, 35]) rotate(90, [0, 1, 0]) cylinder(r=3.5, h=2, center=true);
      };
      hull(){
        translate([0, 18, 35]) rotate(90, [0, 1, 0]) cylinder(r=3.5, h=2, center=true);
        translate([0, 22, 34]) rotate(90, [0, 1, 0]) cylinder(r=1, h=2, center=true);
      };
      hull(){
        translate([0, 18, 35]) rotate(90, [0, 1, 0]) cylinder(r=3.5, h=2, center=true);
        translate([0, 21, 39]) rotate(90, [0, 1, 0]) cylinder(r=1, h=2, center=true);
      };
    };
    translate([0, -6, 72]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 18, 35]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    hull(){
      translate([0, 18, 35]) rotate(90, [0, 1, 0]) cylinder(r=0.5, h=3, center=true);
      translate([0, 22, 36]) rotate(90, [0, 1, 0]) cylinder(r=0.5, h=3, center=true);
    };
  };
}

/* module inner_arm_fix(y){
  translate([13.5, y, 90.2]) rotate(25, [0, 1, 0]) union() {
    hull(){
      translate([0, 0, 10]) cube([10, 2, 0.1]);
      translate([2.3, 0, 9.5]) cube([8, 2, 0.1]);
    };
    hull(){
      translate([2.3, 0, 9.5]) cube([8, 2, 0.1]);
      translate([6, 0, 8]) cube([5, 2, 0.1]);
    };
    hull(){
      translate([6, 0, 8]) cube([5, 2, 0.1]);
      translate([8.2, 0, 6.5]) cube([3.5, 2, 0.1]);
    };
    hull(){
      translate([8.2, 0, 6.5]) cube([3.5, 2, 0.1]);
      translate([10.8, 0, 5.2]) cube([1.5, 2, 0.1]);
    };
  }
}

module outer_arm_fix(y){
  translate([33.5, y, 80.2]) difference() {
    hull(){
      translate([3.3, 0, 10.2]) rotate(25, [0, 1, 0]) cube([5, 2, 0.1]);
      translate([3.3, 0, 5.1]) cube([0.1, 2, 5]);
    };
    translate([6.2, 0, 5.6]) rotate(90, [1, 0, 0]) cylinder(r=3, h=5, center=true);
  };
} */

module thirdpoint_fixture(){
  translate([14, -2, 107]) rounded_cube(2, 14, 16, 2);
}

module thirdpoint(){
  difference(){
    hull(){
      translate([4, -8, 109]) rounded_cube(2, 6, 6, 2);
      translate([4, -14, 103]) rounded_cube(2, 6, 6, 2);
      translate([4, -14, 94]) rounded_cube(2, 6, 6, 2);
      translate([4, 8, 103]) rounded_cube(2, 6, 6, 2);
      translate([4, 4, 107]) rounded_cube(2, 6, 6, 2);
    };
    //girder
    translate([4, -2, 108]) cube([3, 12, 12], center=true);
    //rear fix
    translate([4,8,103]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    //front fix
    translate([4,-14,104]) rotate(90, [0, 1, 0]) cylinder(r=1, h=3, center=true);
    translate([4,-14,99]) rotate(90, [0, 1, 0]) cylinder(r=1, h=3, center=true);
    translate([4,-14,94]) rotate(90, [0, 1, 0]) cylinder(r=1, h=3, center=true);

  };
}

module foot() {
  translate([70, 20, 0]) rotate(10, [1, 0, 0]) cube([2, 6, 85]);
}

module foot_counter_support(x=73) {
  translate([x, 12.5, 65]) rotate(10, [1, 0, 0]) difference(){
    rounded_cube(2, 12, 12,2);
    for (y=[-4,4]){
      for (z=[-12:4:12]){
        translate([0,y,z]) rotate(90, [0, 1, 0]) cylinder(r=1, h=3, center=true);
      }
    }
    rotate(90, [0, 1, 0]) cylinder(r=1, h=3, center=true);
  }
}
module foot_support() {
  union(){
    foot_counter_support(x=69);
    hull(){
      translate([69, 7, 64]) rotate(10, [1, 0, 0]) cube([2, 0.1, 8], center=true);
      translate([69, 4, 64]) cube([2, 0.1, 8], center=true);
    };
  };
}

module _half_combiplow() {
  main_girder();
  upper_girder();
  thirdpoint_girder();
  thirdpoint_fixture();
  thirdpoint();
  /* inner_arm_fix(1.5); */
  /* inner_arm_fix(-7.2); */
  /* outer_arm_fix(1.5); */
  /* outer_arm_fix(-7.2); */
  arm_ploughshare_support();
  arm();
  arm_support();
  arm_support_link();
  middle_ploughshare_support();
  _ploughshare(30);
  _ploughshare(77);

  foot_support();
  foot();
  foot_counter_support();
}

//4m combiplow
module extend_fixture(){
    translate([81.2, -2, 62]) difference(){
      rounded_cube(2, 14, 20, 2);
      for (y=[-3.5,3.5]){
        for (z=[-8,8]){
          translate([0, y, z]) rotate(90, [0, 1, 0]) cylinder(r=1, h=3, center=true);
        }
      }
    }
}

module extend_girder(){
  translate([82.2, 4, 56]) rotate(90, [0,0,-1]) profile_carre(12, 43);
}

module extend_plowshare_support(x=126.2){
  translate([x, -2, 60]) difference() {
    hull(){
      rounded_cube(2, 14, 20, 2);
      translate([0,0,-13]) rounded_cube(2, 18, 16, 2);
    };
    translate([0, 0, 2]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, -4, -17]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 5, -17]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=3, center=true);
  };
}


module _half_combiplow_4m() {
  _half_combiplow();
  extend_fixture();
  extend_girder();
  extend_plowshare_support();
  _ploughshare(124);
}
