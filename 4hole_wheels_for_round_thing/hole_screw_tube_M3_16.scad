// 4mm*14mm M3 screw tubes

len_mm = 14;
wall_mm = 0.95;
inner_mm = 3.1;
d = wall_mm*2 + inner_mm;
t2 = 0.2;

difference() {
  union() {
    cylinder(len_mm - t2, d = inner_mm + wall_mm * 2);
    translate([-wall_mm/2, wall_mm, 0]) {
      cube([wall_mm, 2 - t2 , len_mm - t2]);
    }
  }
  cylinder(len_mm, r1 = inner_mm / 2, r2 = inner_mm / 2);
}