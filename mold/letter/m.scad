h = 100;
w = 96;
d = 25;
b = 10;
x = 10;
base = 0;

translate([-b+x,-b,0]) color("red")
  cube([w+2*b,h+2*b,base]);
letter();

module letter() {
  linear_extrude(d)
    text("M", h, "Arial:style=bold");
}
