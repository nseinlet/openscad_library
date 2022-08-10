/***********************

Lemken Juwel 10 On Field

************************/

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
  translate([0,  3, 40]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=20, center=true);
  translate([0,  3, 45]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=20, center=true);
  translate([0,  3, 50]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=20, center=true);
  translate([0,  3, 55]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=20, center=true);
  translate([0,  3, 60]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=20, center=true);
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
       translate([45, -16, 0]) cylinder(r=3, h=1.5, center=true);
       translate([35, -50, 0]) cylinder(r=3, h=1.5, center=true); 
       translate([28, -50, 0]) cylinder(r=3, h=1.5, center=true); 
       translate([28, -16, 0]) cylinder(r=3, h=1.5, center=true); 
    };        
    //Fixing
    translate([27, -49, 0]) cylinder(r=1, h=1.8, center=true); 
    translate([27, -21, 0]) cylinder(r=1, h=1.8, center=true);
    //Beam
    translate([34, -49, 0]) cylinder(r=1.5, h=1.8, center=true); 
    translate([41, -21, 0]) cylinder(r=1.5, h=1.8, center=true);
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

module _beam() {
    translate([67, 37, 5]) rotate(25, [0, 0, 1]) difference(){
        cube(size=[10, 750, 10], center=false);
        //Fixing plates
        translate([5,  67, 0]) cylinder(r=1.5, h=10);
        translate([5, 129, 0]) cylinder(r=1.5, h=10);
        //Coulters
        for(y = [15 : 74 : 15+75*7]) translate([5, y, 0]) cylinder(r=1.5, h=10);
    }
}

module beam_fixture(elevation) {
    translate([67, 37, elevation]) rotate(25, [0, 0, 1]) 
        difference(){
            union(){
                translate([0, 37, 0]) cube(size=[10, 82, 1], center=false);
                hull(){
                    translate([-5, 46.5, 0]) cylinder(r=5, h=1);
                    translate([5, 37, 0]) cylinder(r=5, h=1);
                    translate([5, 55, 0]) cylinder(r=5, h=1);
                }
                hull(){
                    translate([-5, 126.5, 0]) cylinder(r=5, h=1);
                    translate([5, 117, 0]) cylinder(r=5, h=1);
                    translate([5, 135, 0]) cylinder(r=5, h=1);
                }
            }
            translate([5, 67, 0]) cylinder(r=1.5, h=1);
            translate([5, 129, 0]) cylinder(r=1.5, h=1);
            translate([-5, 46.5, 0]) cylinder(r=1.5, h=1);
            translate([-5, 126.5, 0]) cylinder(r=1.5, h=1);
    }
}

module offset_arm(rot) {
    translate([4, 12, 0]) rotate(rot, [0, 0, -1]) translate([-4, -12, 0])
    difference(){
        union(){
            translate([4, 12, 17]) cylinder(r=5, h=3);
            translate([-1, 12, 17]) cube(size=[10, 25, 3], center=false);
            translate([4, 12, 0]) cylinder(r=5, h=3);
            translate([-1, 12, 0]) cube(size=[10, 25, 3], center=false);
            translate([-1, 22, 3]) cube(size=[10, 15, 14], center=false);
            translate([-1, 37, 3]) rotate(30, [0, 0, -1]) cube(size=[10, 45, 14], center=false); 
            translate([-1, 37, 0]) rotate(30, [0, 0, -1]) difference(){union(){cube(size=[10, 55, 4], center=false); translate([5, 55, 0]) cylinder(r=5, h=4);}; translate([5, 55, 0]) cylinder(r=1.5, h=4); };
            translate([-1, 37, 16]) rotate(30, [0, 0, -1]) difference(){union(){cube(size=[10, 55, 4], center=false); translate([5, 55, 0]) cylinder(r=5, h=4);}; translate([5, 55, 0]) cylinder(r=1.5, h=4); };
            //Attache de bras de retenue
            translate([3, 42, 9]) difference(){ hull(){translate([0, -2, 0]) cylinder(r=3, h=2);translate([0, 5, 0]) cylinder(r=5, h=2);translate([10, 12, 0]) cylinder(r=3, h=2);};translate([-1, 6, 0]) cylinder(r=1.5, h=2);};
        }
        translate([4, 12, 0]) cylinder(r=1.5, h=30);
    }
};

module central_fixing() {
  translate([48, 72, 0]) difference(){
      union(){
          translate([-4, 5, 9.5]) hull(){
            cylinder(r=3, h=3);
            translate([-3, 2, 0]) cylinder(r=3, h=3);
            translate([-3, -2, 0]) cylinder(r=3, h=3);
          }
          translate([-46, 0, 9.5]) cube(size=[39, 10, 3], center=false);
          translate([-46, 5, 9.5]) cylinder(r=5, h=3);
      }
      translate([-5, 5, 5]) cylinder(r=1.5, h=10);
      translate([-28, 5, 9.5]) cylinder(r=1.5, h=4);
      translate([-37, 5, 9.5]) cylinder(r=1.5, h=4);
      translate([-46, 5, 9.5]) cylinder(r=1.5, h=4);
  }
};

