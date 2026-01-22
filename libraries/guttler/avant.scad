include <tools.scad>

AVANT_ARROWS_BEAMS = [-26, 0, 26];
AVANT_FRONT_LINK_POSITIONS = [25, 35, -25, -35];

module _elementcrosskilldent(rang, angle){
    translate([rang,0,0])
    rotate(angle, [0, 1, 0])
    rotate(90, [0, 1, 0])
    for(angle = [0 : 30 : 180]) rotate(angle,[0,0,1])
       difference() {
            cylinder(h=4.5, r=10);
            cylinder(h=4.5, r1=7, r2=9);
            translate([11, 0, 3]) cube(size=[20,20,6], center=true);
            translate([-11, 0, 3]) cube(size=[20,20,6], center=true);
        }
};

module elementcrosskill(rang){
    translate([0,rang,10])
    union(){
        rotate(90, [0, 1, 0]) difference() {
            cylinder(h=3, r=10);
            cylinder(h=3, r=7);
        }

        difference() {
            union()
            {
                translate([1.5, 0, 4]) cube(size=[3, 3, 9], center=true);
                rotate(120, [1, 0, 0])translate([0, -1.5, 0]) cube(size=[3, 3, 9]);
                rotate(-120, [1, 0, 0])translate([0, -1.5, 0]) cube(size=[3, 3, 9]);
                translate([1.5, 0, 0]) rotate(90, [0, 1, 0]) cylinder(h=13, r=2.5, center=true);
            }
            translate([1.5, 0, 0]) rotate(90, [0, 1, 0]) cylinder(h=14, r=1.5, center=true);
        }
        _elementcrosskilldent(3,0);
        _elementcrosskilldent(0,180);
    }
}

module chassis_avant(warnsign=true, frontconnexion=true, support_thichness=2){
    color("red") union() {
        translate([0, 0, 2.5]) cube([210, 5, 5], center=true);
        translate([0, 20, 2.5]) cube([72, 5, 5], center=true);
        for (mult=[1,-1]) {
          translate([mult*29, 10, 2.5]) cube([5, 15, 5], center=true);
          translate([mult*104.5, 0, 2.5]) rotate(16, [0, 0, mult*-1]) translate([mult*-36,0,0]) cube([72, 5, 5], center=true);
          //arm support
          difference(){
            for (pos=[25,35]) translate([mult*pos, 27, 2.5]) hull(){
                cube([support_thichness, 10, 5], center=true);
                translate([0,2,1]) rotate([0,90,0]) cylinder(r=4, h=support_thichness, center=true);
            };
            translate([mult*25,29,3.5]) rotate([0,90,0]) cylinder(r=1.5, h=21+2*support_thichness, center=true);
          };
          //thirdpoint
          translate([mult*14, 20, 24]) rotate(35, [0,mult*-1,0]) cube([5, 5, 50], center=true);
          //Warn sign
          if (warnsign) {
            translate([mult*90, 0, 5+7.5]) cube([5, 5, 15], center=true); 
            warnsign(mult*90);
            };
        }
        //thirdpoint support
        rotate(24, [-1, 0, 0]) translate([0, 0, 25]) cube([5, 5, 48], center=true);
        //thirdpoint top
        thirdpoint_holes = [48, 52, 56];
        thirdpoint_offset= [6, -6];

        difference() {
            union(){
                hull(){
                    translate([0, 20, 45]) cube([3+support_thichness*2, 5, 10], center=true);
                    translate([0, 20, 52]) rotate([0,90,0]) cylinder(r=3, h=3+support_thichness*2, center=true);
                };
                if (frontconnexion) {
                    for(side=[2+support_thichness/2, -2-support_thichness/2]) for(hole_offset=thirdpoint_offset) {
                        hull(){
                        translate([side, 20, 52]) rotate([0,90,0]) cylinder(r=3, h=support_thichness, center=true);
                        for (pos = thirdpoint_holes) translate([side, 20+hole_offset, pos]) rotate(90, [0, 1, 0]) cylinder(r=3.5, h=support_thichness, center=true);
                        }
                    }
                };
            };
            translate([0, 20, 58]) cube([4, 6.1, 20], center=true);
            if (frontconnexion) {
                for(side=[2+support_thichness/2, -2-support_thichness/2]) for(hole_offset=thirdpoint_offset) for (pos = thirdpoint_holes) translate([side-0.1, 20+hole_offset, pos]) rotate(90, [0, 1, 0]) cylinder(r=1.25, h=support_thichness+2, center=true);
            } else {
                translate([0, 20, 52]) rotate(90, [0, 1, 0]) cylinder(r=1.25, h=11+support_thichness*2, center=true);
            };
        };
        if (frontconnexion) {
            difference() {
                union(){
                    //arm fix
                    for (pos = AVANT_FRONT_LINK_POSITIONS) hull(){
                        translate([pos, 0, 2.5]) cube([support_thichness, 2, 5], center=true);
                        translate([pos, -8, 4]) rotate(90, [0, 1, 0])cylinder(r=4, h=support_thichness, center=true);
                    }
                }
                //arm fix
                translate([0, -8, 4]) rotate(90, [0, 1, 0])cylinder(r=1.5, h=100, center=true);
            };
        };
    }
}

