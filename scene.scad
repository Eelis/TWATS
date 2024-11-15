include <anchor.scad>

$fn = 20;

module lace() {
    arc_radius = 3.5;
    translate([0, 0, -arc_radius])
        rotate([90, 0, 100])
            rotate_extrude(angle = 180)
                translate([arc_radius, 0, 0])
                    circle(lace_diameter / 2);
}

module tiewrap(r = 7.5)
    rotate([0, -90, 0])
        translate([0, -r, 0])
            rotate_extrude(angle = 180)
                translate([r, 0, 0])
                    square(size = [tiewrap_thickness, tiewrap_width], center = true);

module swooping_tiewrap()
    leg_placement()
        for (a = [-54 : 18 : 90])
            translate([-0.2, 1.5, 0])
                rotate([0, 0, 90 - a])
                    translate([0, -1, 0])
                        tiewrap(7);

module context() {
    lace();
    swooping_tiewrap();
}

context();
