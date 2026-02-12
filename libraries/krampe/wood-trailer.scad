include <profiles.scad>
include <tools.scad>

module rim(){
  rotate(90, [1, 0, 0]) difference(){
    union(){
      tube(11.5, 9, 18);
      tube(14, 9, 12);
      translate([0,0,-9.5]) tube(14, 9, 1);
      translate([0,0, 9.5]) tube(14, 9, 1);
      translate([0,0, -2]) cylinder(r=9, h=16,center=true);
    }
    //Main axle
    cylinder(r=2, h=21, center=true);
    //inner design
    hull(){
      translate([0, 0, 8]) cylinder(r=9, h=4,center=true);
      translate([0, 0, 7]) cylinder(r=7, h=16,center=true);
    };
    //ball bearing (inside)
    translate([0,0,-8.51]) cylinder(r=4, h=3, center=true);
    translate([0,0,-10.1]) cylinder(r=4.5, h=0.5, center=true);
    //ball bearing (outside)
    translate([0,0,-2.49]) cylinder(r=4, h=3, center=true);
    translate([0,0,-1.2]) cylinder(r=4.5, h=0.5, center=true);
  }
}

module tire(){
  color("black") rotate(90, [1, 0, 0]) difference(){
    cylinder(r=27, h=20, center=true);
    cylinder(r=14, h=21, center=true);
  }
}

module dual_axle(){
    difference(){
      union(){
        //Wheels axles
        translate([-30, 0, 27]) rotate(90, [1, 0, 0]) cylinder(r=6, h=8, center=true);
        translate([ 30, 0, 27]) rotate(90, [1, 0, 0]) cylinder(r=6, h=8, center=true);
        //Axle frame
        hull(){
            translate([-30, 6, 27]) rotate(90, [1, 0, 0]) cylinder(r=6, h=4, center=true);
            translate([0, 6, 33]) rotate(90, [1, 0, 0]) cylinder(r=6, h=4, center=true);
            translate([ 30, 6, 27]) rotate(90, [1, 0, 0]) cylinder(r=6, h=4, center=true);
        }
      }
      for (posx=[-30, 30]) {
        //Main axle
        translate([posx, 0, 27]) rotate(90, [1, 0, 0]) cylinder(r=2, h=19, center=true);
        //Ball bearings
        for(pos=[6.0, -2.05]) translate([posx, pos, 27]) rotate(90, [1, 0, 0]) cylinder(r=4, h=3.1, center=true);
        for(pos=[7.8, -3.8]) translate([posx, pos, 27]) rotate(90, [1, 0, 0]) cylinder(r=4.5, h=0.51, center=true);
      }
      //Frame fix
      translate([0, 6, 35]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=5, center=true);
    }
}

module front_axis(){
  difference(){
    union(){
      for(mir=[1,0]) hull(){
        mirror([0, mir, 0]) translate([0,39,0]) rotate(90, [1, 0, 0]) cylinder(r=6, h=19, center=true);
        translate([0,0,10]) rotate(90, [0, 1, 0]) cylinder(r=6, h=12, center=true);
      }
    }
    //fixture
    translate([0,0,12]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=13, center=true);
    //main axis
    translate([0,0,0]) rotate(90, [1, 0, 0]) cylinder(r=6.1, h=60, center=true);
    translate([0,0,0]) rotate(90, [1, 0, 0]) cylinder(r=2, h=180, center=true);
    //Bearings
    for(pos=[32.0, 46.5]) for(mir=[1,0]) mirror([0, mir, 0]) translate([0, pos, 0]) rotate(90, [1, 0, 0]) cylinder(r=4, h=3.1, center=true);
    for(pos=[30.25, 48.25]) for(mir=[1,0]) mirror([0, mir, 0]) translate([0, pos, 0]) rotate(90, [1, 0, 0]) cylinder(r=4.5, h=0.51, center=true);
  }
}

