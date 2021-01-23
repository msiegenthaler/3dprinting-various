$fs = 0.1;
$fa = 1;
delta = $preview ? 0.005 : 0; //for better preview rendering

rail_width = 5.3;
rail_inside_width = 10.0;
rail_depth = 4.5;
rail_top_strength = 1.5;
rail_d = 20.0;
rail_d_cut = 18.1;

rail_side_gap = 1;
rail_inside_side_gap = 2;
rail_depth_gap = 0.5;
rail_margin = 0.5;


rail_connector(10);

l=10;
x=rail_d/2;
x2 = 4.6;
z_top = 4;
z_bottom = rail_d_cut/2;
difference() {
  translate([x/2-x2/2,0,-z_bottom/2+z_top/2])
    cube([x+x2,l,z_top+z_bottom], center=true);
  rail_outline(10+2*delta);
}

module rail_outline(l) {
  translate([0,0,-rail_d_cut/2])
  difference() {
    translate([0,l/2,0])
      rotate([90,0,0]) cylinder(d=rail_d, h=l);
    translate([0,0,rail_d_cut+delta])
      cube([rail_d, l+2*delta, rail_d_cut], center=true);
    translate([0,0,-rail_d_cut-delta])
      cube([rail_d, l+2*delta, rail_d_cut], center=true);
  }
}

module rail_connector(l, rounding=0) {
  // the thing inside the rail
  z1 = rail_depth - rail_depth_gap;
  z2 = rail_top_strength+rail_margin;
  translate([0,0,-z1/2-z2])
    roundedcube_simple([rail_inside_width-rail_inside_side_gap, l, z1], center=true, radius=rounding);
  // connector
  translate([0,0,-z2/2])
    cube([rail_width-rail_side_gap, l, z2], center=true);
}

module roundedcube_simple(size = [1, 1, 1], center = false, radius = 0.5) {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate = (center == false) ?
		[radius, radius, radius] :
		[
			radius - (size[0] / 2),
			radius - (size[1] / 2),
			radius - (size[2] / 2)
	];

	translate(v = translate)
	minkowski() {
		cube(size = [
			size[0] - (radius * 2),
			size[1] - (radius * 2),
			size[2] - (radius * 2)
		]);
		sphere(r = radius);
	}
}
