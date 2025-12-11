include <tools.scad>

blade_thickness = 2;
blade_width = 180;
blade_height = 54;
upper_blade_width = blade_width-10;
upper_blade_height = 18;
side_blade_width = blade_width/2+5;
upper_side_blade_width = side_blade_width-10;
hinge_holes = [9, 45, 79];

module _half_middle_blade(angle, with_hinge_holes){
  difference(){
    union(){
      translate([blade_width/4, blade_thickness/2, blade_height/2]) cube([blade_width/2, blade_thickness, blade_height], center=true);
      rotate_around_axle(0, blade_thickness, blade_height, angle, 1, 0, 0) hull(){
        translate([blade_width/4, blade_thickness/2, blade_height]) cube([blade_width/2, blade_thickness, 0.01], center=true);
        translate([upper_blade_width/4, blade_thickness/2, blade_height + upper_blade_height/2]) cube([upper_blade_width/2, blade_thickness, upper_blade_height], center=true);
      }
    }
    for (x=[4:5:40]){
        rotate_around_axle(0, blade_thickness, blade_height, angle, 1, 0, 0) hull(){
            translate([(upper_blade_width/2)-x, blade_thickness-0.1, blade_height+3]) rotate([90, 0, 0]) cylinder(h=blade_thickness*2, r=1.25, center=true);
            translate([(upper_blade_width/2)-x, blade_thickness-0.1, blade_height+upper_blade_height-3]) rotate([90, 0, 0]) cylinder(h=blade_thickness*2, r=1.25, center=true);
        }
    }
    if (with_hinge_holes) for (z=[6, blade_height-3]) for (x=hinge_holes) translate([(blade_width/2)-x, blade_thickness-0.1, z]) rotate([90, 0, 0]) cylinder(h=blade_thickness*2, r=1.01, center=true);
    // 3rd point hole
    for (posx=[20, 45]) translate([posx,0,17]) rotate([90,0,0]) cylinder(r=1, h=blade_thickness*2, center=true);
  }
}

module middle_blade(angle=0, with_hinge_holes=true){
  union(){
    _half_middle_blade(angle, with_hinge_holes);
    mirror([1,0,0]) _half_middle_blade(angle, with_hinge_holes);
  }
}

module side_blade(angle=0, with_hinge_holes=true){
  difference(){
    union(){
      translate([side_blade_width/2, blade_thickness/2, blade_height/2]) cube([side_blade_width, blade_thickness, blade_height], center=true);
      rotate_around_axle(0, blade_thickness, blade_height, angle, 1, 0, 0) hull(){
        translate([side_blade_width/2, blade_thickness/2, blade_height]) cube([side_blade_width, blade_thickness, 0.01], center=true);
        translate([upper_side_blade_width/2, blade_thickness/2, blade_height + upper_blade_height/2]) cube([upper_side_blade_width, blade_thickness, upper_blade_height], center=true);
      }
    }
    for (x=[14:5:40]){
        rotate_around_axle(0, blade_thickness, blade_height, angle, 1, 0, 0) hull(){
            translate([(upper_side_blade_width/2)-x, blade_thickness-0.1, blade_height+upper_blade_height-3-upper_blade_height+6]) rotate([90, 0, 0]) cylinder(h=blade_thickness*2, r=1.25, center=true);
            translate([(upper_side_blade_width/2)-x, blade_thickness-0.1, blade_height+upper_blade_height-3]) rotate([90, 0, 0]) cylinder(h=blade_thickness*2, r=1.25, center=true);
        }
        hull(){
            translate([(upper_side_blade_width/2)-x, blade_thickness-0.1, blade_height-11-upper_blade_height+6]) rotate([90, 0, 0]) cylinder(h=blade_thickness*2, r=1.25, center=true);
            translate([(upper_side_blade_width/2)-x, blade_thickness-0.1, blade_height-11]) rotate([90, 0, 0]) cylinder(h=blade_thickness*2, r=1.25, center=true);
        }
    }
    // Hinge holes
    if (with_hinge_holes) for (z=[10, blade_height-7]) for (x=hinge_holes) translate([side_blade_width-x, blade_thickness-0.1, z]) rotate([90, 0, 0]) cylinder(h=blade_thickness*2, r=1.01, center=true);
    // Hinge fix
    translate([77.75, 0, 17]) rotate([90,0,0]) cylinder(r=1.5, h=30, center=true);
  }
}


