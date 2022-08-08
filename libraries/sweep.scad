include <tools.scad>


module brush(diameter, width) {
    color("red") translate([0, 0, -5+diam/2]) rotate(90, [0, 1, 0]) cylinder(r=diam/2, h=width*2, center=true);
}

module box_side_panel(diam, width, side) {
    difference(){
        hull() {
            translate([side*width, 5+diam/2, diam/2]) cube([3, 2, diam], center=true);
            translate([side*width, -5-diam/2, diam/2]) cube([3, 2, diam], center=true);
            translate([side*width, 0, diam+10]) cube([3, diam, 2], center=true);
        }
        //Axle
        translate([side*width, 0, -5+diam/2]) rotate(90, [0, 1, 0]) cylinder(r=4, h=3.2, center=true);
    }
}

module _box(diam, width, rear_fixing=false, rear_angle=0, front_angle=0) {
  rotate_around_axle (0, 18, 0, front_angle, 0, 0, 1) rotate_around_axle (120, 18, 0, rear_angle, 0, 0, 1) difference() {
    union() {
        for (side=[1,-1]) box_side_panel(diam, width, side);
        hull() {
            translate([width, 5+diam/2, diam/2]) cube([3, 2, diam], center=true);
            translate([-width, 5+diam/2, diam/2]) cube([3, 2, diam], center=true);
        };
        hull() {
            translate([width, 0, diam+10]) cube([3, diam, 2], center=true);
            translate([-width, 0, diam+10]) cube([3, diam, 2], center=true);
        };
        hull() {
            translate([width, diam/2, diam+10]) cube([3, 0.1, 2], center=true);
            translate([-width, diam/2, diam+10]) cube([3, 0.1, 2], center=true);
            translate([width, 5+diam/2, diam]) cube([3, 2, 0.1], center=true);
            translate([-width, 5+diam/2, diam]) cube([3, 2, 0.1], center=true);
        };
        hull() {
            translate([width, -diam/2, diam+10]) cube([3, 0.1, 2], center=true);
            translate([-width, -diam/2, diam+10]) cube([3, 0.1, 2], center=true);
            translate([width, -5-diam/2, diam]) cube([3, 2, 0.1], center=true);
            translate([-width, -5-diam/2, diam]) cube([3, 2, 0.1], center=true);
        };
        hull() {
            translate([width, -15-diam/2, diam-10]) cube([3, 0.1, 2], center=true);
            translate([-width, -15-diam/2, diam-10]) cube([3, 0.1, 2], center=true);
            translate([width, -5-diam/2, diam]) cube([3, 2, 0.1], center=true);
            translate([-width, -5-diam/2, diam]) cube([3, 2, 0.1], center=true);
        };
        // Wheels
        for (side=[1, -1]) {
            wheel_support(side * (width - 5), 45, -5);
        }
        translate([width -5, 0, 30]) wheel_arm();
        translate([-1* width + 5, 0, 30]) wheel_arm(1);
        if (rear_fixing) {
            translate([78, 18, 0]) rotate(90, [0, 0, -1]) front_link_linkage(35);
            translate([78, 18, 0]) rotate(90, [0, 0, -1]) front_link_linkage(62);
        }
    }
    //front rotation linkage
    for (side=[1, -1]) for (pos_z=[30,51]) translate([side*7, 34, pos_z]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=10, center=true);
    //front rotation arm
    for (side=[1, -1]) translate([(side*7)+48, 34, 51]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=10, center=true);
    //wheels suppoirt fixing
    for (pos=[20, 30])for (side=[1, -1]) translate([side*(width-pos), 32, 30]) rotate(90, [1, 0, 0]) cylinder(r=1, h=10, center=true);
    //rotation servo
    translate([76, -17, 70]) cylinder(r=2, h=50, center=true);
  }
};

module _front_box_link(){
     //rotation linkage
    translate([0, 3.5, 0]) front_link_linkage(30);
    translate([0, 3.5, 0]) front_link_linkage(51);
    //rotation arm
    translate([48, 3.5, 0]) front_link_linkage(51);
}

