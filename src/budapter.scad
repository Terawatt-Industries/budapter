/*
Budapter SCAD by Free Beachler
inspired by http://www.thingiverse.com/thing:21412

Adapts existing JHead/RepRapFab-compatible extruder, such as Wade's or Greg Frost's extruder designs, to a Budaschnozzle-compatible one.  Helps to reduce filament kinking.

*/

h = 10;
d = 16;
fw = 3.6;
rnd = 2;
nippleheight = 3.5;

module dooschdapter() {
  difference() {
    union() {
      // base
      rotate([0, 0, 90]) cylinder(r = d / 2 - 0.1, h = h - rnd, center=false, $fn=24);
      translate([0, 0, h - rnd])
      intersection() {
          rotate([0, 0, 90]) cylinder(r = d / 2 - 0.1, h = rnd, center=false, $fn=24);
		  translate([0, 0, 0]) sphere(d / 2, $fn=100);
      }
      // nipple
      translate([0, 0, h]) {
        difference() {
          cylinder(r1 = 3.7, r2 = fw / 2 + 0.1, h = nippleheight, center = false, $fn=24);
          translate([-d / 2, -d / 2, nippleheight - 1]) cube([d, d, d]);
        }
      }
    }
  // filament hole
  rotate([0, 0, 90]) cylinder(r = fw / 2, h = h * 4, center=true, $fn=24);
  }
}

translate([0, 0, 0]) dooschdapter();