include <tools.scad>

module attache(rot) {
	rotate(rot, [0, 0, 1])
    union()
    {
        //translate([-2.5,0,0]) cube(size=[7,10,3], center=false);
        translate([-2,18,0]) difference(){
            union() {
                translate([-1,0,0]) cube(size=[6,8,3], center=false);
                hull() {
                    translate([ 5,0,0]) cylinder(r=4, h=3);
                    translate([-1,0,0]) cylinder(r=4, h=3);
                }
            }
            translate([ 5,0,0]) cylinder(r=1, h=3);
            translate([-1,0,0]) cylinder(r=1, h=3);
        }
    }
};

module disque(level, rang=0) {
    translate([0,rang,28])
    rotate(90, [0, 1, 0])
    translate([0,0,level])
    union() {
	difference() {
		cylinder(h=3, r=27);
		cylinder(h=3, r=24);
	}
    difference() {
        union() {
            attache(0);
            attache(120);
            attache(240);
        }
        cylinder(h=3, r=1.5);
    };
    rotate_extrude($fn=200)  polygon( points=[[27,0],[28,1.5],[27,3]] );
}
};

module axe(level, rang=0) {
    translate([0,rang,28])
    rotate(90, [0, 1, 0])
    translate([0,0,level])
    difference() {
        union() {
            attache(0);
            attache(120);
            attache(240);
            cylinder(h=3, r=15);
            cylinder(h=20, r1=12, r2=6);
        }
        cylinder(h=25, r=2);
        difference() {
            cylinder(h=3, r=28);
            cylinder(h=3, r=22);
        }
    };
};

module axe_2(level, rang=0) {
    translate([0,rang,28])
    rotate(90, [0, 1, 0])
    translate([0,0,level])
    difference() {
        union() {
				    rotate(0, [0, 0, 1]) translate([-2,6,0]) translate([-1,0,0]) cube(size=[6,8,3], center=false);
				    rotate(120, [0, 0, 1]) translate([-2,6,0]) translate([-1,0,0]) cube(size=[6,8,3], center=false);
				    rotate(240, [0, 0, 1]) translate([-2,6,0]) translate([-1,0,0]) cube(size=[6,8,3], center=false);
            attache(0);
            attache(120);
            attache(240);
            cylinder(h=3, r=8);
        }
        cylinder(h=25, r=2);
        difference() {
            cylinder(h=3, r=28);
            cylinder(h=3, r=22);
        }
    };
};

module demi_support() {
    translate([0, 0, -2])
    difference() {
        union() {
            translate([1.5, 48, 32]) rotate(35, [1,0,0]) translate([0, 0, 15]) cube(size=[4, 22, 50], center=true);
            translate([-1, 24.5, 60]) cube(size=[9, 32, 5], center=true);
            translate([1.5, 64, 25]) cube(size=[4, 35, 12], center=true);
						translate([1.5,49,30]) rotate(90, [0,1,0]) cylinder(r=10, h=8, center=true);
        }
        //Plat du bas
        translate([-4, 30, 17]) cube(size=[120, 120, 4], center=true);
        //Plat du haut
        translate([-4, 24.5, 68]) cube(size=[50, 50, 11], center=true);
        //Trous de roulement
        translate([0,0,30]) rotate(90, [0,1,0]) cylinder(r=6, h=60, center=true);
        translate([0,49,30]) rotate(90, [0,1,0]) cylinder(r=6, h=60, center=true);
				//Trous d'attache mutuels
				translate([-1, 24.5, 60]) rotate(90, [0,1,0]) cylinder(h=25, r=1.5, center=true);
				translate([-1, 14.5, 60]) rotate(90, [0,1,0]) cylinder(h=25, r=1.5, center=true);
				translate([-1, 34.5, 60]) rotate(90, [0,1,0]) cylinder(h=25, r=1.5, center=true);
				translate([-1, 24.5, 52]) rotate(90, [0,1,0]) cylinder(h=25, r=1.5, center=true);
    }
};

module support() {
	demi_support();
	translate([-2, 49, 0]) rotate(180, [0,0,1]) demi_support();
};

