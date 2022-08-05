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
        translate([side*width, 0, -5+diam/2]) rotate(90, [0, 1, 0]) cylinder(r=4, h=3.2, center=true);
    }
}

module _box(diam, width) {
  difference() {
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
        //rotation linkage
        translate([0, 3.5, 0]) front_link_linkage(30);
        translate([0, 3.5, 0]) front_link_linkage(51);
        //rotation arm
        translate([48, 3.5, 0]) front_link_linkage(51);
    }
    //rotation linkage
    for (side=[1,-1]) for (pos_z=[30,51]) translate([side*7, 34, pos_z]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=10, center=true);
    //rotation arm
    for (side=[1,-1]) translate([(side*7)+48, 34, 51]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=10, center=true);
  }
};

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