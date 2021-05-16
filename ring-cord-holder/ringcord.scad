$fs = 0.1;
$fa = 1;
delta = $preview ? 0.1 : 0; //for better preview rendering

h = 85;
h_mid = 55;
w = 18;
d_cord = 7;
d_top = 3;
d=d_cord+d_top;


screw_offset = 12;
screw_depth_offset = 2.35;
difference() {
  base();
  translate([0,screw_offset,screw_depth_offset])
    screw_hole();
  translate([0,-screw_offset,screw_depth_offset])
    screw_hole();
}

module base() {
  translate([0,-h/2,0]) {
    top();
    translate([0,(h-h_mid)/2,-d_cord])
      rounded_snickers(w,h_mid,d_cord,0.4);
  }
}

module top() {
  rounded_snickers(w,h,d_top,1.3);
}

module rounded_snickers(w,h,d,sf=0.8) {
  linear_extrude(d)
    rounded_panel(w,h,sf);
}

module rounded_panel(w,h,sf=0.8) {
  d_h = w*sf/2;
  hull() {
    translate([0,d_h,0]) scale([1,sf])
      circle(d=w);
    translate([0,h-d_h,0]) scale([1,sf])
      circle(d=w);
  }
}

module screw_hole() {
  d_low = 3.1;
  d_top = 6.0;
  h_top = 2.3;
  cylinder(d=d_top,h=20);
  translate([0,0,-h_top+delta])
    cylinder(d1=d_low, d2=d_top, h=h_top);
  translate([0,0,-h_top-20+delta*2])
    cylinder(d=d_low,h=20);
}