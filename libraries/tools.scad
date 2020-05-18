module rotate_around_axle(x=0,y=0,z=0,angle=0,rx=0,ry=0,rz=0)
{ translate([x,y,z])rotate(angle,[rx,ry,rz])translate([-1*x,-1*y,-1*z]) children(); };

module rounded_cube(x_size,y_size,z_size,r_size){
  hull(){
    translate([0,r_size-y_size/2, r_size-z_size/2]) rotate(90, [0,1,0]) cylinder(r=r_size, h=x_size, center=true);
    translate([0,r_size-y_size/2,-r_size+z_size/2]) rotate(90, [0,1,0]) cylinder(r=r_size, h=x_size, center=true);
    translate([0,-r_size+y_size/2, r_size-z_size/2]) rotate(90, [0,1,0]) cylinder(r=r_size, h=x_size, center=true);
    translate([0,-r_size+y_size/2,-r_size+z_size/2]) rotate(90, [0,1,0]) cylinder(r=r_size, h=x_size, center=true);
  }
}