module potence(){
difference() {
		union() {
	translate([-3, 3, 41]) cube(size=[2, 7, 20], center=true);
	translate([3, 3, 41]) cube(size=[2, 7, 20], center=true);
	translate([0, 3, 21]) cube(size=[4, 7, 30], center=true);
	};
	translate([0, 3, 48]) rotate(90, [0,1,0]) cylinder(h=60, r=1.5, center=true);
	translate([0, 3, 43]) rotate(90, [0,1,0]) cylinder(h=60, r=1.5, center=true);
	translate([0, 3, 38]) rotate(90, [0,1,0]) cylinder(h=60, r=1.5, center=true);
	translate([0, 3, 33]) rotate(90, [0,1,0]) cylinder(h=60, r=1.5, center=true);
	translate([0, 3, 28]) rotate(90, [0,1,0]) cylinder(h=60, r=1.5, center=true);
	};
};

module attacheAvant(){
    translate([-3.5, -32, 23]) difference() {
        union() {
					cube(size=[50, 3, 12], center=true);
					  potence();
            translate([0, -8, -4.5]) cube(size=[50, 17, 3], center=true);
            translate([0, -15, -3]) rotate(90, [0,1,0]) cylinder(h=50, r=3, center=true);
        }
        translate([0, 1, -5]) cube(size=[12, 3, 2], center=true);
        rotate(90, [-1,0,0]) cylinder(h=4, r=1.5, center=true);
        translate([0, -10, -3.5]) cylinder(h=5, r=1.5, center=true);
        translate([20, -5, -3.5]) cylinder(h=5, r=1.5, center=true);
        translate([-20, -5, -3.5]) cylinder(h=5, r=1.5, center=true);
        translate([0, -15, -3]) rotate(90, [0,1,0]) cylinder(h=60, r=1.5, center=true);
        translate([0, 8, -3.5]) rotate(90, [0,1,0]) cylinder(h=60, r=1.5, center=true);

        translate([0, -10, 5]) cylinder(h=15, r=9, center=true);
    };
};

module attacheArriere(){
    translate([-3.5, 81.5, 23]) difference() {
        union() {
            cube(size=[50, 3, 12], center=true);
            translate([0, 8, -4.5]) cube(size=[50, 17, 3], center=true);
        }
        translate([11.5, -1.5, -5]) cube(size=[12, 3, 2], center=true);
        translate([5, 0, -0.5]) rotate(90, [-1,0,0]) cylinder(h=4, r=1.5, center=true);
        translate([0, 9, -3.5]) cylinder(h=5, r=1.5, center=true);
        translate([20, 5, -3.5]) cylinder(h=5, r=1.5, center=true);
        translate([-20, 5, -3.5]) cylinder(h=5, r=1.5, center=true);
    };
};

module barreTractionAvant(){
    translate([-10, -51, 25]) difference() {
        union() {
            translate([0, -7, 2]) cube(size=[14, 30, 10], center=true);
            translate([0, 9, 2]) cylinder(h=10, r=7, center=true);
            translate([-12, -16, 4.5]) cube(size=[20, 12, 5], center=true);
        }
        translate([0, -13, 4]) cube(size=[8, 30, 10], center=true);
        translate([0, 9, 2]) cylinder(h=15, r=3, center=true);
        translate([0, 9, 7]) cylinder(h=1, r=4, center=true);
        translate([0, 9, -3]) cylinder(h=1, r=4, center=true);
        translate([0, -5, 3]) rotate(90,[0,1,0]) cylinder(h=20, r=2, center=true);
        translate([-16, -16, 5]) cylinder(h=7, r=2, center=true);
    };
};

module attacheBarreAvant(){
	translate([-10, -51, 25]) difference() {
		 union() {
            translate([0, -47, 1]) cube(size=[7, 85, 4], center=true);
				translate([0, -5, 3]) rotate(90,[0,1,0]) cylinder(h=7, r=4, center=true);
		};
		translate([0, -5, 3]) rotate(90,[0,1,0]) cylinder(h=20, r=2, center=true);
		translate([0, -83, 3]) cylinder(h=20, r=1.5, center=true);
		translate([0, -73, 3]) cylinder(h=20, r=1.5, center=true);
translate([0, -63, 3]) cylinder(h=20, r=1.5, center=true);
translate([0, -53, 3]) cylinder(h=20, r=1.5, center=true);
translate([0, -43, 3]) cylinder(h=20, r=1.5, center=true);
	};
};

