$fa = 1;
$fn = 30;
delta = 0.01;

side_walls = 0.3;

model_t = 6.5;
silicone_t = 10;

w = 80;
h = 50;

// rotate([180,0,180]) positive();
mould_box();
negative();

module mould_box() {
  w2 = w+2*side_walls;
  h2 = h+2*side_walls;
  translate([0,0,model_t]) difference() {
    union () {
      translate([-w2/2,-h2/2,-silicone_t]) color("blue") cube([w2,h2,silicone_t]);
    }
    translate([-w/2,-h/2,-silicone_t-delta]) cube([w,h,silicone_t]);
  }
}

module negative() {
  difference() {
    translate([-w/2,-h/2,delta]) cube([w,h,model_t]);
    positive();
  }
}

module positive() {
  bunny_scale = 1.3;
  translate([18,8,0]) scale([bunny_scale, bunny_scale, 1]) mirror([1,0,0])
    rotate([90,0,0]) import("bunny.stl");


  translate([-20, -9, -1.6])
    flower(n=8, c=6, E=5, P=12);

  translate([26, -16, -1.6])
    flower(n=8, c=2, E=5, P=8);

  translate([-8,15,0]) linear_extrude(2) rotate([0,0,180]) mirror([0,0,1]) text("2021", 8);
}

module flower(n, c, E, P) {
  union() {
    // petals
    difference(){	
      for (i=[1:n]){
        rotate([0,-2*E,i*(360/n)]){
          resize([0,(P/2),E], auto=[false,false,false]){
            translate([c/2+P/3,0,0]) sphere(r=P/2);
          }	
        }
      }		
      translate([0,0,-(4*P+4*c)/2]) cube((4*P)+(4*c), center=true);
    }
    // Center
    resize([0,0,E/2]) {
      difference() {
        sphere(r=c/2);
        translate([0,0,-c/2]) cube(c, center=true);
      }
    }
  }
}