module chassis_avant_axlemono(x, offset=2, thickness=2){
    translate([x, 0, 0]) difference() {
      hull() {
        translate([0, 0, 2.5]) cube([thickness, 5, 5], center=true);
        translate([0, -1*offset, -12]) rotate(90, [0, 1, 0]) cylinder(r=6, h=thickness, center=true);
      };
      translate([0, -1*offset, -12]) rotate(90, [0, 1, 0]) cylinder(r=3, h=1+thickness, center=true);
    }
}

module chassis_avant_axle(x, thickness=2){
    translate([x, 0, 0]) difference() {
      hull() {
        translate([0, 0, 2.5]) cube([thickness, 5, 5], center=true);
        translate([0, -12, -12]) rotate(90, [0, 1, 0]) cylinder(r=6, h=thickness, center=true);
        translate([0,  12, -12]) rotate(90, [0, 1, 0]) cylinder(r=6, h=thickness, center=true);
      };
      translate([0, -12, -12]) rotate(90, [0, 1, 0]) cylinder(r=3, h=1+thickness, center=true);
      translate([0,  12, -12]) rotate(90, [0, 1, 0]) cylinder(r=3, h=1+thickness, center=true);
    }
}

module elementcrosskill2(rang){
    translate([0,rang,10]) union(){
        rotate(90, [0, 1, 0]) difference() {
            cylinder(h=5, r=10);
            translate([0,0,-0.1]) cylinder(h=5.2, r=8.5);
        };
        rotate(90, [0, 1, 0]) difference() {
            cylinder(h=5, r=3);
            translate([0,0,-0.1]) cylinder(h=5.2, r=1.5);
        };
        for (angle=[0:120:240]) rotate(angle, [1, 0, 0]) translate([0,-1, 2]) cube([5, 2, 7]);
        for (angle=[0:10:359]) rotate(angle, [1, 0, 0]) translate([0, 0, 10]) rotate(90, [0, 1, 0]) cylinder(h=5, r=1);
    };
}

module roue_guttler(rang){
    translate([0,rang,10]) union(){
        rotate(90, [0, 1, 0]) difference() {
            union(){
                hull(){
                    translate([0, 0, 0]) cylinder(h=0.1, r=7);
                    translate([0, 0, 5]) cylinder(h=0.1, r=10);
                }
                translate([0,0,-2]) cylinder(h=6, r=3);    
            };
            translate([0,0,-5]) cylinder(h=25, r=1.5);
        };
        //for (angle=[0:120:240]) rotate(angle, [1, 0, 0]) translate([0,-1, 2]) cube([5, 2, 4]);
        for (angle=[0:10:359]) rotate(angle, [1, 0, 0]) translate([0, 0, 10]) hull(){
            translate([0, 0, -3]) cube([0.1,0.1,1]);
            translate([0, -1, -3.2]) cube([0.1,2,0.1]);
            translate([5, 0, 0]) cube([0.1,0.1,1]);
            translate([5, -1, -0.2]) cube([0.1,2,0.1]);
        }
    };
}

