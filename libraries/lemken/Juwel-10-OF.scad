/***********************

Lemken Juwel 10 On Field

************************/

include <motors.scad>
include <servo.scad>
include <blocher/plow.scad>
include <tools.scad>
include <n20_linear_actuator.scad>


module _motor_housing(){
   translate([0, -0.1,   8]) cube([10, 12, 26], center=true);
   translate([0, -0.1, -13]) cube([10, 10, 16], center=true);
}

module head(){
union() {
 difference() {
  union() {
    hull() {
      translate([-25, 0, 0]) cube([50,13,0.1]);
      translate([-25, 0, 10]) cube([50,13,0.1]);  
    };
    hull() {
      translate([-5, 0, 15]) cube([2, 10, 0.1]);
      translate([-5, 0, 60]) cube([2, 10, 0.1]);
      translate([-5, 5, 49.9]) cube([2, 5, 0.1]);
    }
    hull() {
      translate([3, 0, 15]) cube([2, 10, 0.1]);
      translate([3, 0, 60]) cube([2, 10, 0.1]);
      translate([3, 5, 49.9]) cube([2, 5, 0.1]);
    }
    translate([-15, 5,  0]) cube([30, 14, 30]);
    translate([ -4, 5, 60]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
    translate([  4, 5, 60]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
    //Rotation axle
    translate([0, 9.5, 8]) rotate(90, [1, 0, 0]) cylinder(r=13, h=19, center=true);
    //Arm fixing
    hull() {
      translate([-25, 0,  0]) cube([2, 13, 0.1]);
      translate([-24, 2, -7]) rotate(90, [0, 1, 0]) cylinder(r=2, h=2, center=true);
      translate([-24, 5, -7]) rotate(90, [0, 1, 0]) cylinder(r=2, h=2, center=true);
    }
    hull() {
      translate([23, 0,  0]) cube([2, 13, 0.1]);
      translate([24, 2, -7]) rotate(90, [0, 1, 0]) cylinder(r=2, h=2, center=true);
      translate([24, 5, -7]) rotate(90, [0, 1, 0]) cylinder(r=2, h=2, center=true);
    }
    
  }
  translate([0, 0, 8]) rotate( 6, [0, 1, 0]) translate([0, 0, -8]) translate([-8.5, 12, 22]) _motor_housing();
  translate([0, 0, 8]) rotate(-6, [0, 1, 0]) translate([0, 0, -8]) translate([ 8.5, 12, 22]) _motor_housing();
  //Rotation axle
  translate([0,   10, 8]) rotate(90, [1, 0, 0]) cylinder(r=3, h=25, center=true);
  translate([0,    9, 8]) rotate(90, [1, 0, 0]) cylinder(r=8, h=12, center=true);
  translate([0,    1, 8]) rotate(90, [1, 0, 0]) cylinder(r=3,  h=7, center=true);
  translate([0, 19.1, 8]) rotate(90, [1, 0, 0]) cylinder(r=3,  h=2, center=true);
  //Arm rod
  translate([-25, 4, -5]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=6, center=true);
  translate([ 25, 4, -5]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=6, center=true);
  //Third point
  for(posz=[40:5:60]) translate([0,  3, posz]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=20, center=true);
  translate([0, 11, 42]) rotate(90, [0, 1, 0]) cube([6, 10, 12], center=true);
  //turning cylinder
  translate([0, 20, 55]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=10, center=true);
  //Assembly
  translate([0, 10, 25]) rotate(90, [1, 0, 0]) cylinder(r=1, h=25, center=true);
 }
}
};

module _beam_fixture(height) {
translate([0, 0, height]) {
 difference(){
    hull(){
       translate([51, -16, 0]) cylinder(r=3, h=1.5, center=true);
       translate([35, -50, 0]) cylinder(r=3, h=1.5, center=true); 
       translate([28, -50, 0]) cylinder(r=3, h=1.5, center=true); 
       translate([28, -16, 0]) cylinder(r=3, h=1.5, center=true); 
    };        
    //Fixing
    translate([27, -49, 0]) cylinder(r=1, h=1.8, center=true); 
    translate([27, -21, 0]) cylinder(r=1, h=1.8, center=true);
    //Beam
    translate([34, -49, 0]) cylinder(r=1.5, h=1.8, center=true); 
    translate([48, -21, 0]) cylinder(r=1.5, h=1.8, center=true);
 };
};
};

module fixing_hub(height) {
translate([0, 0, height]) {
 difference(){
   union(){
    hull(){
       for(pos_x=[-3, 24]) for(pos_y=[-21, -61]) translate([pos_x, pos_y, 0]) cylinder(r=1, h=19, center=true);
    };        
    for(pos_z=[8.75, -8.75]) translate([-4, -9, 0]) _beam_fixture(pos_z);
   };
   //Servo
   translate([ 14, -41, 0]) cube([22, 32, 16], center=true);
   translate([1.5, -41, 0]) cube([ 3, 43, 16], center=true); 
   translate([ -2, -41, 0]) cube([ 4, 32, 16], center=true);
   //Servo screws
   for(pos_y=[-22.5, -59.5]) for(pos_z=[-4, 4]) translate([-3, pos_y,  pos_z]) rotate(90, [0, 1, 0]) cylinder(r=1, h=6, center=true);
   //Servo cable
   translate([15,-21,0]) cube([3,8,7], center=true);
   //Gyroscope
   translate([16,-21,0]) cube([21,2,16], center=true);
   //Fixing screws
   for(pos_x=[7, 22]) for(pos_y=[-23.5, -59.5]) translate([pos_x, pos_y, 0]) cylinder(r=1, h=20, center=true);
   //Half part
   translate([-4, -65, -68]) cube([60, 60, 60]);
 };
};
};

module fixing_hub_plate(height) {
  difference(){
    fixing_hub(height);
    translate([-4, -65, -52+height]) cube([60, 60, 60]);
  };
}

module plow_furrow_beam_link_1(){
  translate([3, -8.5, 13.5]) difference() {
    union() {
      hull() {
        translate([0, 0, -2.5]) cube([2, 60, 2], center=true);
        translate([0, -26.5, 0]) rotate(90, [0, 1, 0]) cylinder(r=3.5, h=2, center=true);
        translate([0, 10, 1.5]) rotate(90, [0, 1, 0]) cylinder(r=5, h=2, center=true);
        translate([0, 29, 5.5]) rotate(90, [0, 1, 0]) cylinder(r=1, h=2, center=true);
      }
      hull() {
        translate([-1, 0, -2.5]) cube([4, 60, 2], center=true);
        translate([-4, -25, -2.5]) cylinder(r=5, h=2, center=true);
        translate([-4, 25, -2.5]) cylinder(r=5, h=2, center=true);
      };
    };
    //beam link
    translate([-4, -25, -2.5]) cylinder(r=1.5, h=5, center=true);
    //angle axle link
    translate([-4, -1, -2.5]) cylinder(r=1.5, h=5, center=true);
    //forrow link
    translate([0, 25, 0]) rotate(90, [0, 1, 0]) cylinder(r=1, h=5, center=true);
    translate([0, 15, 0]) rotate(90, [0, 1, 0]) cylinder(r=1, h=5, center=true);
  };
}

module plow_furrow_beam_link_2(){
  mirror([0, 0, 1]) plow_furrow_beam_link_1();
}

module plow_furrow_link(){
  translate([7, 11.5, 5]) difference() {
    union() {
      cube([2, 20, 24], center=true);
      translate([-4, 0, 0]) cube([10, 20, 10], center=true);
    };
    //furrow fix
    for(posy=[-5,5]) for(posz=[-8.5, 8.5]) translate([0, posy, posz]) rotate(90, [0, 1, 0]) cylinder(r=1.1, h=5, center=true);
    //beanlink fix

  };
}

module angle_axle_link() {
  rotate(30, [0, 0, 1]) translate([-3, 2, -5]) difference() {
    cube([10, 8, 10], center=true);
    translate([1.5, 0, 0]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=11, center=true);
    translate([-1.5, 0, 0]) cylinder(r=1.5, h=11, center=true);
  }
};

module _beam(angle=25) {
  translate([67, 37, 5]) rotate(angle, [0, 0, 1])  union() {
    difference(){
        translate([0, -40, 0]) cube(size=[10, 750, 10], center=false);
        //Fixing plates slots
        for(posz=[-0.1, 9]) hull(){
          translate([5, 112, posz]) cylinder(r=5.5, h=1.1, center=false);
          translate([5, 250, posz]) cylinder(r=5.5, h=1.1, center=false);
        };
        //Fixing plates
        for(y = [45, 80, 105, 125, 165, 175]) translate([5, y+74.7, -0.1]) cylinder(r=1.5, h=10.2);
        //Coulters
        for(y = [-25 : 80 : -25+80*7]) translate([5, y, -0.1]) cylinder(r=1.5, h=10.2);
        //main fix
        translate([5, 112, -0.1]) cylinder(r=2, h=10.2);
    }
    for(y = [-25 : 80 : -25+80*7]) {
      color("SlateGray") translate([5, y, -55]) rotate(angle, [0, 0, -1])  mirror([1, 0, 0]) translate([-5, 0, -2]) plow_furrow();
      color("SlateGray") translate([5, y, 65]) rotate(angle, [0, 0, -1])  rotate(180, [0, 1, 0]) translate([-5, 0, -2]) plow_furrow();
      color("#007cb0") translate([20, y+30, 0]) rotate(angle, [0, 0, -1])  plow_furrow_link();
      color("#007cb0") translate([20, y+30, 0]) rotate(angle, [0, 0, -1])  plow_furrow_beam_link_1();
      color("#007cb0") translate([20, y+30, 10]) rotate(angle, [0, 0, -1])  plow_furrow_beam_link_2();
      translate([20, y+20, 10]) rotate(angle, [0, 0, -1]) angle_axle_link();
    };
    //angle control
    translate([20, 190, 10]) rotate(angle, [0, 0, -1]) angle_axle_link();
  }
}

module beam_fixture(elevation, angle=25) {
  rotate(angle, [0, 0, 1]) translate([76.4, 80, elevation]) difference(){
    union(){
        translate([0, 37, 0]) cube(size=[10, 122, 1], center=false);
        hull(){
            translate([-5, 46.5, 0]) cylinder(r=5, h=1);
            translate([5, 37, 0]) cylinder(r=5, h=1);
            translate([5, 55, 0]) cylinder(r=5, h=1);
        }
        hull(){
            translate([-5, 166.5, 0]) cylinder(r=5, h=1);
            translate([5, 157, 0]) cylinder(r=5, h=1);
            translate([5, 175, 0]) cylinder(r=5, h=1);
        }
    }
    //Main fix
    translate([5, 37.2, -10]) cylinder(r=2, h=21.2);
    for(y = [45, 80, 105, 125, 165, 175]) translate([5, y, -0.1]) cylinder(r=1.5, h=21.2);
    for(y = [46.5, 166.5]) translate([-5, y, -0.1]) cylinder(r=1.5, h=1.2);
    //2 furrows
    for(y = [60, 140]) translate([5, y, -0.1]) cylinder(r=1.5, h=1.2);
  }
}

module offset_arm_cylinderfix(){
  translate([3, 42, 9]) difference(){ 
    hull(){
      translate([0, -2, 0]) cylinder(r=3, h=2);
      translate([0, 5, 0]) cylinder(r=5, h=2);
      translate([10, 12, 0]) cylinder(r=3, h=2);
    };
    translate([-1, 6, 0]) cylinder(r=1.5, h=2);
  };
}

module half_offset_arm() {
  difference(){
    union(){
      //Small part
      translate([4, 12, 17]) cylinder(r=5, h=3);
      translate([-1, 12, 17]) cube(size=[10, 25, 3], center=false);
      translate([-1, 22, 10]) cube(size=[10, 15, 7], center=false);
      //Long part
      hull() {
        translate([-1, 37, 10]) rotate(22, [0, 0, -1]) cube(size=[10, 85, 7], center=false); 
        translate([-1, 37, 10]) rotate(22, [0, 0, -1]) cube(size=[0.1, 115, 7], center=false);
      };
      translate([-1, 37, 16]) rotate(22, [0, 0, -1]) difference(){
        union(){
            translate([0, 0, -1]) cube(size=[10, 125, 5], center=false);
            translate([5, 125, -1]) cylinder(r=5, h=5);
        };
        //girder rotation axle
        translate([5, 125, -1.1]) cylinder(r=2, h=5.2);
      };
      //Cylinder fix
      hull(){
        translate([3, 45, 17]) cylinder(r=3, h=3);
        translate([-3, 58, 17]) cylinder(r=4, h=3);
        translate([7, 55, 17]) cylinder(r=3, h=3);
      };
    }
    //main fix rotation axle
    translate([4, 12, 0]) cylinder(r=2, h=30);
    //Cylinder fix
    translate([-3, 58, 16.9]) cylinder(r=2, h=3.2);
    //Both parts fixings
    translate([-1, 37, 16]) rotate(22, [0, 0, -1]) for(posy=[20:30:100]) translate([5, posy, -10]) cylinder(r=1.1, h=80, center=true); 
  }
};

module _offset_arm(rot) {
    translate([-46, 12, 0]) rotate(rot, [0, 0, -1]) translate([-4, -12, 0]) union() {
      half_offset_arm();
      translate([0, 0, 20]) mirror([0, 0, 1]) half_offset_arm();
    }
};

module central_fixing(posz) {
  translate([16, 140, posz]) difference(){
      union(){
          hull(){
            translate([-5, 5, 9.5]) cylinder(r=5, h=2);
            translate([-57, 5, 9.5]) cylinder(r=5, h=2);
          }
          hull(){
            translate([-32, 5, 9.5]) cylinder(r=5, h=2);
            translate([-37, 0, 9.5]) cylinder(r=5, h=2);
            translate([-42, 5, 9.5]) cylinder(r=5, h=2);
          }
      }
      for (posx=[-5, -47, -57]) translate([posx, 5, 9.4]) cylinder(r=1.5, h=4);
      translate([-37, 0, 9.4]) cylinder(r=2, h=4);
  }
};

module main_fixing() {
    translate([-50, 0, 0]) difference(){
        union(){
            translate([-2, 7, 3]) cube(size=[10, 10, 14], center=false);
            translate([-2, 0, 5]) cube(size=[10,  7, 10], center=false);
            //Piston fix
            translate([3, 0, 5]) cube(size=[10, 2, 10], center=false);
            translate([12, 2, 10]) rotate(90, [1, 0, 0]) cylinder(r=5, h=2);
            translate([ 2, 6,  5]) cube(size=[10, 2, 10], center=false);
            translate([12, 8, 10]) rotate(90, [1, 0, 0]) cylinder(r=5, h=2);
            //Fixings
            hull() {
                translate([ -2, 0,   5]) cube(size=[0.1, 17, 10], center=false);
                translate([-48, 7, 8.5]) cube(size=[0.1, 10,  3], center=false);
            }
            hull() {
                translate([-44, 7, 8.5]) cube(size=[0.1, 10, 3], center=false);
                translate([-52, 7, 8.5]) cube(size=[0.1, 10, 3], center=false);
            }
            translate([-52, 7, 8.5]) cube(size=[5,10,3], center=false);
            translate([-52, 12, 8.5]) cylinder(r=5, h=3);
        }
        //Trou d'attache centrale
        translate([0,0,10]) rotate(90, [1,0,0]) cylinder(r=1.5, h=40, center=true);
        //Trou d'attache du bras de déport        
        translate([4,12,0]) cylinder(r=1.5, h=30);
        //Trou d'attache du piston
        translate([12,0,10]) rotate(90, [1,0,0]) cylinder(r=1.5, h=40, center=true);
        //Trou d'attache fixation
        translate([-52, 12, 4]) cylinder(r=1.5, h=10);
        //Trou vis serrage axe
        translate([4,4,10]) rotate(90, [0,1,0]) cylinder(r=1.5, h=10, center=true);
        translate([4,4,10]) cube(size=[2,8.5,5.5], center=true);
    }
};

module _tilted_catcher_minilinearservo(withmotor=false) {
 difference() {
   union () {
      translate([0, 2, 10]) cube(size = [10, 11, 4]);
      hull() {
      		translate([ -5, -4, 10]) cube(size=[15, 8, 8]);
			    translate([-20, -4, 34]) cube(size=[15, 8, 2]);
      }
      hull() {
      		translate([ -5, 0, 10]) cylinder(r=4, h=2);
			    translate([-20, 0, 34]) cylinder(r=4, h=2);
      }
      if (withmotor && false) {
        //Motor
        translate([-10, 4, 15]) color("FireBrick") difference() {
          cube(size=[15, 12, 19]);
          translate([ 2, 0,  2]) rotate(90, [1, 0, 0]) cylinder(r=1, h=25, center=true);
          translate([13, 0,  2]) rotate(90, [1, 0, 0]) cylinder(r=1, h=25, center=true);
          translate([13, 0, 17]) rotate(90, [1, 0, 0]) cylinder(r=1, h=25, center=true);
          translate([ 2, 0, 17]) rotate(90, [1, 0, 0]) cylinder(r=1, h=25, center=true);
        };
      };
   };
   translate([-4, 0, 0]) cylinder(r=1.5, h=70);
   if (withmotor) {
     translate([-4, -1.5, 20]) cube(size=[6, 3, 30]);
	   translate([-1,  1.5, 20]) cube(size=[3, 3, 30]);
   };
  };
};

module _tilted_catcher_contactor(withmotor=false) {
 difference() {
   union () {
      // hull() {
          translate([0, 2, 10]) cube(size = [10, 11, 2]);
          translate([-5, 2, 18.8]) cylinder(r=5, h=6);
      // };
      hull() {
      		translate([ -5, -2, 10]) cube(size=[15, 4, 8]);
			    translate([-20, -2, 34]) cube(size=[30, 4, 0.1]);
      }
      hull() {
      		translate([ -5, 0, 10]) cylinder(r=2, h=2);
			    translate([-20, 0, 34]) cylinder(r=2, h=0.1);
      }
      

      if (withmotor) {
        //Motor
        translate([-5, 0, 35]) color("FireBrick") contactor();
      };
   };
   //Motor
   translate([-5, 0, 35]) contactor();
   translate([-5, -3.5, 22]) cube([7, 7, 6.5], center=true);
   //Motor screwing
   for(posz=[27, 31]) translate([6, 0, posz]) rotate(90, [0, 1, 0]) cylinder(r=1, h=10, center=true);
  };
};

module _tilted_catcher_servo9g(withmotor=false) {
 difference() {
   union () {
      // hull() {
          translate([0, 2, 8]) cube(size = [10, 11, 2]);
      //    translate([-5, 2, 18.8]) cylinder(r=5, h=6);
      // };
      hull() {
      		translate([ -2, -2, 8]) cube(size=[12, 4, 8]);
			    translate([-10, -2, 22]) cube(size=[20, 4, 0.1]);
      }
      hull() {
      		translate([ -2, 0, 8]) cylinder(r=2, h=2);
			    translate([-10, 0, 22]) cylinder(r=2, h=0.1);
      }
      

      if (withmotor) {
        //Motor
        translate([-10, 18, 10]) rotate(90, [1, 0, 0])color("FireBrick") servo_9g();
      };
   };
   //Servo
   //translate([-5, 0, 35]) servo_9g();
  
  };
};

module arm_moving_rotation_tuning(){
  difference() {
    union() {
    	cylinder(r=20, h=2);
      translate([25, 5, 1]) cube(size=[30, 20, 2], center=true);
    };
    translate([0, 0, -0.1]) cylinder(r=1.5, h=3);
    translate([30, -23, 2]) rotate(15, [0, 0, 1]) cube(size = [50, 40, 5], center=true);
    translate([20, -30, 2]) cube(size = [40, 40, 5], center=true);
    translate([30,  28, 2]) rotate(35, [0, 0, -1]) cube(size = [50, 40, 5], center=true);

    for(angle = [8 : 10 : 200]) rotate(angle, [0, 0, -1.5]) translate([0, -18, -1]) cylinder(r=1, h=4);
  }
};

module arm_moving_arm() {
  union() {
	  translate([0, 0, 3]) cube(size = [150, 3, 8]);
	  translate([150, 0, 3]) rotate(30, [0, 0, 1]) difference() {
       cube(size=[15, 3, 8]);
       for (pos=[5, 12]) translate([pos, 0, 4]) rotate(90, [1, 0, 0]) cylinder(r=1, h=14, center=true);
    };
  }
}

module _arm_moving(){
  translate([-7, -35, 0]) union() {
	  arm_moving_arm();
    translate([-9, 2, 1]) arm_moving_rotation_tuning();
    translate([-9, 2, 11]) arm_moving_rotation_tuning();
  }
};

module final_fix(with_motor=false){
 translate([-7, -35, 0]) union() {
	translate([150, 0, 0]) rotate(30, [0, 0, 1]) difference() {
      hull() {
        translate([0, 0, 3]) cube(size = [20, 2, 8]);
        translate([10, 0, 3]) cube(size = [10, 2, 8]);
      };
      for (pos=[5, 12]) translate([pos, 0, 7]) rotate(90, [1, 0, 0]) cylinder(r=1.25, h=14, center=true);
   };
   //translate([165, -6, 13]) rotate(30, [0,0,1]) mirror([0, 0, 1]) _tilted_catcher_servo9g(with_motor);
   //translate([165, -6,  1]) rotate(30, [0,0,1]) _tilted_catcher_servo9g(with_motor);
   translate([165, -6, 13]) rotate(30, [0,0,1]) mirror([0, 0, 1]) _tilted_catcher_minilinearservo(true);
   translate([165, -6,  1]) rotate(30, [0,0,1]) _tilted_catcher_minilinearservo();
 }
};

module arm_fixed(){
  translate([-23, -29, 3]) union() {
    //Rotation axle
    difference(){
		  translate([-9, 2,    0]) cylinder(r=5, h=8);
		  translate([-9, 2,    0]) cylinder(r=1.7, h=8);
      translate([-9, 2,  7.9]) cylinder(r=4, h=0.2); 
      translate([-9, 2,    5]) cylinder(r=3, h=3); 
      translate([-9, 2, -0.1]) cylinder(r=4, h=0.2); 
      translate([-9, 2,    0]) cylinder(r=3, h=3);
	  };
    translate([-76, 0, 0]) cube(size = [63, 3, 8]);
    translate([-99.5, 18, 0]) rotate(38, [0, 0, -1]) difference(){
		  cube(size=[30, 3, 8]);
      translate([4, 7, 4]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=8);
    };
  };
};

module _fix_axle_1(){
  pos_1=[-102, 12, 7];
  pos_2=[-31, 145, 0];
  color("Silver") union() {
    translate(pos_1) cylinder(r=1.5, h=8);
    translate(pos_2) cylinder(r=1.5, h=19);
    hull(){
      translate(pos_1) sphere(r=1.5);
      translate(pos_2) sphere(r=1.5);
    };
  }
}

module _fix_axle_2(){
  pos_1=[-41, 145, 0];
  pos_2=[-39.5, 253.5, 7];
  color("Silver") union() {
    translate(pos_1) cylinder(r=1.5, h=8);
    translate(pos_2) cylinder(r=1.5, h=19);
    hull(){
      translate(pos_1) sphere(r=1.5);
      translate(pos_2) sphere(r=1.5);
    };
  }
}

module juwel10of(main_angle, beam_angle, catch_angle){
  //fixed part
  translate([-50, -21, 2.5]) head();
  main_fixing();
  //main rotate
  rotate_around_axle(-46, 12, 0, main_angle, 0, 0, 1) union(){
    color("#007cb0") _offset_arm(10);
    translate([-45, 58.5, 11]) rotate(74-$t*1, [0, 0, 1]) rotate(90, [-1, 0, 0]) n20_unfolded_partial(30, $t*30);
    //Beam rotate
    rotate_around_axle(24, 141, 0, beam_angle, 0, 0, 1){
      _beam();
      color("#007cb0") beam_fixture(5);
      color("#007cb0") beam_fixture(14);

      color("#007cb0") central_fixing(-6.5);
      color("#007cb0") central_fixing(5.5);
      rotate_around_axle(-31, 145, 0, main_angle, 0, 0, 1) _fix_axle_1();
      _fix_axle_2();

      //variopack catcher
      color("#007cb0") translate([128, 114, 3]) rotate(65, [0,0,1]) arm_fixed();
      //catching arm
      rotate_around_axle(139.2, 74.5, 3, catch_angle, 0, 0, 1){
        color("#007cb0") translate([130, 110, 3]) rotate(40, [0,0,1]) _arm_moving();
        color("#007cb0") translate([132, 113, 3]) rotate(40, [0,0,1]) final_fix(false);
      }
      //deep control wheel
      translate([-142, 370, 10]) rotate(180, [1, 0, 0]) {
        color("#007cb0") fixing_hub(0);
        color("#007cb0") fixing_hub_plate(-17);
      };
    };
  };
}