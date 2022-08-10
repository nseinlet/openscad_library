include <tools.scad>
include <profiles.scad>
include <lemken/smaragd.scad>

module girder(length=200, y=0) {
    translate([0, y, 45]) difference(){
        cube([length, 8, 8],center=true);

    }
}

module _roll(length, y) {
  diameter = 30;
  for(angl=[0:45:360]){
    translate([0, y, diameter/2])  rotate(angl, [1,0,0]) translate([0, diameter/2, 0]) rotate(90,[0,1,0]) cylinder(r=1.5, h=length, center=true);
  }
  for(x=[(length/2)-10:-29:0]){
    inner_ray = x>=(length/2)-15?4:10;
    disque_rouleau(x, y, diameter, inner_ray);
    disque_rouleau(-x, y, diameter, inner_ray);

  }
}

module _frame(width=200) {
    girder(width);
    girder(width, 30);
}
