// Orbit the toothpick on the glass rim until space is pressed
if (stab_state == "orbit") {
    pick_angle = angle_wrap(pick_angle + orbit_deg_per_sec / room_speed);
    if (keyboard_check_pressed(vk_space)) {
        stab_state = "stab";
        stab_t = 0;
    }
} else {
    stab_t += 1;
    if (stab_state == "stab" && stab_t >= stab_duration) {
        stab_state = "return"; stab_t = 0;
    } else if (stab_state == "return" && stab_t >= return_duration) {
        stab_state = "orbit"; stab_t = 0;
    }
}

// Update olive motion (simple drift + ellipse bounce)
for (var i = 0; i < array_length(olives); i++) {
    var o = olives[i];
    if (o.hit) continue;

    // Tiny wandering (jitter)
    o.vx += (random_range(-0.1,0.1)) / room_speed;
    o.vy += (random_range(-0.1,0.1)) / room_speed;

    // Damping so they don’t runaway
    o.vx *= 0.995;
    o.vy *= 0.995;

    // Move
    o.x += o.vx;
    o.y += o.vy;

    // Bounce off ellipse boundary (reflect velocity)
    // Compute normalized point and push back in if outside
    var nx = (o.x - glass_cx) / (glass_rx - o.r);
    var ny = (o.y - glass_cy) / (glass_ry - o.r);
    var d2 = nx*nx + ny*ny;
    if (d2 > 1) {
        // normal direction (approx)
        var nlen = sqrt(nx*nx + ny*ny);
        nx /= nlen; ny /= nlen;

        // reflect
        var vdotn = o.vx * (nx) + o.vy * (ny);
        o.vx -= 2 * vdotn * (nx);
        o.vy -= 2 * vdotn * (ny);

        // push back inside
        var k = 1 / sqrt(d2);
        o.x = glass_cx + nx * (glass_rx - o.r) * k;
        o.y = glass_cy + ny * (glass_ry - o.r) * k;
    }

    olives[i] = o;
}

// Collision: toothpick vs olives
// Build the current pick segment in logical coords
var rim_x = glass_cx + glass_rx * dcos(pick_angle);
var rim_y = glass_cy + glass_ry * dsin(pick_angle);

// During stab, interpolate from rim -> opposite rim along the diameter line.
// During return, go back from center->rim or opposite? We’ll do center->rim for a snappy feel.
var seg_x1, seg_y1, seg_x2, seg_y2;

if (stab_state == "orbit") {
    // no segment, only rim indicator
    seg_x1 = seg_x2 = seg_y1 = seg_y2 = undefined;
} else {
    // Direction through center
    var dir = point_direction(glass_cx, glass_cy, rim_x, rim_y);
    var opp_x = glass_cx - glass_rx * dcos(dir);
    var opp_y = glass_cy - glass_ry * dsin(dir);

    if (stab_state == "stab") {
        var t = clamp(stab_t / stab_duration, 0, 1);
        seg_x1 = rim_x;
        seg_y1 = rim_y;
        seg_x2 = lerp(rim_x, opp_x, t);
        seg_y2 = lerp(rim_y, opp_y, t);
    } else { // return
        var t = 1 - clamp(stab_t / return_duration, 0, 1);
        seg_x1 = rim_x;
        seg_y1 = rim_y;
        seg_x2 = lerp(rim_x, opp_x, t); // retracting
        seg_y2 = lerp(rim_y, opp_y, t);
    }

    // Check segment-circle hits (olive radius)
    for (var i = 0; i < array_length(olives); i++) {
        var o = olives[i];
        if (o.hit) continue;

        // distance from point to segment
        var dist = point_distance_to_segment(o.x, o.y, seg_x1, seg_y1, seg_x2, seg_y2);
        if (dist <= o.r + 1) { // +1 as pick thickness
            o.hit = true;
            olives[i] = o;
            // (Optional) stick it to the pick: move to segment endpoint
            // o.x = seg_x2; o.y = seg_y2;
            audio_play_sound(snd_pick, 1, false);
        }
    }
}

// Helper for distance from point to segment (logical)
function point_distance_to_segment(px, py, x1, y1, x2, y2) {
    var vx = x2 - x1, vy = y2 - y1;
    var wx = px - x1, wy = py - y1;
    var c1 = vx*wx + vy*wy;
    if (c1 <= 0) return point_distance(px, py, x1, y1);
    var c2 = vx*vx + vy*vy;
    if (c2 <= c1) return point_distance(px, py, x2, y2);
    var b = c1 / c2;
    var bx = x1 + b * vx, by = y1 + b * vy;
    return point_distance(px, py, bx, by);
}