module hinge(with_hinge_holes=true){
    difference(){
        union(){
          translate([-3, 0, 0]) cube([(blade_width/2)+3, 2, 4], center=false);
          translate([-3, -1, 2]) cylinder(r=3, h=4, center=true);
        }
        if (with_hinge_holes) for (x=hinge_holes) translate([x, 0, 2]) rotate([90, 0, 0]) cylinder(h=blade_thickness+12, r=1.01, center=true);
        translate([-3, -1, 2]) cylinder(r=1.5, h=5, center=true);
    }
}

module hoof(){
    translate([0,1,0]) difference(){
        hull(){
            translate([0, 0, -2]) cube([blade_width, blade_thickness+8, 0.01], center=true);
            translate([0, 0, 4]) cube([blade_width, blade_thickness, 0.01], center=true);
        }
        // Side rounds
        for (mir=[0,1]) mirror([mir,0,0]) translate([3,0,0]) hull(){
            translate([blade_width/2, 0, -2]) cylinder(h=0.01, r=(blade_thickness+8)/2, center=true);
            translate([blade_width/2, 0, 4]) cylinder(h=0.01, r=blade_thickness/2, center=true);
        }
        //blade
        translate([0,0,2.01]) cube([blade_width, blade_thickness, 4], center=true);
    }
}

module side_hoof(){
    difference(){
        hull(){
            translate([0, 0, -2]) cube([side_blade_width, blade_thickness+8, 0.01], center=true);
            translate([0, 0, 4]) cube([side_blade_width, blade_thickness, 0.01], center=true);
        }
        // Side round
        translate([3,0,0]) hull(){
            translate([side_blade_width/2, 0, -2]) cylinder(h=0.01, r=(blade_thickness+8)/2, center=true);
            translate([side_blade_width/2, 0, 4]) cylinder(h=0.01, r=3, center=true);
        }
        //blade
        translate([0,0,2.01]) cube([side_blade_width, blade_thickness, 4], center=true);
    }
}

module axis_hoof(){
    translate([3,1,0]) difference(){
        hull(){
            translate([blade_width/2, 0, -2]) cylinder(h=0.01, r=(blade_thickness+8)/2, center=true);
            translate([blade_width/2, 0, 4]) cylinder(h=0.01, r=3, center=true);
        }
        translate([blade_width/2, 0, 3]) cylinder(h=12, r=1.5, center=true);
        translate([blade_width/2, 0, -0.6]) cylinder(h=3, r=2.8, center=true);
    }
}

module three_points_linkage_arm_fix(){
  difference(){
    union(){
         hull(){
            translate([0, -10, 0]) cube([2, 10, 10], center=true);
            translate([0, 5, 0]) rotate([0, 90, 0]) cylinder(r=5, h=2, center=true);
        }
        translate([0, -10, 0]) cube([2, 4, 14], center=true);
    }
    // Low Arm holes
    translate([0, 5, 0]) rotate([0, 90, 0]) cylinder(r=2, h=20, center=true);
  }
}

module three_points_linkage_inter_arm_fix(){
  union(){
    translate([0, -10, 0]) cube([2, 2, 14], center=true);
    translate([0, -10, 0]) cube([5, 2, 10], center=true);
  }
}

module three_points_linkage_middle_arm_fix(){
  union(){
    for (pos_x=[0, -12, 12])translate([pos_x, -10, 0]) cube([6, 2, 14], center=true);
    translate([0, -10, 0]) cube([38, 2, 10], center=true);
  }
}

module three_points_linkage_blade_fix(){
  difference(){
    union(){
      translate([0,-74.5,0]) cube([110, 6, 10], center=true);
      for (pos_x=[-45, -20, 20, 45]) translate([pos_x, -72.5, 0]) cube([6, 2, 14], center=true);
    }
    for (pos_x=[-45, -20, 20, 45]) translate([pos_x, -72.5, 0]) rotate([90,0,0]) cylinder(r=1.1, h=15, center=true);
  }
}

module three_points_linkage_side(){
    translate([-23.6,-70,0]) rotate([0,0,112.6]) union(){
      translate([0,-72.5,0]) cube([58, 2, 10], center=true);
      for (pos_x=[-17, 17]) translate([pos_x, -72.5, 0]) cube([6, 2, 14], center=true);
    }
}

module three_points_linkage_side_short(){
    translate([-23.6,-93.5,0]) rotate([0,0,132.5]) union(){
      translate([-20,-71.7,0]) cube([30, 2, 10], center=true);
      for (pos_x=[-30, -10]) translate([pos_x, -71.7, 0]) cube([6, 2, 14], center=true);
    }
}