module rear_axis(posx){
  translate([posx, 0, 28]) difference(){
    union(){
      for(mir=[1,0]) hull(){
        mirror([0, mir, 0]) translate([0,39,0]) rotate(90, [1, 0, 0]) cylinder(r=6, h=19, center=true);
        translate([0,0,10]) rotate(90, [0, 1, 0]) cylinder(r=6, h=40, center=true);
      }
      translate([0, 0, 13]) cube([60, 67, 8] , center=true);
    }
    //main axis
    translate([0,0,0]) rotate(90, [1, 0, 0]) cylinder(r=6.1, h=60, center=true);
    translate([0,0,0]) rotate(90, [1, 0, 0]) cylinder(r=2, h=180, center=true);
    //Bearings
    for(pos=[32.5, 46.5]) for(mir=[1,0]) mirror([0, mir, 0]) translate([0,pos , 0]) rotate(90, [1, 0, 0]) cylinder(r=4.5, h=3.1, center=true);
    for(pos=[30.25 ,48.25]) for(mir=[1,0]) mirror([0,mir , 0]) translate([0,pos , 0]) rotate(90,[1 , 0 , 0]) cylinder(r=4.5,h=0.51 ,center=true);
    //Frame fix
    for(pos=[-18,0,18]) translate([pos, 0, 13]) rotate(90, [1, 0, 0]) cylinder(r=1, h=80, center=true);
    //Wood rack
    for(mult=[1,-1]) translate([-15, mult*29, 13]) cylinder(r=1.5, h=20, center=true);
    //Short frame fix
    for(mult=[1,-1]) translate([23, mult*29, 13]) cylinder(r=1.5, h=20, center=true);
  }
}

module front_streer(){
    difference(){
        union(){
            for (posx=[21.5, 38.5])hull(){
                translate([posx,0,36]) rotate(90, [0, 1, 0]) cylinder(r=6, h=4, center=true);
                translate([posx,0,44]) cube([4,76,1], center=true);
            }
            translate([30,0,46]) cylinder(r=40, h=4, center=true);
            for(posy=[-20,-27,20,27]) hull(){
                translate([ 0, posy, 40]) rotate(90, [1, 0, 0]) cylinder(r=4, h=3, center=true);
                translate([10, posy, 46]) cube([20, 3, 0.1], center=true);
            }
            //Rotation bearing support
            translate([30, 0, 51]) cylinder(r=25, h=6, center=true);
            translate([30, 0, 48]) cylinder(r=25.5, h=0.3, center=true);
        }
        //Axis fixture
        translate([30,0,39]) rotate(90, [0, 1, 0]) cylinder(r=1.5, h=40, center=true);
        //Small bearing
        translate([30, 0, 44.25]) cylinder(r=4.5, h=0.51, center=true);
        translate([30, 0, 46]) cylinder(r=4, h=3.1, center=true);
        translate([30, 0, 46]) cylinder(r=2.5, h=26, center=true);
        //tiller fixture
        translate([ 0,0,40]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=60, center=true);
    }
}

module tiller(){
    difference(){
        union(){
            for(posy=[-23.5, 23.5]) {
                //Steering fix
                hull(){
                    translate([ 0, posy,40]) rotate(90, [1, 0, 0]) cylinder(r=3.7, h=3.6, center=true);
                    translate([-10,posy,40]) cube([0.1, 3.7, 7.2], center=true);
                }
                //lateral beam
                hull(){
                    translate([-10,posy,40]) cube([0.1, 3.7, 7.2], center=true);
                    translate([-100, 0,40]) cube([0.1, 3.7, 7.2], center=true);
                }
            }
            //horizontal beam
            translate([-13, 0, 40]) cube([ 7, 44, 7.2], center=true);
            //Hook screwing
            translate([-97, 0, 40]) rotate(90, [0, 1, 0]) cylinder(r=3.7, h=20, center=true);
        }
        //Steering fix
        translate([0, 0, 40]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=60, center=true);
        //Hook screwing
        translate([-97, 0, 40]) rotate(90, [0, 1, 0]) cylinder(r=2.5, h=21, center=true);
    }
}

module chassis_beam_single_axis(){
    translate([225, 35, 42]) difference(){
      union(){
        //Main beam
        translate([36.5, 0, 0.5]) cube([227, 3, 11], center=true);
        translate([36.5, -6, 4.5]) cube([227, 9, 3], center=true);
      }
      //Axle fixture
      for(pos=[48, 66, 84]) translate([pos, 0, -1]) rotate(90, [1, 0, 0]) cylinder(r=1.25, h=8, center=true);
      //cross beam fixture
      for(posx=[-146:73:371]) translate([posx, 0, -1]) rotate(90, [1, 0, 0]) cylinder(r=1, h=5, center=true);
      //bumpers fixture
      translate([106, 0, -1]) rotate(90, [1, 0, 0]) cylinder(r=1, h=5, center=true);
      //frame screws and wood rack fixture
      for (posx=[-65, -36, -7, -45, 51, 145]) for(mir=[0, 1]) translate([posx, -6, 5]) cylinder(r=1.5, h=100, center=true);
    }
}

