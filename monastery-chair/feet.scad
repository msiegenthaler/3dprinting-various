delta = $preview ? 0.005 : 0; //for better preview rendering

gap  = 0.3;
inner_x = 12.0 - gap;
inner_y = 16.5 - gap;

outer_x = 15.3;
outer_y = 20.4;

thickness = 0.2 * 8;
in_length = 10;
wall = 1;

translate([0, 0, -thickness/2])
  cube([outer_x, outer_y, thickness], center=true);

translate([0, 0, in_length/2]) difference() {
  cube([inner_x, inner_y, in_length], center=true);
  cube([inner_x-2*wall, inner_y-2*wall, in_length+2*delta], center=true);
}