module three_points_linkage_base(){
 cylinder_pos = [4, -60, 0];
 union(){
  difference(){
    hull(){
      translate([0, -10, 0]) cube([70, 10, 2], center=true);
      translate([60, -74.5, 0]) cylinder(r=3, h=2, center=true);
      translate([-60, -74.5, 0]) cylinder(r=3, h=2, center=true);
    }
    //Main hole
    hull(){
      for (mul=[-1,1]) {
        translate([mul*29, -18, -0.05]) cylinder(r=3, h=2.2, center=true);
        translate([mul*50, -68.5, -0.05]) cylinder(r=3, h=2.2, center=true);
      }
    }
    //Vertical plates holes
    translate([0,0,-0.1]){
      for (mir=[0,1]) mirror([mir,0,0]){
        for (pos_x=[20,27,34]) translate([pos_x,-10,0]) cube([2, 5, 2.2], center=true);
        for (pos_y=[5,-5]) for (pos_x=[23.5,30.5]) translate([pos_x,pos_y-10,0]) cube([2.2,4.2,2.2], center=true);
        for (pos_y=[4,-4]) for (pos_x=[0, 12]) translate([pos_x, pos_y-10, 0]) cube([6.2, 2.2, 2.2], center=true);
        for (pos_x=[20, 45]) translate([pos_x, -72.5, 0]) cube([6.2, 2.2, 2.2], center=true);
        translate([0,0,6]) three_points_linkage_side();
        //3rd point fixing holes
        translate([6,-10, 0.1]) cube([2.2, 4.2, 2.2], center=true);
        //arm rotation
        translate([60, -74, 0.1]) cylinder(r=1.5, h=2.2, center=true);
      }
    }
  }
 }
 for (mir=[0,1]) mirror([mir,0,0]) difference(){
    hull(){
      translate(cylinder_pos) cylinder(r=5, h=2, center=true);
      translate([4, -74, 0]) cube([20, 0.1, 2], center=true);
    }
    //Cylinder fix
    translate(cylinder_pos) cylinder(r=2, h=3, center=true);
 }
}

module three_points_linkage_shortbase(shorting){
 cylinder_pos = [4, -60, 0];
 union(){
  difference(){
    hull(){
      translate([0, -10-shorting, 0]) cube([70, 10, 2], center=true);
      translate([60, -74.5, 0]) cylinder(r=3, h=2, center=true);
      translate([-60, -74.5, 0]) cylinder(r=3, h=2, center=true);
    }
    //Main hole
    hull(){
      for (mul=[-1,1]) {
        translate([mul*29, -18-shorting, -0.05]) cylinder(r=3, h=2.2, center=true);
        translate([mul*45, -68.5, -0.05]) cylinder(r=3, h=2.2, center=true);
      }
    }
    //Vertical plates holes
    translate([0,0,-0.1]){
      for (mir=[0,1]) mirror([mir,0,0]){
        for (pos_x=[20,27,34]) translate([pos_x,-10,0]) cube([2, 5, 2.2], center=true);
        for (pos_y=[5,-5]) for (pos_x=[23.5,30.5]) translate([pos_x,pos_y-10,0]) cube([2.2,4.2,2.2], center=true);
        for (pos_y=[4,-4]) for (pos_x=[0, 12]) translate([pos_x, pos_y-10, 0]) cube([6.2, 2.2, 2.2], center=true);
        for (pos_x=[20, 45]) translate([pos_x, -72.5, 0]) cube([6.2, 2.2, 2.2], center=true);
        translate([0,0,6]) three_points_linkage_side_short();
        //3rd point fixing holes
        translate([6,-10, 0.1]) cube([2.2, 4.2, 2.2], center=true);
        //arm rotation
        translate([60, -74, 0.1]) cylinder(r=1.5, h=2.2, center=true);
      }
    }
  }
 }
 for (mir=[0,1]) mirror([mir,0,0]) difference(){
    hull(){
      translate(cylinder_pos) cylinder(r=5, h=2, center=true);
      translate([4, -74, 0]) cube([20, 0.1, 2], center=true);
    }
    //Cylinder fix
    translate(cylinder_pos) cylinder(r=2, h=3, center=true);
 }
}

module three_points_linkage_third_point(){
  difference(){
    union(){
      translate([6, -10, 0.5]) cube([2, 4, 15], center=true);
      translate([6, -10, 20+7.2]) cube([2, 8, 40], center=true);
      translate([6, -6, 40+7.2-4]) rotate([0, 90, 0]) cylinder(r=4, h=2, center=true);
    }
    //3point hole
    translate([6, -5, 40+7.2-4]) rotate([0, 90, 0]) cylinder(r=1.25, h=2.2, center=true);
    //horizontal bar fix
    translate([6, -10, 40+7.2-1])  cube([2.2,4,2.2], center=true);
    translate([6, -13, 40+7.2-6])  cube([2.2,2.2,4], center=true);
  }
}

