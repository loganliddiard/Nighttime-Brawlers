// --- CUP MOVEMENT (A/D) ---
if (keyboard_check(ord("A"))) cup_x -= cup_speed;
if (keyboard_check(ord("D"))) cup_x += cup_speed;

// keep inside virtual bounds
cup_x = clamp(cup_x, cup_w * 0.5, vw - cup_w * 0.5);

// --- SPAWN ---
spawn_timer++;
if (spawn_timer >= spawn_interval) {
    spawn_timer = 0;
    if (irandom(1) == 0) { // 50% chance each interval
        var sx = irandom_range(ice_r, vw + ice_r);
        array_push(ice_cubes, [sx, -ice_r * 2]);
    }
}

// --- UPDATE / COLLISION ---
for (var i = array_length(ice_cubes) - 1; i >= 0; i--) {
    // fall
    ice_cubes[i][1] += ice_speed;

    // simple AABB vs point-ish collision
    if (abs(ice_cubes[i][0] - cup_x) <= (cup_w * 0.5)
    &&  abs(ice_cubes[i][1] - cup_y) <= (cup_h * 0.5)) {
        cubes_caught += 1;
        array_delete(ice_cubes, i, 1);
        continue;
    }

    // off-screen
    if (ice_cubes[i][1] > vh - ice_r) {
        array_delete(ice_cubes, i, 1);
    }
}