module chassis_beam_single_axis_short(){
    translate([225, 35, 42]) difference(){
      union(){
        //Main beam
        translate([-10.5, 0, 0.5]) cube([133, 3, 11], center=true);
        translate([-10.5, -6, 4.5]) cube([133, 9, 3], center=true);
      }
      //Axle fixture
      for(pos=[-48, -30, -12]) translate([pos, 0, -1]) rotate(90, [1, 0, 0]) cylinder(r=1.25, h=8, center=true);
      //bumpers fixture
      translate([12, 0, -1]) rotate(90, [1, 0, 0]) cylinder(r=1, h=5, center=true);
      //frame screws and wood rack fixture
      for (posx=[-65, -36, -7, -45, 51]) for(mir=[0, 1]) translate([posx, -6, 5]) cylinder(r=1.5, h=100, center=true);
    }
}

module chassis_beam_dual_axis(){
    translate([225, 35, 42]) difference(){
      union(){
        //Main beam
        translate([36.5, 0, 0.5]) cube([227, 3, 11], center=true);
        translate([36.5, -6, 4.5]) cube([227, 9, 3], center=true);
        //Axle fixture
        translate([55, 0, -5]) rotate(90, [1, 0, 0]) cylinder(r=8, h=3, center=true);
        //Exterior axle fixture support
        translate([55, 3.6, 3]) cube([20, 5, 6], center=true);
        //Exterior axle fixture
        hull(){
          translate([55, 7.5, 3]) cube([20,3,6], center=true);
          translate([55, 7.5, -7]) rotate(90, [1, 0, 0]) cylinder(r=8, h=3, center=true);
        }
      }
      //Axle fixture
      translate([55, 0, -7]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=50, center=true);
      //cross beam fixture
      for(posx=[-146:73:371]) translate([posx, 0, -1]) rotate(90, [1, 0, 0]) cylinder(r=1, h=5, center=true);
      //bumpers fixture
      translate([106, 0, -1]) rotate(90, [1, 0, 0]) cylinder(r=1, h=5, center=true);
      //frame screws
      for (posx=[-65, -36, -7]) for(mir=[0, 1]) translate([posx, -6, 5]) cylinder(r=1.5, h=10, center=true);
      //Wood rack
      for (posx=[-45, 51, 145]) translate([posx, -6, 5]) cylinder(r=1.5, h=10, center=true);
    }
}

module chassis_cross_beam(){
  difference(){
    union(){
      translate([0, 0, 41]) rotate(90, [0, 0, 1]) rounded_cube(50, 5, 5, 1);
      for (mir=[0,1]) mirror([0, mir, 0]) {
        translate([0, 29, 41]) cube([8, 9, 8], center=true);
        hull(){
          translate([0, 15, 41]) rotate(90, [0, 0, 1]) rounded_cube(2, 5, 5, 1);
          translate([0, 24.5, 41]) rotate(90, [0, 0, 1]) rounded_cube(0.1, 8, 8, 1);
        }
      };
    };
    translate([0, 0, 41]) rotate(90, [1, 0, 0]) cylinder(r=0.5, h=80, center=true);
  };
}

module bearing(){
    translate([30, 0, 51.6]) color("gray") difference(){
        cylinder(r=32.5, h=7, center=true);
        cylinder(r=25, h=7.1, center=true);
    }
}

module frame(){
  difference(){
    union(){
        //High
        translate([68, 0, 58]) rotate(90, [0, 1, 0]) rounded_cube(5, 80, 160, 5);
        //link low and high
        difference(){
          translate([150, 0, 43]) rotate(90, [0, 1, 0]) rounded_cube(12, 80, 16, 5);
          translate([156, 0, 43]) rotate(90, [0, 1, 0]) cube([12, 73, 16], center=true);
        }
        hull(){
          translate([140, 0, 58]) rotate(90, [0, 1, 0]) rounded_cube(5, 80, 16, 5);
          translate([150, 0, 50.5]) rotate(90, [0, 1, 0]) rounded_cube(5, 80, 16, 5);
        }
        //Low
        translate([187, 0, 50.5]) rotate(90, [0, 1, 0]) rounded_cube(5, 80, 90, 5);
        //Steering fix
        translate([30, 0, 52.5]) difference(){
            cylinder(r=40, h=6, center=true);
            cylinder(r=32.5, h=6.2, center=true);
        };
        //Steering ball bearing offset
        translate([30, 0, 55.2]) difference(){
            cylinder(r=40, h=0.2, center=true);
            cylinder(r=32, h=0.3, center=true);
        };
    };
    //rear screws
    for (posx=[160, 189, 218]) for(mir=[0, 1]) mirror([0, mir, 0]) {
        translate([posx, 29, 50]) cylinder(r=1.5, h=10, center=true);
        translate([posx, 29, 51.8]) cylinder(r=2.5, h=2.5, center=true);
    }
    //Rear Wood rack
    for(mir=[0, 1]) mirror([0, mir, 0]) translate([180, 29, 50]) cylinder(r=1.5, h=10, center=true);
    //Front wood rack
    for(mir=[0, 1]) mirror([0, mir, 0]) for(posx=[-8, 86]) for(posy=[24, 36]) translate([posx, posy, 60]) cylinder(r=1.5, h=10, center=true);
    //Small bearing
    translate([30, 0, 60.3]) cylinder(r=4.5, h=0.51, center=true);
    translate([30, 0, 58.5]) cylinder(r=4, h=3.1, center=true);
    translate([30, 0, 46]) cylinder(r=2.5, h=26, center=true);
  }
}

