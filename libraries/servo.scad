/*
                  G                                                         D
              |--------|                              |---------------------------------------------|
  _    _              | |                                                                               _
  |    |      ----------------------------            -----------------------------------------------   |
  |    | C    |                          |            |     |                                  |    |   |
  |    _  -----------------------------------         |  O  |                                  |  O |   |  E
  |       |                                 |      _  |  O  |                                  |  O |   |
A |    _  -----------------------------------    F |  |     |                                  |    |   |
  |    |      |                          |         _  -----------------------------------------------   _
  |    |      |                          |
  |  B |      |                          |            |-----|
  |    |      |                          |               H
  |    |      |                          |
  _    _      ----------------------------



 */


module _generic_servo(a, b, c, d, e, f, g, h) {
  difference(){
    union(){
      translate([0, 0, a-b-c]) cube([d-2*h, e, c]);
      translate([-h, 0, 0]) cube([d, e, a-b-c]);
      translate([0, 0, -b]) cube([d-2*h, e, b]);
      translate([g, e/2, a-b]) cylinder(r=3, h=6);
    }
    translate([2-h, f, -0.25]) cylinder(r=2.3, h=3);
    translate([2-h, e-f, -0.25]) cylinder(r=2.3, h=3);
    translate([d-h-2, f, -0.25]) cylinder(r=2.3, h=3);
    translate([d-h-2, e-f, -0.25]) cylinder(r=2.3, h=3);
  }
}


module servo_powerhd_1501mg() {
  _generic_servo(36.5, 26, 8, 52, 20, 5, 10, 6);
}

module servo_turnigy_tgy225mg() {
  _generic_servo(29.5, 22, 5, 44, 20, 4, 8, 6);
}

module servo_9g() {
  _generic_servo(27, 15, 8.5, 32.5, 12, 6,6, 4.8);
}
