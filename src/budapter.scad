/*
Budapter SCAD by Free Beachler
inspired by http://www.thingiverse.com/thing:21412

Adapts existing JHead/RepRapFab-compatible extruder, such as Wade's or Greg Frost's extruder designs, to a Budaschnozzle-compatible one.  Helps to reduce filament kinking.

*/

$fn = 100;

h = 9.5;
d = 17.75;
fw = 3.5;
rnd = 2;
nippleheight = 0;

module dooschdapter() {
  difference() {
    union() {
      // base
      rotate([0, 0, 90]) cylinder(r = d / 2 - 0.1, h = h - rnd, center=false);
      translate([0, 0, h - rnd])
      intersection() {
          rotate([0, 0, 90]) cylinder(r = d / 2 - 0.1, h = rnd, center=false);
		  translate([0, 0, 0]) sphere(d / 2);
      }
      // nipple
      translate([0, 0, h]) {
        difference() {
          cylinder(r1 = 3.7, r2 = fw / 2 + 0.1, h = nippleheight, center = false);
          translate([-d / 2, -d / 2, nippleheight - 0.1]) cube([d, d, nippleheight * 3]);
        }
      }
    }
  // filament hole
  rotate([0, 0, 90]) cylinder(r = fw / 2, h = h * 4, center=true);
  }
}

translate([0, 0, 0]) dooschdapter();