module rear_bumper(){
    translate([371, 0, 41]) difference(){
        union(){
            cube([8, 67, 8], center=true);
            translate([0, 0, 5.5]) cube([8, 49, 3], center=true);
            //Bumper
            for(mir=[0,1]) mirror([0, mir, 0]) {
                translate([10, 58, -20]) rotate(90, [1, 0, 0]) cylinder(r=3.5, h=50, center=true);
                hull(){
                    translate([-25, 29, -3.5]) rotate(90, [1, 0, 0]) cube([50,15,9], center=true);
                    translate([ 10, 30, -20]) rotate(90, [1, 0, 0]) cylinder(r=3.5, h=9, center=true);
                }
            }
            //Rear trailer hook
            translate([0, 0, -10]) cube([8, 50, 20], center=true);
            hull(){
                translate([0, 0, -18]) cube([8, 20, 5], center=true);
                translate([12, 0, -22]) cylinder(r=6, h=5, center=true);
            }
        }
        //rear screwing
        rotate(90, [1, 0, 0]) cylinder(r=1, h=70, center=true);
        //front screwing
        translate([-40, 0, 0]) rotate(90, [1, 0, 0]) cylinder(r=1, h=70, center=true);
        //Rear trailer hook
        translate([12, 0, -17]) cylinder(r=6, h=5, center=true);
        translate([12, 0, -22]) cylinder(r=2.1, h=6, center=true);
        //Wood rack
        for(mir=[0, 1]) mirror([0, mir, 0]) translate([-1, 29, -10]) {
            cylinder(r=1.5, h=30, center=true);
            cylinder(r=7, h=5, center=true);
        }
    }
}

module wood_rack(posx, cutout, screw_holes){
    translate([posx, 0, 65]) difference(){
        union(){
            translate([0, 60, 12]) rotate(90, [0, 1, 0]) rounded_cube(10, 60, 8, 3);
            translate([0, 30, -13])  rounded_cube(8, 30, 60, 16);
        }
        //cutout
        translate([0, 45, -40+cutout]) cube([9, 72, 40], center=true);
        //out rounding
        translate([0, 47, 0]) rotate(90, [0, 1, 0]) cylinder(r=7, h=9, center=true);
        translate([0, 47, -20]) cube([9, 14, 40], center=true);
        //Vertical beam fixture
        translate([0, 85, 12]) cylinder(r=2, h=12, center=true);
        //frame screwing
        if (screw_holes) {for(posy=[24, 36]) {
            translate([0, posy, 3]) cylinder(r=1.5, h=30, center=true);
            translate([0, posy, 15]) cylinder(r=3, h=8, center=true);
        }} else {
            translate([0, 29, 3]) cylinder(r=1.5, h=30, center=true);
            translate([0, 29, 15]) cylinder(r=3, h=8, center=true);
        }
    }
}

module wood_rack_front(posx, height){
  difference(){
    union(){
        wood_rack(posx, 15.5, true);
        mirror([0, 1, 0]) wood_rack(posx, 15.5, true);
        //High beam
        translate([posx, 0, 78+height]) rotate(90, [0,1,0]) rounded_cube(8, 180, 8, 3);
        for (posz=[0:20:height]) translate([posx, 0, 78+posz]) rotate(90, [0,1,0]) rounded_cube(8, 180, 8, 3);
        for(posy=[-85:34:85]) translate([posx, posy, 78+height/2]) rotate(90, [0,1,0]) rounded_cube(height, 10, 8, 3);
    }
    //Screwing
    for(mir=[0, 1]) mirror([0, mir, 0]) translate([posx, 36, 70]) cylinder(r=1.5, h=40, center=true);
  }
}

module wood_rack_dual(posx, cutout){
  difference(){
    union(){
        wood_rack(posx, cutout);
        mirror([0, 1, 0]) wood_rack(posx, cutout);
        translate([posx, 0, 30.5]) cube([8, 80, 60], center=true);
    }
    translate([posx, 0, 30.5-cutout]) cube([9, 82, 60], center=true);
    //Screwing
    for(mir=[0, 1]) mirror([0, mir, 0]) translate([posx, 29, 50]) cylinder(r=1.5, h=80, center=true);
  }
}