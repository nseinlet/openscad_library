include <tools.scad>

roll_ray=21.875;
discs_ray=28.125;

module three_points_linkage_arm_fix(){
  difference(){
    hull(){
        translate([0, 59, 11]) rotate([0,90,0]) cylinder(h=2, r=4, center=true);
        translate([0, 51, 11]) rotate([0,90,0]) cylinder(h=2, r=4, center=true);
        translate([0, 41, 21]) rotate([0,90,0]) cylinder(h=2, r=4, center=true);
        translate([0, 41, 48]) rotate([0,90,0]) cylinder(h=2, r=4, center=true);
        translate([0, 57, 48]) rotate([0,90,0]) cylinder(h=2, r=4, center=true);
    };
    //arm hole
    translate([0, 59, 11]) rotate([0,90,0]) cylinder(h=2.2, r=1.5, center=true);
    //fix beams
    for (pos_z=[28,46]) translate([0, 55, pos_z]) cube([2.2, 5.2, 5.2], center=true);
    //Roll beams
    for (pos_z=[29,45]) translate([0, 44, pos_z]) cube([2.2, 6.4, 6.4], center=true);
    translate([0, 42, 37]) cube([2.2, 11, 11], center=true);
    //Weight support plate fix
    translate([0, 49, 51.1]) cube([2.2, 10, 2], center=true);
  }
}

module three_points_linkage_thid_point(){
  difference(){
    hull(){
        translate([0, 57, 21]) rotate([0,90,0]) cylinder(h=2, r=4, center=true);
        translate([0, 41, 21]) rotate([0,90,0]) cylinder(h=2, r=4, center=true);
        translate([0, 41, 67]) rotate([0,90,0]) cylinder(h=2, r=4, center=true);
        translate([0, 57, 62]) rotate([0,90,0]) cylinder(h=2, r=4, center=true);
    }
    //top design hole
    hull(){
        translate([0, 50, 53]) rotate([0,90,0]) cylinder(h=2.2, r=2, center=true);
        translate([0, 44, 53]) rotate([0,90,0]) cylinder(h=2.2, r=2, center=true);
        translate([0, 44, 61]) rotate([0,90,0]) cylinder(h=2.2, r=2, center=true);
        translate([0, 50, 58]) rotate([0,90,0]) cylinder(h=2.2, r=2, center=true);
    }
    //third point hole
    for (pos_z=[52,57,62]) translate([0, 55, pos_z]) rotate([0,90,0]) cylinder(h=2.2, r=1.5, center=true);
    translate([0, 41, 67]) rotate([0,90,0]) cylinder(h=2.2, r=1.5, center=true);
    //fix beams
    for (pos_z=[28,46]) translate([0, 55, pos_z]) cube([2.2, 5.2, 5.2], center=true);
    //Roll beams
    for (pos_z=[29,45]) translate([0, 44, pos_z]) cube([2.2, 6.5, 6.5], center=true);
    translate([0, 42, 37]) cube([2.2, 11, 11], center=true);
  }
}

module cylinder_link_moving_part(){
  pos_x=65;
  difference(){
    hull(){
        translate([pos_x, 46, 33]) rotate([0,90,0]) cylinder(h=2, r=4, center=true);
        translate([pos_x, 42, 33]) rotate([0,90,0]) cylinder(h=2, r=4, center=true);
        translate([pos_x, 42, 52]) rotate([0,90,0]) cylinder(h=2, r=4, center=true);
        translate([pos_x, 46, 52]) rotate([0,90,0]) cylinder(h=2, r=4, center=true);
    }
    //hole for axis
    translate([pos_x, 44, 42.5]) rotate([0,90,0]) cylinder(h=2.2, r=1.2, center=true);
    //Roll beams
    for (pos_z=[35,50.5]) translate([pos_x, 44, pos_z]) cube([2.2, 6, 6], center=true);
  }
}

module cylinder_link_fixed_part(){
  difference(){
    union(){
      translate([0, -5, -0.25]) rounded_cube(2,20,8,2);
      rounded_cube(2,10,28,2);
      //for (posz=[-9, 9]) translate([2, 0, posz]) cube([4,8,8], center=true);
    }
    //axis hole
    for (posz=[-9, 9]) translate([2, 0, posz]) cube([8, 5.2, 5.2], center=true);
    //Cylinder link hole
    translate([0, -11, -0.25]) rotate([0,90,0]) cylinder(h=2.2, r=1.2, center=true);
  }
}

module weight_support_plate(){
  difference(){
    union(){
      translate([0, 22.01, 57]) rotate([0,90,0]) rounded_cube(2, 30, 80, 2);
      for (mir=[1,0]) mirror([mir,0,0]) {
        for (posx=[27,34]) translate([posx, 49, 57]) cube([2.2, 10, 2], center=true);
        translate([30.5, 45, 57]) cube([5, 20, 2], center=true);
        for (posy=[14,30]) translate([25, posy, 60]) cylinder(r=2.5, h=4, center=true);
      }
    }
    //counter support holes
    for (mir=[1,0]) mirror([mir,0,0]) translate([30.5, 22, 57]) cube([2, 10, 2.2], center=true);
  }
}

