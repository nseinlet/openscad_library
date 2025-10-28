module front_profile(){
    union(){
        cube([1  , 20, 1], center=true);
        cube([100, 10, 1], center=true);
        cube([180,  5, 1], center=true);
    }
}

module rear_lift(){
    for (mir=[0,1]) mirror([mir,0,0]) translate([55/2 + 1.5, 0, 27]) difference() {
        cube([3,40,10]);
        translate([1,5,5]) rotate([0,90,0]) cylinder(h=5, r=1.5, center=true);
    }
    translate([-1,0,70]) difference() {
        cube([2,40,4]);
        translate([1,2,2]) rotate([0,90,0]) cylinder(h=5, r=1, center=true);
    }
}