module front_link_side(pos_x) {
    translate([pos_x, 1.5, 30]) difference() {
        hull() {
            translate([0, 12, 12]) cube([5, 24, 24], center=true);
            rotate(90, [0, 1, 0]) cylinder(r=5, h=5, center=true);
        }
        // arm movement
        translate([-1.6, 0, 0]) rotate(90, [0, 1, 0]) cylinder(r=11, h=2, center=true);
        // arm linkage
        rotate(90, [0, 1, 0]) cylinder(r=2, h=5.2, center=true);
        //servo fixing
        translate([0, 8, 20]) cylinder(r=1, h=10, center=true);
        translate([0, 18, 20]) cylinder(r=1, h=10, center=true);
        //backplate fixing
        translate([0, 20, 5]) rotate(90, [1, 0, 0]) cylinder(r=1, h=10, center=true);
        translate([0, 20, 20]) rotate(90, [1, 0, 0]) cylinder(r=1, h=10, center=true);
        //servo cable
        translate([0, 13, -4]) hull() {
            cube([5.1, 10, 0.1], center=true);
            translate([0, 0, 8]) cube([5.1, 6, 0.1], center=true);
        }
    }
}

module front_link_backplate() {
    translate([0, 26.5, 30]) difference() {
        hull() {
            translate([0, 0, 12]) cube([50, 5, 24], center=true);
            translate([0, 0, 62]) cube([25, 5, 0.1], center=true);
        }
        for (side=[1,-1]) {
            //arm support shorting
            translate([side*22.51, -2, 11.999]) cube([5, 2, 24], center=true);
            //arm support fixing
            translate([side*22.51, 0, 5]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=10, center=true);
            translate([side*22.51, 0, 20]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=10, center=true);
            //third point fixing
            translate([side*7, 0, 59]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=10, center=true);
            translate([side*7, 2, 59]) rotate(90, [1, 0, 0]) cylinder(r=2.9, h=3, center=true);
            //rotation fixing
            for (height=[5, 13, 21, 36, 44, 52]){
                translate([side*7, 0, height]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=10, center=true);
                translate([side*7, -1.2, height]) rotate(90, [1, 0, 0]) cylinder(r=3.1, h=3, center=true);
            }
        }
    }
}

module front_link_thirdpoint() {
    translate([0, 0, 89]) difference() {
        hull() {
            translate([0, 19, 0]) cube([24, 10, 5], center=true);
            translate([0, 0, 0]) cube([16, 8, 5], center=true);
        }
        //backplate fixing
        for (side=[1,-1]) translate([side*7, 20, 0]) rotate(90, [1, 0, 0]) cylinder(r=1, h=10, center=true);
        //Third point bar
        translate([0, 2, 0]) cube([6, 12, 5.1], center=true);
        // Third point axle
        translate([0, -2, 0]) rotate(180, [1, 0, 1]) cylinder(r=1, h=20, center=true);
    }
}

module front_link_linkage(pos_z){
    translate([0, 31.5, pos_z]) difference() {
        hull(){
            translate([0, 0, 0]) cube([30, 5, 5], center=true);
            translate([0, 10, 0]) cylinder(r=5, h=5, center=true);
        };
        //rotation axle
        translate([0, 10, 0]) cylinder(r=2, h=5.1, center=true);
        //fixing
        for (side=[1,-1]) translate([side*7, 0, 0]) rotate(90, [1, 0, 0]) cylinder(r=1, h=10, center=true);
    }
};

module rear_link_linear_support() {
    translate([0, 16, 55]) difference() {
        hull(){
            translate([0, -2.5, 0]) cube([50, 20, 2], center=true);
            translate([80, 4, 0]) cylinder(r=4, h=2, center=true);
        };
        //Fixing holes
        for (posx=[-1, 1]) for (posy=[3.5,-6.5]) translate([posx*22.5, posy, 0]) cylinder(r=1, h=2.2, center=true);
        //linear servo
        translate([80, 4, 0]) cylinder(r=2, h=2.2, center=true);
    }
}

module _front_link() {
    union() {
        mirror([1, 0, 0]) front_link_side(22.5);
        front_link_side(22.5);
        front_link_backplate();
        front_link_thirdpoint();
        front_link_linkage(35);
        front_link_linkage(66);
    }
}

module _rear_link() {
    union() {
        mirror([1, 0, 0]) front_link_side(22.5);
        front_link_side(22.5);
        front_link_backplate();
        front_link_thirdpoint();
        front_link_linkage(35);
        front_link_linkage(82);
        rear_link_linear_support();
    }
}