module warnsign(rang) {
    translate([rang, -3.5, 22]) rotate(90, [0, 0, 1]) rounded_cube(2,20,20,2);
}

module avant_arm_beam(){

    difference(){
        union(){
            hull(){
                translate([0, -10, 8]) rotate([0,90,0]) cylinder(r=4, h=2, center=true);
                translate([0, -2, 20]) cube([2, 6, 4], center=true);
            };
            hull(){
                translate([0, -2, 20]) cube([2, 6, 4], center=true);
                translate([0, 34, 20]) cube([2, 6, 4], center=true);
            };
            hull(){
                translate([0, 34, 20]) cube([2, 6, 4], center=true);
                translate([0, 42, 4]) rotate([0,90,0]) cylinder(r=4, h=2, center=true);
            };
        };
        //front hole
        translate([0, -10, 8]) rotate([0,90,0]) cylinder(r=1.5, h=3, center=true);
        //Rear hole
        translate([0, 42, 4]) rotate([0,90,0]) cylinder(r=1.5, h=3, center=true);
    };
}

module _avant_arms(){
    color("red") union(){
        middle_beam_pos = 4;
        for(pos=[-32, -30, -28, 28, 30, 32]) translate([pos,0,0]) avant_arm_beam();
        translate([0, middle_beam_pos, 20]) cube([54, 4, 4], center=true);
        for(pos=[-4, 4]) translate([pos, middle_beam_pos, 20]) avant_arrows_chassis_fix(3);
        for(pos=[-4, 4]) translate([pos, middle_beam_pos, 20]) rotate(90, [1, 0, 0]) avant_arrows_chassis_fix(3);
    }
}

module _avant_printable_arrow(){
    color("black")union() {
        avant_arrow();
        avant_arrow_fix(0, 0);
    }
}
module _avant_printable_blade(){
    color("black")union() {
        avant_arrow_fix(0, 0);
        avant_leveler();
        avant_leveler_blade();
    }
}

module _avant_front_arrows(posy=0, thickness=2) {
    _avant_arrows_chassis(posy, thickness);
    for (pos = AVANT_ARROWS_BEAMS) {
        for (posx=[100,75,50,25,0,-25,-50,-75,-100]) translate([posx, pos+posy, -3]) _avant_printable_arrow();
    }
};

module avant_arrows_chassis_fix(thickness=2) {
    difference(){
        hull(){
            cube([thickness, 6, 4], center=true);
            translate([0,0,8]) rotate([0,90,0]) cylinder(r=4, h=thickness, center=true);
        };
        cube([thickness+1, 4, 4], center=true);
        translate([0,0,8]) rotate([0,90,0]) cylinder(r=1.5, h=thickness+1, center=true);
    };
}

module _avant_arrows_chassis(posy=0, thickness=2) {
    color("red") union(){
        for (pos = AVANT_ARROWS_BEAMS) {
            translate([0, pos+posy, 0]) cube([210, 4, 4], center=true);
        }
        translate([30, posy, 0]) cube([4, AVANT_ARROWS_BEAMS[2]+AVANT_ARROWS_BEAMS[2]+4, 4], center=true);
        translate([-30, posy, 0]) cube([4, AVANT_ARROWS_BEAMS[2]+AVANT_ARROWS_BEAMS[2]+4, 4], center=true);

        for (posx=[106, -106]) translate([posx, posy, -8]) cube([2, AVANT_ARROWS_BEAMS[2]-AVANT_ARROWS_BEAMS[0]+4, 20], center=true);
        for (pos=AVANT_FRONT_LINK_POSITIONS) translate([pos, posy, 0]) avant_arrows_chassis_fix(thickness);
        for (pos=[5, -5]) translate([pos, posy+AVANT_ARROWS_BEAMS[2], 0]) avant_arrows_chassis_fix(thickness);
    }
}

