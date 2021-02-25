$fn=256;

module triangle(w=1, h=2) {
    polygon(
        points= [
            [0, h],
            [w/2, 0],
            [-w/2, 0],
        ]
    );
}

module spike() {
    rotate([-90, 0, 0]) {
        linear_extrude(3, center=true)
        triangle(w=13, h=25);
        rotate([0, 90, 0])
        linear_extrude(3, center=true)
        triangle(w=13, h=25);
    }
}

// top
translate([0, 0, 50]) {
    difference() {
        cylinder(d=13, h=45);
        cylinder(d=10, h=45);
    }
    rotate(22.5)
    cylinder(d=15, h=2);
}

// body
cube([3, 13, 100], center=true);
rotate(90)
cube([3, 13, 100], center=true);

// head
translate([0, 0, -50])
spike();