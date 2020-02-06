module rotate_around_axle(x=0,y=0,z=0,angle=0,rx=0,ry=0,rz=0)
{ translate([x,y,z])rotate(angle,[rx,ry,rz])translate([-1*x,-1*y,-1*z]) children(); }
