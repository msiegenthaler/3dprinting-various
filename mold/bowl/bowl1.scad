include <vase_lowpoly.scad>

bowl();

//expected size
*translate([0,0,50]) color("red")
  cube([150, 150, 100], center=true);


module bowl() {
  difference() {
    block();
    translate([0,0,12]) scale(0.88)
      block();
  }
}

module block() {
  xy_scale=1.35;
  scale([xy_scale,xy_scale,xy_scale])
    vase(
        "bowl", //[cylinder: Cylinder, vase1:Vase, vase2:Vase 2, glass: Glass, bowl:Bowl, cup1: Cup, cup2: Cup 2, cone: Cone ]
        60, //Radius 20 to 100
        6,  //Spike size -20 to 20
        10, //Sides 3 to 30
        3,  //Levels 3 to 30
        0.1,//Twisting factor, -1 to 1
        0.4 //z-scale
    );
}