module counterweight_plate(){
  union(){
    translate([0, 22, 57]) cube([2, 10, 2], center=true);
    hull(){
      translate([0, 22.1, 56]) cube([2, 26, 0.1], center=true);
      translate([0, 32.1, 48.4]) cube([2, 6, 0.1], center=true);
    }
  };
}

module counterweight_support(){
  translate([0,36.1,51.3]) cube([9,2,6], center=true);
}

module _three_points_linkage(){
  union(){
    translate([0, 0, 6]) for (mir=[0,1]) mirror([mir,0,0]) {
        for (posx=[27, 34]) translate([posx,0,0]) three_points_linkage_arm_fix();
        translate([3, 0, 0]) three_points_linkage_thid_point();
    }
    //Fixed beams
    for (pos_z=[34, 52]) translate([-14, 55, pos_z]) cube([98, 5.2, 5.2], center=true);
    //cylinder link
    translate([-62, 55, 43]) cylinder_link_fixed_part();
    weight_support_plate();
    for (posx=[-30.5,0,30.5]) translate([posx,0,0]) {
      counterweight_support();
      counterweight_plate();
    }
  }
}

module roll_fix(){
  translate([94,0,0]) difference(){
    union(){
      hull(){
        translate([0, -10, roll_ray-10]) rotate([0, 90, 0]) cylinder(r=3, h=2, center=true);
        translate([0, 10, roll_ray-10]) rotate([0, 90, 0]) cylinder(r=3, h=2, center=true);
        translate([0, 44, 35]) rotate([0, 90, 0]) cylinder(r=7.2, h=2, center=true);
        translate([0, 44, 50.5]) rotate([0, 90, 0]) cylinder(r=7.2, h=2, center=true);
        translate([0, -10, 32]) rotate([0, 90, 0]) cylinder(r=3, h=2, center=true);
        translate([0, 0, 40]) rotate([0, 90, 0]) cylinder(r=3, h=2, center=true);
      }
      //Beams
      for (pos_z=[35,50.5]) translate([-2, 44, pos_z]) cube([3, 10, 10], center=true);
    }
    //Axis holes
    for (mult_y=[-1,1]) for(mult_z=[-1,1]) {
      translate([0, mult_y*8, roll_ray+mult_z*8]) rotate([0,90,0]) cylinder(r=1.5, h=2.2, center=true);
    }
    //beam holes
    for (pos_z=[35,50.5]) translate([-2, 44, pos_z]) cube([4, 6, 6], center=true);
  }
}

module roll_bearing(){
  translate([88,0,roll_ray]) difference(){
    union(){
      rotate([0,90,0]) cylinder(r=9, h=8, center=true);
      hull(){
        for (multY=[-1,1]) for (multz=[-1,1]) {
          translate([2, multY*10, multz*10]) rotate([0,90,0]) cylinder(r=1.5, h=4, center=true);
        }
      }
  }
  translate([1.51, 0, 0]) rotate([0,90,0]) cylinder(r=6, h=5, center=true);
  translate([3.51, 0, 0]) rotate([0,90,0]) cylinder(r=6.9, h=1, center=true);
  rotate([0,90,0]) cylinder(r=4, h=8.2, center=true);
  for (multY=[-1,1]) for (multz=[-1,1]) {
    translate([2, multY*8, multz*8]) rotate([0,90,0]) cylinder(r=1.5, h=4.1, center=true);
  }
  }
}

module roll(){
  translate([0,0,roll_ray]) difference(){
    union(){
      //Main cylinder
      rotate([0,90,0]) cylinder(h=185, r=roll_ray, center=true);
      //Discs
      for (pos_x=[-180/2:180/11:180/2]) translate([pos_x,0,0]) rotate([0,90,0])  cylinder(h=3, r=discs_ray, center=true);
    }
    //Axis
    for (posx=[-180/2,180/2]) translate([posx,0,0]) difference(){
      rotate([0,90,0]) cylinder(h=15, r=20, center=true);
      //rotate([0,90,0]) cylinder(h=15.2, r=3, center=true);
    }
    rotate([0,90,0]) cylinder(h=200, r=2.1, center=true);
  }
}

module weight(posz){
  difference(){
    union(){
      translate([0, 22.01, posz]) rotate([0,90,0]) rounded_cube(8, 30, 80, 2);
      for (mir=[1,0]) for (posy=[14,30]) mirror([mir,0,0]) translate([25, posy, posz+6]) cylinder(r=2.5, h=4, center=true);
    }
    for (mir=[1,0]) for (posy=[14,30]) mirror([mir,0,0]) translate([25, posy, posz-2.52]) cylinder(r=2.7, h=3, center=true);
  }
};