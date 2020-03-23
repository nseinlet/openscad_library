//Modules without underscore are assemblies/recepies for soldering

module pointe_soc() {
  difference() {
    union() {
      translate([0,8,41]) cube([2,8,50], center=true);
      /* hull() {
        translate([0,-6,1]) cube([2,10,0.1], center=true);
        translate([0,3,2]) cube([2,6,0.1], center=true);
      }; */
      hull() {
        translate([0,3,2]) cube([2,6,0.1], center=true);
        translate([0,8,16]) cube([2,8,0.1], center=true);
      };
    };
    translate([0, 8, 55+8]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
    translate([0, 8, 55-8]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
  }
}

module ailette_large() {
  translate([0,0,5]) rotate(10,[1,0,0]) difference() {
    union(){
      hull() {
        translate([0,-22,0]) cube([0.1,0.1,2], center=true);
        translate([0,-19,0]) cube([8,0.1,2], center=true);
        translate([0,-14,0]) cube([8,0.1,2], center=true);
      }
      hull() {
        translate([0,-14,0]) cube([8,0.1,2], center=true);
        translate([0,-9,0]) cube([22,0.1,2], center=true);
        translate([0,13,0]) cube([31,0.1,2], center=true);
      }
    }
    hull() {
      translate([0,0,0]) cube([10,0.1,3], center=true);
      translate([0,13,0]) cube([22,0.1,3], center=true);
    }
    cube([2,5,5], center=true);
  }
}

module ailette() {
  translate([0,0,3]) rotate(5,[1,0,0]) difference() {
    union(){
      hull() {
        translate([0,-22,0]) cube([0.1,0.1,2], center=true);
        translate([0,-19,0]) cube([5,0.1,2], center=true);
        translate([0,-14,0]) cube([5,0.1,2], center=true);
      }
      hull() {
        translate([0,-14,0]) cube([5,0.1,2], center=true);
        translate([0,-9,0]) cube([7,0.1,2], center=true);
        translate([0,3,0]) cube([7,0.1,2], center=true);
      }
    }
    /* hull() {
      translate([0,0,0]) cube([5,0.1,3], center=true);
      translate([0,13,0]) cube([10,0.1,3], center=true);
    } */
    cube([2,10,5], center=true);
  }
}

module demi_attache_soc(x,y){
    translate([x,y+4,55]) difference() {
      union() { hull() {
        translate([0, 4,  0]) cube([2, 8, 23], center=true);
        translate([0,-4.5,0]) cube([2, 1, 10], center=true);
      };};
      translate([0,-4, 0]) cube([3, 8, 8], center=true);
      translate([0, 4, 8]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
      translate([0, 4,-8]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
    }
}

module demi_attache_disque(x, y, rotate_angle=0, z_correction=0){
    translate([x,y+100,40+z_correction]) rotate(rotate_angle, [1,0,0]) difference() {
      hull() {
        translate([0, 4,  0]) cube([2, 5, 13], center=true);
        translate([0,-4.5,0]) cube([2, 1, 5], center=true);
      };
      translate([0,-3, 0]) cube([3, 5, 5], center=true);
      translate([0, 4, 4]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
      translate([0, 4,-4]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
    }
}

module attache_bras(x){
    translate([x,-4,55]) difference() {
      union(){
        translate([0, 32,  0]) cube([2, 64, 8], center=true);
        hull() {
          translate([0,11.3,-2]) cube([2, 20, 0.1], center=true);
          translate([0,-6,-26]) rotate(90,[0,1,0]) cylinder(r=5, h=2, center=true);
        };
      };
      translate([0, 50,  0]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
      translate([0,-6, -26]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
      translate([0, 4, 0]) cube([3, 8, 8], center=true);
      translate([0, 60, 0]) cube([3, 8, 8], center=true);
      translate([0, -12, -17]) cube([3, 4, 8], center=true);
    }
}

module base_3emepoint(x){
    translate([x,-4,55]) difference() {
      union() {
        hull() {
          translate([0, 0, 4]) rotate(90,[0,1,0]) cylinder(h=2, r=8, center=true);
          translate([0, 0, 8]) rotate(90,[0,1,0]) cylinder(h=2, r=8, center=true);
        };
      };
      translate([0, 0, 10]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
      translate([0, 4, 0]) cube([3, 8, 8], center=true);
    }
}

module barre_3emepoint(x){
    translate([x,-4,55]) difference() {
      _barre_3emepoint_verticale(x);
      translate([0, 0, 10]) rotate(90,[0, 1, 0]) cylinder(r=1.5, h=3, center=true);
    }
}

module barre_3emepoint_pliee(x, reversed=0){
    translate([x,-1.5,55]) mirror([reversed,0,0]) union() {
      _barre_3emepoint_verticale(x);
      _barre_3emepoint_horizontale();
    }
}

module barre_3emepoint_unfold(x, reversed=0){
    translate([x, -1.5, 55]) mirror([reversed, 0, 0]) union() {
      _barre_3emepoint_verticale(x);
      translate([-6, 0, 7]) rotate(90, [0, 1, 0]) _barre_3emepoint_horizontale();
    }
}

module _barre_3emepoint_verticale(x){
    difference() {
      union() {
        hull(){
          translate([0, 3, 42]) rotate(90,[0,1,0]) cylinder(h=2, r=4, center=true);
          translate([0, 6, 42]) rotate(90,[0,1,0]) cylinder(h=2, r=4, center=true);
        }
        translate([0, 0, 26]) cube([2, 6, 40], center=true);
      }
      translate([0, 7, 42]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
      for(z=[43:-4:25])
      translate([0, 0, z]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
    }
}

module _barre_3emepoint_horizontale(){
    difference() {
      translate([4, 0, 6]) cube([6, 6, 2], center=true);
      translate([4, 0, 6]) rotate(90,[0,0,0]) cylinder(r=1, h=3, center=true);
    }
}

module contrevent_3emepoint(x, reversed=0){
  translate([x,-4,55]) mirror([reversed,0,0]) difference() {
    union() {
      translate([0, 7, 42]) rotate(90,[0,1,0]) cylinder(r=3, h=2, center=true);
      translate([21, 50,  0]) rotate(90,[0,1,0]) cylinder(r=3, h=2, center=true);
      hull(){
      translate([-1, 6, 39]) rotate(30,[-1,0,0]) cube([2,6,6]);
      translate([20, 43.8, 0]) rotate(30,[-1,0,0]) cube([2,6,6]);
      }
    }
    translate([21, 50,  0]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
    translate([0, 7, 42]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
  }
}

module traverse(x){
  difference() {
    union() {
      translate([x, 28, 55]) cube([2, 48, 8], center=true);
      translate([x, 80, 63]) cube([2, 104, 8], center=true);
    }
    translate([x, 70,  63]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
    translate([x, 121,  63]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
  };
}

module support_rouleaux_et_disques(x){
  difference() {
    translate([x, 112, 43]) cube([2, 80, 8], center=true);
    //Supports principaux
    translate([x, 78,  43]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
    translate([x, 131,  43]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
    //Barre disques
    translate([x, 96,  44]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
    translate([x, 104,  44]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
    //Rouleaux
    translate([x, 141,  43]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
    translate([x, 149,  43]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
  };
}

module barre_1(x){
  difference(){
    hull(){
      translate([x, 78,  43]) rotate(90,[0,1,0]) cylinder(r=3, h=2, center=true);
      translate([x, 70,  63]) rotate(90,[0,1,0]) cylinder(r=3, h=2, center=true);
    }
    translate([x, 78,  43]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
    translate([x, 70,  63]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
  }
}

module pivot(x){
  difference(){
    hull(){
      translate([x, 123,  73]) cube([2,5,0.1], center=true);
      translate([x, 123,  63]) cube([2,20,8], center=true);
      translate([x, 131,  40]) cube([2,6,0.1], center=true);
    }
    //Attache
    translate([x, 121,  63]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
    translate([x, 131,  43]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
    //Niveaux bas
    for (y=[0:2:2]){
      for (z=[0:2:8]){
        translate([x, 130+y-z/2,  60+z+y/2]) rotate(90,[0,1,0]) cylinder(r=0.8, h=3, center=true);
      }
    }
    //Niveaux haut
    for (y=[0:2:4]){
      for (z=[0:2:4]){
        translate([x, 126+y-z/2,  45+z+y/2]) rotate(90,[0,1,0]) cylinder(r=0.8, h=3, center=true);
      }
    }
  }
}

module _girder_rounding(){
  difference(){
    translate([0,0.75,0])cube([2,1.5,8],center=true);
    hull(){
      translate([0,0, 2.5]) rotate(90,[0,1,0]) cylinder(r=1.5,h=3,center=true);
      translate([0,0,-2.5]) rotate(90,[0,1,0]) cylinder(r=1.5,h=3,center=true);
    }
  }
}
module girder(length=200, front_hole=false, rear_hole=false){
  difference(){
    cube([length, 8, 8], center=true);
    if (front_hole){
      for (a =[0, 58, -58]){
        translate([a+2,2.5,0]) _girder_rounding();
        translate([a-2,2.5,0]) _girder_rounding();
      }
    }
    if (rear_hole){
      for (a =[29, 87, -29, -87]){
        translate([a+2,2.5,0]) _girder_rounding();
        translate([a-2,2.5,0]) _girder_rounding();
      }
    }
  }
}

module attache_girder(){
  difference(){
    cube([2, 64, 8], center=true);
    translate([0,  28, 0]) rotate(90,[0,1,0]) cylinder(r=1,h=3,center=true);
    translate([0, -28, 0]) rotate(90,[0,1,0]) cylinder(r=1,h=3,center=true);
  }
}

module large_frame(length=200) {
  union() {
    //Poutres
    translate([0, 0, 55]) girder(length,front_hole=true);
    translate([0, 56, 55]) girder(length,rear_hole=true);
    //Traverses
    translate([-1*(1+length/2), 28, 55]) attache_girder();
    translate([    1+length/2 , 28, 55]) attache_girder();
  }
}

module small_frame() {
  union() {
    //Poutres
    translate([16, 0, 55]) cube([86, 8, 8], center=true);
    translate([16, 56, 55]) cube([86, 8, 8], center=true);
    //Traverses
    translate([-26, 28, 55]) attache_girder();
    translate([ 60, 28, 55]) attache_girder();
  }
}

module poutre_disques(y, z, length=200){
  translate([0, y, z]) cube([length, 5, 5], center=true);
}

module te_disque(x){
  translate([x, 107, 34]) difference() {
    union() {
      translate([0, 0, 10]) cube([2, 8, 40], center=true);
      translate([0,-8,-14]) cube([2, 24, 8], center=true);
    }
    //Attache chassis
    for(z=[-1:8:35]){
    translate([0, 0, z]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
    }
    //Support disques
    translate([0, 0, -14]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
    translate([0, -15, -14]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
  }
}

module disque_egaliseur(x,y) {
  translate([x,107+y,19]) rotate(90,[0,1,0]) difference(){
    cylinder(r=13, h=2, center=true);
    cylinder(r=3, h=2.2, center=true);
  }
}

module disque_rouleau(x, y, diameter, inner_ray=4) {
  translate([x,y,diameter/2]) rotate(90,[0,1,0]) difference() {
    hull(){
      cylinder(r=diameter/2-5, h=2, center=true);
      for(angl=[0:45:360]){
          rotate(angl, [0,0,1]) translate([0, (diameter/2)-1, 0]) cylinder(r=1.5, h=2, center=true);
      }
    }
    cylinder(r=inner_ray, h=3, center=true);
    for(angl=[0:45:360]){
          rotate(angl, [0,0,1]) translate([0, diameter/2, 0]) cylinder(r=1.5, h=3, center=true);
    }
    for(angl=[22.5:45:360]){
          rotate(angl, [0,0,1]) translate([0, diameter-8.8, 0]) cylinder(r=(diameter/2)-7, h=3, center=true);
    }
  }
}

module te_double_rouleau(x) {
  translate([x, 160, 29]) difference() {
    union() {
      hull() {
        translate([0, -15, 7]) cube([2, 5, 5], center=true);
        translate([0,0,-14]) cube([2, 10, 8], center=true);
      }
      translate([0,0,-14]) cube([2, 50, 8], center=true);
    }
    //Axe
    translate([0, -15, 7]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
    //Support disques
    translate([0, 20, -14]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
    translate([0, -20, -14]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
  }
}

module te_simple_rouleau(x) {
  translate([x, 160, 29]) difference() {
    hull() {
      translate([0, -15, 8]) cube([2, 5, 5], center=true);
      translate([0,0,-14]) cube([2, 10, 8], center=true);
    }
    //Axe
    translate([0, -15, 7]) rotate(90,[0,1,0]) cylinder(r=1, h=3, center=true);
    //Support disques
    translate([0, 0, -14]) rotate(90,[0,1,0]) cylinder(r=1.5, h=3, center=true);
  }
}

module axe_pivot(x, y){
  translate([x, y, 50]) difference(){
    hull(){
      translate([0, 0, 4]) cube([8, 2, 8], center=true);
      translate([0, 0, 20]) rotate(90,[1,0,0]) cylinder(r=4, h=2, center=true);
    }
    //Rotation axle
    translate([0, 0, 20]) rotate(90,[1,0,0]) cylinder(r=2, h=3, center=true);
  }
}

module barre_pivot(x, y, reversed=0){
  translate([x,y,50]) mirror([reversed,0,0]) difference(){
    union(){
      hull(){
        translate([0, 0, 5]) cube([8, 2, 8], center=true);
        translate([0, 0, 20]) rotate(90,[1,0,0]) cylinder(r=4, h=2, center=true);
        translate([14, 0, 5]) cube([8, 2, 8], center=true);
      }

    }
    //Rotation axle
    translate([0, 0, 20]) rotate(90,[1,0,0]) cylinder(r=2, h=3, center=true);
    //Fixing
    translate([14, 0, 5]) rotate(90,[1,0,0]) cylinder(r=1.5, h=3, center=true);
  }
}

module barre_pivot_longue(x, y, reversed=0){
  translate([x,y,50]) mirror([reversed,0,0]) difference(){
    union(){
      hull(){
        translate([-1, 0, 5]) cube([8, 2, 8], center=true);
        translate([-1, 0, 20]) rotate(90,[1,0,0]) cylinder(r=4, h=2, center=true);
        translate([14, 0, 5]) cube([8, 2, 8], center=true);
      }
      hull(){
        translate([-1, 0, 20]) rotate(90,[1,0,0]) cylinder(r=4, h=2, center=true);
        translate([-60, 0, 20]) rotate(90,[1,0,0]) cylinder(r=4, h=2, center=true);
      }
    }
    //Rotation axle
    translate([-60, 0, 20]) rotate(90,[1,0,0]) cylinder(r=2, h=3, center=true);
    //Fixing
    translate([14, 0, 5]) rotate(90,[1,0,0]) cylinder(r=1.5, h=3, center=true);
  }
}

module rotation_axle(x){
  translate([x,25,70]) rotate(90,[1,0,0]) cylinder(r=2,h=70, center=true);
}

module semiport_avant_bas(){
  translate([0, -10, 40]) difference(){
    union(){
      translate([0,4,0]) cube([44, 2, 8], center=true);
      translate([0,-50,0]) cube([8, 110, 8], center=true);
      for (mult=[1,-1]){
        translate([mult*22, 0, 0]) cube([2, 10, 8], center=true);
        hull(){
          translate([mult*22, -5, 0]) cube([2, 0.1, 8], center=true);
          translate([mult*3,-40, 0]) cube([2, 0.1, 8], center=true);
        }
      }
    }
    rotate(90,[0,1,0]) cylinder(r=1.5, h=60, center=true);
    translate([0,-80,0]) cylinder(r=1.5, h=10, center=true);
    translate([0,-104,0]) rotate(90,[1,0,0]) cylinder(r=1.5, h=6, center=true);
  }
}

module semiport_arriere_bas(x){
  translate([x, 140, 55]) difference(){
      cube([2, 160, 8], center=true);
    translate([0,25,0]) rotate(90,[0,1,0]) cylinder(r=1,h=3, center=true);
    translate([0,76,0]) rotate(90,[0,1,0]) cylinder(r=1.5,h=3, center=true);
  }
}

module semiport_arriere_haut(x, reversed=0){
  translate([x, 125, 55]) mirror([reversed,0,0]) difference(){
    hull(){
      translate([0,40,0]) rotate(90,[0,1,0]) cylinder(r=4,h=2, center=true);
      translate([-2,-125,42]) rotate(90,[0,1,0]) cylinder(r=4,h=2, center=true);
    }
    translate([0,40,0]) rotate(90,[0,1,0]) cylinder(r=1,h=3, center=true);
    translate([-2,-125,42]) rotate(90,[0,1,0]) cylinder(r=1,h=3, center=true);
  }
}

module semiport_arriere_axe(){
  translate([0, 243, 8]) rotate(30,[1,0,0])difference(){
    union(){
        cube([80,8,8], center=true);
        translate([ 6,0,54]) cube([2,8,100], center=true);
        translate([-6,0,54]) cube([2,8,100], center=true);
    }
    for(x=[6,-6]){
      for(z=[99,54]){
        translate([ x,0,z]) rotate(90,[0,1,0]) cylinder(r=1.5,h=3, center=true);
      }
    }
    rotate(90,[0,1,0]) cylinder(r=1.5,h=83, center=true);
  }
}


module support_double_verins(y=0){
	translate([0, 25+y,70]) difference() {
		 union() {
			 hull(){
				 translate([-36,0,0]) rotate(90,[1,0,0]) cylinder(r=4,h=2, center=true);
				 translate([ 36,0,0]) rotate(90,[1,0,0]) cylinder(r=4,h=2, center=true);
			 }
       for (mult=[1,-1]){
		  	 hull(){
		  		 translate([mult*15,0,0]) rotate(90,[1,0,0]) cylinder(r=4,h=2, center=true);
		  		 translate([mult*25,0,15]) rotate(90,[1,0,0]) cylinder(r=4,h=2, center=true);
		  	 }
       }

		 }

     //Rotation Axle
     translate([-36,0,0]) rotate(90,[1,0,0]) cylinder(r=2,h=2, center=true);
     translate([ 36,0,0]) rotate(90,[1,0,0]) cylinder(r=2,h=2, center=true);
     //
     for (mult=[1,-1]){
       translate([mult*25,0,15]) rotate(90,[1,0,0]) cylinder(r=2,h=2.5, center=true);
     }
	 }
}

module support_simple_verin(x=0,y=0,z=0,mirroring=0){
	translate([x, y,z]) mirror([mirroring,0,0]) difference() {
    union(){
      hull(){
        translate([0, 0, 0.5]) cube([8, 2, 1], center=true);
        translate([0, 0, 25]) rotate(90, [1, 0, 0]) cylinder(r=4, h=2, center=true);
        translate([-4, 0, 25]) rotate(90, [1, 0, 0]) cylinder(r=4, h=2, center=true);
      }
    }
    translate([0, 0, 4]) rotate(90, [1, 0, 0]) cylinder(r=1.5, h=2.5, center=true);
    hull(){
      translate([0, 0, 25]) rotate(90, [1, 0, 0]) cylinder(r=2, h=2.5, center=true);
      translate([-4, 0, 25]) rotate(90, [1, 0, 0]) cylinder(r=2, h=2.5, center=true);
    }
  }
}
