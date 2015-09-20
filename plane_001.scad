
wingsAndHtp();
fuselage();
fin();

//translate([0,45,0])color([1,0.1,0.2])cylinder(d=150,h=0.1);

halfWidth = 153/2;

module fuselage() {
    lenScale = 2.2;
    yShift = -65;
    xShift = 7.5;
    zShift = -1;
    translate([0,-15,0]) {
        difference() {
            union(){
                difference() {
                    translate([0,0,7.8])rotate([-90,0,0])rotate_extrude($fn=50)translate([-halfWidth,0,0])import("plane_001.dxf", layer="Fuselage");
                    scale([1.4,lenScale,1.4])translate([xShift,yShift,zShift])rotate([-90,0,0])rotate_extrude($fn=50)translate([-halfWidth,0,0])import("plane_001.dxf", layer="Fuselage");
                    scale([1.4,lenScale,1.4])translate([-xShift,yShift,zShift])rotate([-90,0,0])rotate_extrude($fn=50)translate([-halfWidth,0,0])import("plane_001.dxf", layer="Fuselage");
                }
                rotate([0,-90,0])translate([-halfWidth,0,-(0.4*6)/2])linear_extrude(0.4*6) import("plane_001.dxf", layer="Spine");
            }
//            rotate([-90,0,0])translate([0,-7.8,83])cylinder(d=2.8,$fn=10,h=80);
        }
    }
}

module wingsAndHtp() {
    
    translate([-halfWidth,0,0]) {
        linear_extrude(0.4) import("plane_001.dxf", layer="WingsAndHTP");
translate([0,-15,0])linear_extrude(0.8) import("plane_001.dxf", layer="WingReinforce");
    }
}

module fin() {
    rotate([0,-90,0])translate([-halfWidth,-15,-0.6/2])linear_extrude(0.6) import("plane_001.dxf", layer="VTP");
}