module main_fixing() {
    difference(){
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
                translate([-20, 0, 8.5]) cube(size=[0.1, 10,  3], center=false);
            }
            hull() {
                translate([-20, 0, 8.5]) cube(size=[0.1, 10, 3], center=false);
                translate([-28, 0, 8.5]) cube(size=[0.1, 10, 3], center=false);
            }
            translate([-28, 0, 8.5]) cube(size=[5,10,3], center=false);
            translate([-28, 5, 8.5]) cylinder(r=5, h=3);
        }
        //Trou d'attache centrale
        translate([0,0,10]) rotate(90, [1,0,0]) cylinder(r=1.5, h=40, center=true);
        //Trou d'attache du bras de déport        
        translate([4,12,0]) cylinder(r=1.5, h=30);
        //Trou d'attache du piston
        translate([12,0,10]) rotate(90, [1,0,0]) cylinder(r=1.5, h=40, center=true);
        //Trou d'attache fixation
        translate([-28,5,4]) cylinder(r=1.5, h=10);
        //Trou vis serrage axe
        translate([4,4,10]) rotate(90, [0,1,0]) cylinder(r=1.5, h=10, center=true);
        translate([4,4,10]) cube(size=[2,8.5,5.5], center=true);
    }
};

module _tilted_catcher(withmotor=false) {
 difference() {
   union () {
      translate([0, 2, 0]) cube(size = [10, 11, 4]);
      hull() {
      		translate([ -5, -4, 10]) cube(size=[15, 8, 8]);
			    translate([-20, -4, 34]) cube(size=[15, 8, 2]);
      }
      hull() {
      		translate([ -5, 0, 10]) cylinder(r=4, h=2);
			    translate([-20, 0, 34]) cylinder(r=4, h=2);
      }
      if (withmotor) {
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

module arm_moving_rotation_tuning(){
  difference() {
    union() {
    	cylinder(r=20, h=2);
      translate([25, 5, 1]) cube(size=[30, 20, 2], center=true);
    };
    cylinder(r=1.5, h=3);
    translate([30, -23, 2]) rotate(15, [0, 0, 1]) cube(size = [50, 40, 5], center=true);
    translate([20, -30, 2]) cube(size = [40, 40, 5], center=true);
    translate([30,  28, 2]) rotate(35, [0, 0, -1]) cube(size = [50, 40, 5], center=true);

    for(angle = [8 : 10 : 200]) rotate(angle, [0, 0, -1.5]) translate([0, -18, 0]) cylinder(r=1, h=4);
  }
};

module arm_moving_arm() {
  union() {
	  translate([0, 0, 3]) cube(size = [150, 4, 8]);
	  translate([150, 0, 3]) rotate(30, [0, 0, 1]) difference() {
       cube(size=[20, 4, 8]);
       translate([10, 0, 4]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=14, center=true);
    };
  }
}

module _arm_moving(){
  union() {
	  arm_moving_arm();
    translate([-9, 2, 1]) arm_moving_rotation_tuning();
    translate([-9, 2, 11]) arm_moving_rotation_tuning();
  }
};

module final_fix(with_motor=false){
 union() {
	translate([150, 0, 0]) rotate(30, [0, 0, 1]) difference() {
     cube(size = [20, 4, 14]);
     translate([10, 0, 7]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=14, center=true);
   };
   translate([165, -6, 14]) rotate(30, [0,0,1]) mirror([0, 0, 1]) _tilted_catcher(with_motor);
   translate([165, -6,  0]) rotate(30, [0,0,1]) _tilted_catcher();
   //Box for servo
   translate([165, 1.9, -17]) rotate(30, [0, 0, 1]) rotate(90, [1, 0, 0]) 
   union() {
     difference() {
       cube(size=[18, 25, 6], center=true);
       cube(size=[15, 22, 7], center=true);
     };
     translate([ 7, 0, 0.5]) cube(size=[2, 13, 5], center=true);
     translate([-7, 0, 0.5]) cube(size=[2, 13, 5], center=true);
   };
 }
};

module arm_fixed(){
  translate([0, 0, 3]) union() {
    //Rotation axle
    difference(){
		  translate([-9, 2,    0]) cylinder(r=8, h=8);
		  translate([-9, 2,    0]) cylinder(r=1.7, h=8);
      translate([-9, 2,  7.9]) cylinder(r=4, h=0.2); 
      translate([-9, 2,    5]) cylinder(r=3, h=3); 
      translate([-9, 2, -0.1]) cylinder(r=4, h=0.2); 
      translate([-9, 2,    0]) cylinder(r=3, h=3);
	  };
    translate([-76, 0, 0]) cube(size = [60, 4, 8]);
    translate([-99, 18, 0]) rotate(38, [0, 0, -1]) difference(){
		  cube(size=[30, 6, 8]);
      translate([4, 7, 4]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=8);
    };
  };
};
