outer = 28.5;
inner = 25.51;
length = 35;
width = 48;
h_foot = 2;

flicker = 0.2;

difference() {
    core(-outer / 2 - h_foot, width / 2, 0);
    holes(width, length, 14);
}

module core(x, y, z) {
    close_depth = 2;
    translate([x, y, z]) {
        union() {
            difference() {
                union() {
                    translate([0, -width / 2, 0]) {
                        cube([h_foot + outer / 2, width, length]);
                    }
                    cylinder(length, d = outer);
                }
                cylinder(length + flicker, d = inner);
            }
            translate([0, 0, -close_depth]) {
                difference() {
                    cylinder(close_depth, d = outer);
                    cylinder(close_depth + flicker * 2, d = 3);
                }
            }
        }
    }
}

module holes(width, length, depth) {
    wall = 0.95;
    inner = 3.1;
    tolerance = 0.2;

    hole_size = inner + wall * 2;
    dz = 16.64 + hole_size;
    dy = 30.48 + hole_size;
    size_z = dz + hole_size;
    size_y = dy + hole_size;

    offy = (width / 2 - size_y / 2);
    offz = (length / 2 - size_z / 2);

    hole(inner, wall, tolerance, depth, offy, offz);
    hole(inner, wall, tolerance, depth, offy, offz + dz);
    hole(inner, wall, tolerance, depth, offy + dy, offz);
    hole(inner, wall, tolerance, depth, offy + dy, offz + dz);
}


module hole(inner, wall, tolerance, h, y, z) {
    d = wall * 2 + inner;
    r = d / 2;

    translate([-h, y + r, z + r]) {
        rotate([0, 90, 0]) {
            translate([-wall / 2, wall, 0]) {
                cube([wall, 2 - tolerance / 2, h + flicker]);
            }
            cylinder(h = h + flicker, r1 = r + tolerance, r2 = r + tolerance);
        }
    }
}