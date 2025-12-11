include <../servo.scad>
include <../n20_linear_actuator.scad>

module _3points_linkage_third_point(posx){
    translate([posx, 0, 0]) {
        difference(){
            union(){
                translate([0,-10,41]) rotate(90, [0,1,0]) cylinder(r=4, h=2, center=true);
                translate([0,-5,41]) cube([2,10,8], center=true);
            }
            translate([0,-10,41]) rotate(90, [0,1,0]) cylinder(r=1.5, h=2.2, center=true);
        }
    }
}

module _3points_linkage_arm_fix(posx){
    translate([posx, 0, 0]) {
        difference(){
            union(){
                hull(){
                    translate([0,-10, 11]) rotate(90, [0,1,0]) cylinder(r=4, h=2, center=true);
                    translate([0,-10,-5]) rotate(90, [0,1,0]) cylinder(r=4, h=2, center=true);
                }
                translate([0,-5,7.5]) cube([2,10,15], center=true);
            }
            for (z=[-5, 0, 5, 10]) translate([0,-10, z]) rotate(90, [0,1,0]) cylinder(r=1.5, h=2.2, center=true);
        }
    }
}

module three_points_linkage(){
    difference(){
        union(){
            translate([0,0,7.5]) cube([66, 2, 15], center=true);
            _3points_linkage_arm_fix(-32);
            _3points_linkage_arm_fix(-26);
            _3points_linkage_arm_fix(26);
            _3points_linkage_arm_fix(32);
            translate([0,0,45/2]) cube([10, 2, 45], center=true);
            _3points_linkage_third_point(-4);
            _3points_linkage_third_point(4);
        }
 
    }
}

module rear_platform(){
    difference(){
        rotx=-15.5;
        roty=17.5;
        union(){
            three_points_linkage();
            //main plate
            translate([12, 18.5, 2]) cube([90, 35, 4], center=true);
            //servo support
            for(posx=[49,1]) translate([posx, 14, 11.5]) difference(){
                cube([8, 20, 20], center=true);
                for(posy=[-5,5]) translate([0,posy,1]) cylinder(r=1.2,h=20, center=true);
            }
            //Arm rotation (bearing rolls are 4x12x4)
            translate([rotx, roty, -3.9]) cylinder(r=10, h=4);
            hull(){
                translate([rotx, roty, 45]) cylinder(r=10, h=4);
                translate([rotx-15, roty-13, 45]) cube([25, 4, 4]);
                translate([rotx+8.5, roty-13, 45]) cube([4, 20, 4]);
            }
            translate([rotx-15, roty-13, 4]) cube([25, 4, 45]);
            translate([rotx+8.5, roty-13, 4]) cube([4, 20, 45]);
        }
        //Arm rotation (bearing rolls are 4x12x4)
        translate([rotx, roty, -0.1]) cylinder(r=2.2, h=100);
        for(posz=[-4, 46]) translate([rotx, roty, posz]) cylinder(r=6, h=4);
        //Cover screws
        for(posz=[-4, 26]) for(posx=[-31,0,30, 55]) for(posy=[2.5,34.5]) translate([posx,posy,-3.5]) cylinder(r=0.8,h=8);
    }
    //translate([45, 4, 24]) rotate(180, [0,1,0]) servo_powerhd_1501mg();
}

module rear_platform_cover(){
  difference(){
    //outside box
    hull(){
      translate([-33,1,4]) cube([2,35,0.1]);
      translate([55,1,4]) cube([2,35,0.1]);
      translate([-25,18.5,50]) rotate(90, [1,0,0]) cylinder(r=8, h=35, center=true);
      translate([5,18.5,60]) rotate(90, [1,0,0]) cylinder(r=8, h=35, center=true);
      translate([49,18.5,50]) rotate(90, [1,0,0]) cylinder(r=8, h=35, center=true);
    }
    //inside box
    hull(){
      translate([-31,4,3.5]) cube([2,29,0.1]);
      translate([53,4,3.5]) cube([2,29,0.1]);
      translate([-25,18.5,50]) rotate(90, [1,0,0]) cylinder(r=6, h=29, center=true);
      translate([5,18.5,60]) rotate(90, [1,0,0]) cylinder(r=6, h=29, center=true);
      translate([49,18.5,50]) rotate(90, [1,0,0]) cylinder(r=6, h=29, center=true);
    }
    //Arm
    translate([-35,8.5,3.9]) cube([40, 30, 41]);
    //Screws
    for(posx=[-31,0,30, 55]) for(posy=[2.5,34.5]) translate([posx,posy,3.5]) cylinder(r=0.8,h=8);
  }
}

module arm_rotation_axis(){
  rotx=-15.5;
  roty=17.5;
  pos_link=14;
  translate([rotx,roty,4.1]) rotate(90, [0,0,1]) difference(){
    union(){
        cylinder(r=8.4,h=40.7);
        //arm fix
        hull(){
          translate([-4,6,3.7]) cube([8, 0.1, 32]);
          translate([0,24,30]) rotate(90, [0,1,0]) cylinder(r=5, h=8, center=true);
          translate([0,14,9]) rotate(90, [0,1,0]) cylinder(r=3, h=8, center=true);
        }
        //servo link
        hull(){
          translate([0, 0, 0.5]) cylinder(r=8.4, h=3);
          translate([9,pos_link, 0.5]) cylinder(r=4, h=3);
        }
    }
    for(posz=[-0.1,36.75]) translate([0,0,posz]) cylinder(r=6,h=4);
    cylinder(r=2.2,h=60);
    //arm rotation
    translate([0,24,30]) rotate(90, [0,1,0]) cylinder(r=2, h=9, center=true);
    translate([0,14,9]) rotate(90, [0,1,0]) cylinder(r=1.5, h=9, center=true);
    hull(){
        translate([0,14,9]) rotate(90, [0, 1, 0]) cylinder(r=3.1, h=4, center=true);
        translate([0,20,12]) rotate(90, [0, 1, 0]) cylinder(r=3.1, h=4, center=true);
    }
    //servo link
    translate([10, pos_link, 0.4]) cylinder(r=1.5, h=4);
    translate([8.4, -2.8, 0.4]) cube([4,10,4]);
  }
};