module rotation_arm() {
    difference(){
        union(){
            hull(){
                cylinder(r=3.5, h=5, center=true);
                translate([-10, 12, 0]) cylinder(r=3.5, h=5, center=true);
            }
            hull(){
                translate([-10, 12, 0]) cylinder(r=3.5, h=5, center=true);
                translate([-50, 12, 0]) cylinder(r=3.5, h=5, center=true);
            }
            hull(){
                translate([-50, 12, 0]) cylinder(r=3.5, h=5, center=true);
                translate([-60, 0, 0]) cylinder(r=3.5, h=5, center=true);
            }
        }
        cylinder(r=1.5, h=5.1, center=true);
        translate([-60, 0, 0]) cylinder(r=1.5, h=5.1, center=true);
        translate([0, 0, -1.5]) cylinder(r=10, h=3, center=true);
        translate([-60, 0, -1.5]) cylinder(r=10, h=3, center=true);
    }
}

module wheel_support(pos_x, pos_y, angle=0){
    translate([pos_x, pos_y, 10]) rotate(angle, [0, 0, 1]) difference(){
        hull(){
            translate([0, 9.5, 0]) cube([19, 19, 5], center=true);
            translate([0, -1, 0]) cube([10, 3, 5], center=true);
        };
        hull(){
            translate([0, 12.51, 0]) cube([14, 13, 5.1], center=true);
            translate([0, 4.5, 0]) cube([6, 3, 5.1], center=true);
        };
        //rotation axle
        cylinder(r=1, h=6, center=true);
        //Wheel axle
        translate([0,16.5,0]) rotate(90, [0, 1, 0]) cylinder(r=1, h=20, center=true);
    }
}

module wheel_arm(mirror=0){
    mirror([mirror, 0, 0]) difference() {
        union() {
            hull(){
                translate([0, 45, 0]) cylinder(r=2.5, h=5, center=true);
                translate([0, 35, 0]) cylinder(r=2.5, h=5, center=true);
            };
            hull(){
                translate([0, 35, 0]) cylinder(r=2.5, h=5, center=true);
                translate([-30, 35, 0]) cylinder(r=2.5, h=5, center=true);
            };
        };
        //Wheels suppport axle
        translate([0, 45, 0]) cylinder(r=1.5, h=5.2, center=true);
        //fixings
        for (pos=[-15, -25]) translate([pos, 35, 0]) rotate(90, [1, 0, 0]) cylinder(r=1, h=10, center=true);
    }
}

module rear_pivot(){
  difference() {
    union() {
        //Horizontal bars
        hull(){
            translate([0, 0, 67]) cylinder(r=2.5, h=5, center=true);
            translate([0, 150, 67]) cylinder(r=2.5, h=5, center=true);
        };
        hull(){
            translate([0, 0, 30]) cylinder(r=2.5, h=5, center=true);
            translate([0, 150, 30]) cylinder(r=2.5, h=5, center=true);
        };
        //vertical bars
        hull(){
            translate([0, 30, 67]) cube([5, 5, 5], center=true);
            translate([0, 120, 30]) cube([5, 5, 5], center=true);
        };
        hull(){
            translate([0, 30, 30]) cube([5, 5, 5], center=true);
            translate([0, 120, 67]) cube([5, 5, 5], center=true);
        };
        //Vertical bars
        hull(){
            translate([0, 20, 30]) cube([5, 5, 5], center=true);
            translate([0, 20, 67]) cube([5, 5, 5], center=true);
        };
        hull(){
            translate([0, 130, 30]) cube([5, 5, 5], center=true);
            translate([0, 130, 67]) cube([5, 5, 5], center=true);
        };
    }
    //rotation axles
    for (pos=[0, 150]) for (height=[30, 67]) translate([0, pos, height]) cylinder(r=1, h=5.5, center=true);
    //rotation servo fixings
    for (pos=[7, -7]) for (height=[30, 67]) translate([0, pos + 90, height]) rotate(90, [0, 1, 0]) cylinder(r=1, h=5.5, center=true);
    for (pos=[7, -7]) for (height=[67]) translate([0, pos + 20, height]) rotate(90, [0, 1, 0]) cylinder(r=1, h=5.5, center=true);
  };
};

module _rear_pivot(){
    rear_pivot();
    //rotation servo
    translate([-26.5, 90, 0]) rotate(90, [0, 0, -1]) front_link_linkage(30);
    translate([-26.5, 90, 0]) rotate(90, [0, 0, -1]) front_link_linkage(67);
    //sweep
    //translate([-36, 170, 0]) rotate(120, [0, 0, -1]) front_link_linkage(35);
    //translate([-36, 170, 0]) rotate(120, [0, 0, -1]) front_link_linkage(62);
    //sweep servo
    translate([-26.5, 20, 0]) rotate(90, [0, 0, -1]) front_link_linkage(67);
};