module barreTractionArriere(){
    translate([-10, 81.5, 25]) difference() {
        union() {
            translate([0, 23, 2]) cube(size=[14, 30, 10], center=true);
            translate([0, 9, 2]) cylinder(h=10, r=7, center=true);
            translate([-12, 32, 4.5]) cube(size=[20, 12, 5], center=true);
        }
        translate([0, 31, 4]) cube(size=[8, 30, 10], center=true);
        translate([0, 9, 2]) cylinder(h=15, r=3, center=true);
        translate([0, 9, 7]) cylinder(h=1, r=4, center=true);
        translate([0, 9, -3]) cylinder(h=1, r=4, center=true);
        translate([0, 22, 3]) rotate(90,[0,1,0]) cylinder(h=20, r=2, center=true);
        translate([-16, 32, 5]) cylinder(h=7, r=2, center=true);
    };
};

module _3points_barre_fixe(){
	3points_barre_fixe_girder();
	for (mult=[1,-1]){
	  translate([mult*3 , 0, 0]) 3points_barre_fixe_haut();
	  translate([mult , 0, 0]) 3points_barre_fixe_bas();
	  translate([mult*22, -39, 12.5]) 3points_barre_fixe_u();
	  translate([mult*22, -39, 20.8]) rotate(180,[1, 1, 0]) 3points_barre_fixe_u();
  }
}

module 3points_barre_fixe_bas(){
	difference(){
		union(){
			translate([0, 0, 27]) cube([2, 70, 8], center=true);
			translate([0, -39, 18.5]) cube([2, 8, 25], center=true);
			translate([0, 0, 27]) rotate(90, [0,1,0]) cylinder(h=2, r=10, center=true);
		}
		//Rotation axle
		translate([0, 0, 27]) rotate(90, [0,1,0]) cylinder(h=2.5, r=6.1, center=true);
		//Lower girder
		translate([0, -39, 10.5]) cube([2.5, 5.3, 5.3], center=true);
        //mudfree girder
		translate([0, -32, 27]) cube([2.5, 5.3, 5.3], center=true);
	}
}

module 3points_barre_fixe_haut(){
	difference(){
		union(){
			3points_barre_fixe_bas();
			translate([0, -39, 50]) cube([2, 8, 48], center=true);
			hull(){
				translate([0, 10, 27]) cube([2, 6, 6], center=true);
				translate([0, -34, 63]) cube([2, 6, 6], center=true);
			}
		}
		//Rotation axle
		translate([0, 0, 27]) rotate(90, [0,1,0]) cylinder(h=2.5, r=6.1, center=true);
		//third point
		for(posz=[50:5:70]) translate([0, -39, posz]) rotate(90, [0,1,0]) cylinder(h=2.5, r=1.5, center=true);
	}
}

module mufree_girder(length){
  translate([0, -32, 27]) cube([length, 5, 5], center=true);
}

module mudfree_arrow(pos_x){
	translate([pos_x, -32, 27]) difference(){
	   union(){
		   rounded_cube(2, 10, 10, 2);
		   translate([0, 3, -2.5]) rounded_cube(2, 10, 5, 2);

	   };
	   cube([2, 5.3, 5.3], center=true);
	};
}

module 3points_barre_fixe_girder(){
	translate([0, -39, 10.5]) difference() {
		cube([50, 5, 5], center=true);
		translate([ 22, 0, 0]) rotate(90, [1, 0, 0]) cylinder(r=1.25, h=6, center=true);
		translate([-22, 0, 0]) rotate(90, [1, 0, 0]) cylinder(r=1.25, h=6, center=true);
	};
}

module 3points_barre_fixe_u(){
	difference() {
		hull(){
		  translate([0, 0, 3.5]) cube([6, 8, 1], center=true);
		  translate([0, 0, -2]) rotate(90, [1, 0, 0]) cylinder(r=2.75, h=8, center=true);
	  }
		translate([0, 0, -1.3]) cube([6, 6, 7], center=true);
		translate([0, 0, -2]) rotate(90, [1, 0, 0]) cylinder(r=1.25, h=8.5, center=true);
		translate([0, 0, 3.5]) rotate(90, [0, 0, 0]) cylinder(r=1.5, h=6, center=true);
	};
}

module warn_girder(length){
	translate([0, 36, 27]) union(){
		cube([length-40, 2, 4], center=true);
		cube([8, 2, 8], center=true);
		for (mult=[1,-1]) translate([mult*(length/2-10),0,0]) rotate(90,[0,0,1]) rounded_cube(2,20,20, 2);
	}
}