module avant_arrow(){
    difference(){
        union(){
            translate([0, -0.5, 0]) cube([4, 10, 2], center=true);
            translate([0, 4.5, 4]) quarter_spiralis(3, 5, 4);
            translate([0, 0.5, 4]) rotate(90, [1, 0, 0]) quarter_spiralis(7, 9, 4);
            translate([0, 0.5, 1]) rotate(180, [1, 0, 0]) quarter_spiralis(10, 12, 4);
            translate([0, -5.5, 1]) rotate(90, [-1, 0, 0]) quarter_spiralis(4, 6, 4);
            translate([0, -5.5, -12]) rotate(90, [1, 0, 0]) quarter_spiralis(7, 9, 4);
            hull(){
                translate([0, 2.5, -12]) cube([4, 2, 0.1], center=true);
                translate([0, -0.5, -20]) cube([1, 1, 0.1], center=true);
            }
        }
        //fixing hole
        translate([0,-3,0]) cylinder(r=1, h=4, center=true);
    };
}

module avant_arrow_fix(tolerance=0.2, oversize=2){
    difference(){
        union(){
            translate([0, -1, 6]) cube([4, 9, 2], center=true);
            hull(){
                translate([0, 3, 6]) cube([4, 2, 2], center=true);
                translate([0, 3, 0]) cube([4+2*oversize, 2, 4], center=true);
            }
        }
        //fixing hole
        translate([0,-3,6]) cylinder(r=1, h=30, center=true);
        //arrow hole
        translate([0, 3, 0]) cube([4+tolerance, 3, 2+tolerance], center=true);
    };
}

module avant_leveler(){
    difference(){
        union(){
            translate([0, -0.5, 0]) cube([4, 10, 2], center=true);
            translate([0, 4.5, 4]) quarter_spiralis(3, 5, 4);
            translate([0, 0.5, 4]) rotate(90, [1, 0, 0]) quarter_spiralis(7, 9, 4);
            translate([0, 0.5, 1]) rotate(180, [1, 0, 0]) quarter_spiralis(10, 12, 4);
            hull(){
                translate([0, -10.5, 1]) cube([4, 2, 0.1], center=true);
                translate([0, -0.5, -26]) cube([4, 2, 0.1], center=true);
            }
        }
        //fixing hole
        translate([0,-3,0]) cylinder(r=1, h=4, center=true);
        //blade mounting hole
        translate([0, -4.5, -20]) translate([0,-3,0]) rotate(90, [1,0,0]) cylinder(r=1, h=20, center=true);
        translate([0, -4.5, -24]) translate([0,-3,0]) rotate(90, [1,0,0]) cylinder(r=1, h=20, center=true);
    };
}

module avant_leveler_blade(){
    difference(){
        hull(){
            translate([0, -5.5, -18]) cube([4, 2, 0.1], center=true);
            translate([0, -1.5, -29]) cube([14, 2, 0.1], center=true);
        }
        //fixing hole
        translate([0, -4.5, -20]) translate([0,-3,0]) rotate(90, [1,0,0]) cylinder(r=1, h=20, center=true);
        translate([0, -4.5, -24]) translate([0,-3,0]) rotate(90, [1,0,0]) cylinder(r=1, h=20, center=true);
    };
}

module _front_leveler(thickness=2){
    translate([0, -5, 2]) rotate(45, [1, 0, 0]) {
        color("red") union(){
            cube([210, 4, 4], center=true);
            for (pos=AVANT_FRONT_LINK_POSITIONS) translate([pos, 0, 0]) avant_arrows_chassis_fix(thickness);
            for (pos=[5, -5]) rotate(90, [-1, 0, 0]) translate([pos, 0, 0]) avant_arrows_chassis_fix(thickness);
        }
    }
}