module three_points_linkage_third_point_horizontal(){
  difference(){
    union(){
      cube([14,4,2], center=true);
      cube([10,8,2], center=true);
    }
    //horizontal bar fix

  }
}

module _three_points_linkage(){
  translate([0, 80, 17]){
    for (mir=[0,1]) mirror([mir,0,0]) {
        for (pos_x=[20,27,34]) translate([pos_x,0,0]) three_points_linkage_arm_fix();
        for (pos_y=[4,-4]) for (pos_x=[23.5,30.5]) translate([pos_x,pos_y,0]) three_points_linkage_inter_arm_fix();
        three_points_linkage_side();
        three_points_linkage_third_point();
    }
    for (pos_y=[4,-4]) translate([0,pos_y,0]) three_points_linkage_middle_arm_fix();
    for (h=[6,-6]) translate([0,0,h]) three_points_linkage_base();
    three_points_linkage_blade_fix();
    translate([0,-10,46]) three_points_linkage_third_point_horizontal();
    translate([0,-13,41]) rotate([90,0,0]) three_points_linkage_third_point_horizontal();
  }
}

module _three_points_linkage_short(){
  shorting=33;
  translate([0, 80, 17]){
    for (mir=[0,1]) mirror([mir,0,0]) {
        for (pos_x=[20,27,34]) translate([pos_x,-shorting,0]) three_points_linkage_arm_fix();
        for (pos_y=[4,-4]) for (pos_x=[23.5,30.5]) translate([pos_x,pos_y-shorting,0]) three_points_linkage_inter_arm_fix();
        three_points_linkage_side_short();
        translate([0,-1*shorting,0]) three_points_linkage_third_point();
    }
    for (pos_y=[4,-4]) translate([0,pos_y-shorting,0]) three_points_linkage_middle_arm_fix();
    for (h=[6,-6]) translate([0,0,h]) three_points_linkage_shortbase(shorting);
    three_points_linkage_blade_fix();
    translate([0,-10-shorting,46]) three_points_linkage_third_point_horizontal();
    translate([0,-13-shorting,41]) rotate([90,0,0]) three_points_linkage_third_point_horizontal();
  }
}

module rotation_arm1(){
  begin=[60, 6, 0];
  //middle=[85, 26, 0];
  end=[92, 31, 0];
  difference(){
    union(){
      hull(){
      translate(begin) cylinder(r=3, h=9.5, center=true);
      translate(end) cylinder(r=3, h=9.5, center=true);
      }
    }
    //holes
    translate(begin) cylinder(r=1.5, h=10.2, center=true);
    translate(end) cylinder(r=1.5, h=10.2, center=true);
  }
}

module rotation_arm2(){
  begin=[92, 31, 0];
  end=[113,18,0];
  difference(){
    union(){
      hull(){
        translate(begin) cylinder(r=3, h=5, center=true);
        translate(end) cylinder(r=3, h=5, center=true);
      }
    }
    //holes
    translate(begin) cylinder(r=1.5, h=7.2, center=true);
    translate(end) cylinder(r=1.5, h=7.2, center=true);
  }
}

module _rotation_arms(angle1, angle2){
  rotate_around_axle(x=60, y=6, z=0, angle=angle1, rx=0, ry=0, rz=1) {
    rotation_arm1();
    rotate_around_axle(x=92, y=31, z=0, angle=angle2, rx=0, ry=0, rz=1) {
      translate([0,0,8]) rotation_arm2();
      rotate_around_axle(x=113, y=18, z=0, angle=32, rx=0, ry=0, rz=1) {
        side_blade_cylinder_hinge();
      };
    }
  }
}

module hinge_tube(){
  difference(){
    cylinder(r=3,h=32,center=true);
    cylinder(r=1.2,h=33,center=true);
  }
}

module side_blade_cylinder_hinge(){
  pos=[113,18,0];
  difference(){
    hull(){
    translate([4.4,-4,0]) translate(pos) cube([0.1,18, 10], center=true);
    translate(pos) rotate([0,0,0]) cylinder(r=4, h=10,center=true);
    }
    //Axis
    translate(pos) rotate([0,0,0]) cylinder(r=1.5,h=40,center=true);
    //Blade fix
    translate(pos) rotate([0,90,0]) cylinder(r=1.5,h=40,center=true);
  }

}