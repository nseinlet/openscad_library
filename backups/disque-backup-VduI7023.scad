$fn=200;

module attache(rot) {
	rotate(rot, [0, 0, 1])
    union()
    {
        translate([-2.5,0,0]) cube(size=[5,10,3], center=false);
        translate([-2,13,0]) difference(){
            union() {
                translate([-1,0,0]) cube(size=[6,10,3], center=false);
                hull() {
                    translate([4,0,0]) cylinder(r=3, h=3);
                    cylinder(r=3, h=3);
                }
            }
            translate([4,0,0]) cylinder(r=1.5, h=3);
            cylinder(r=1.5, h=3);
        }
    }
};

module disque(level) {
    translate([0,0,level])
    union() {
	difference() {
		cylinder(h=3, r=28);
		cylinder(h=3, r=21);
	}
    difference() {
        union() {
            attache(0);
            attache(120);
            attache(240);
        }
        cylinder(h=3, r=1.5);
    };
}
};


difference() {
		cylinder(h=3, r=28);
disque(0);
};

