include <vase_lowpoly.scad>

vase(
    "bowl", //[cylinder: Cylinder, vase1:Vase, vase2:Vase 2, glass: Glass, bowl:Bowl, cup1: Cup, cup2: Cup 2, cone: Cone ]
    60, //Radius 20 to 100
    3,  //Spike size -20 to 20
    10, //Sides 3 to 30
    4,  //Levels 3 to 30
    0.1,//Twisting factor, -1 to 1
    0.4 //z-scale
);
