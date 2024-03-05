module _half_fix() {
    difference() {
        union(){
            intersection() {
            translate([4, 3, 0]) cube([8, 6, 8], center=true);
            translate([-9, 10, 0]) cylinder(r=15, h=8, center=true);
            }
            translate([0, 6, -4]) cube([2, 19, 8], center=false);
        }
        translate([0, 4, 0]) rotate(25, [0, 0, -1]) rotate(90, [0, 1, 0]) cylinder (r=1.25, h=10, center=true);
    }
}

module leaf_spring_support() {
    difference() {
        union() {
            _half_fix();
            translate([0, 50, 0]) mirror([0, 1, 0]) _half_fix();
        }
        for (y=[12, 18]) translate([0, y, 0]) rotate(90, [0, 1, 0]) cylinder (r=1.5, h=10, center=true);
        for (z=[1, -1]) translate([0, 29, z*7]) rotate(90, [0, 1, 0]) cylinder (r=4.5, h=10, center=true);
    }
}