// Logical canvas (match your base if you already set one)
logical_w = 320;
logical_h = 180;

// Glass ellipse in logical space (center + radii)
glass_cx = logical_w * 0.5;
glass_cy = logical_h * 0.60;
glass_rx = 110;
glass_ry = 60;

// Olives
olive_count = 6;
olives = [];
olive_r = 4;           // logical radius (before scale)
olive_speed = 18;      // px/sec-ish (tweak)

// Toothpick orbit + stab
pick_angle = -90;              // degrees, starts at top
orbit_deg_per_sec = 90;        // speed around rim
stab_state = "orbit";          // "orbit" | "stab" | "return"
stab_t = 0;
stab_duration = 0.30 * room_speed;
return_duration = 0.25 * room_speed;
pick_thickness = 2;            // line thickness (draw)

// Spawn olives inside the ellipse
function _rand_in_ellipse() {
    // Rejection sampling until inside
    var xx, yy, dx, dy;
    repeat (1000) {
        x = irandom_range(floor(glass_cx - glass_rx + olive_r), floor(glass_cx + glass_rx - olive_r));
        y = irandom_range(floor(glass_cy - glass_ry + olive_r), floor(glass_cy + glass_ry - olive_r));
        dx = (x - glass_cx) / glass_rx;
        dy = (y - glass_cy) / glass_ry;
        if (dx*dx + dy*dy <= 1) return [x, y];
    }
    return [glass_cx, glass_cy];
}

for (var i = 0; i < olive_count; i++) {
    var p = _rand_in_ellipse();
    var ang = irandom_range(0,359);
    var spd = olive_speed * (0.6 + random(0.8)); // slight variation
    olives[i] = {
        x: p[0], y: p[1],
        vx: lengthdir_x(spd/room_speed, ang),
        vy: lengthdir_y(spd/room_speed, ang),
        r: olive_r,
        hit: false
    };
}

// Visual scaling/window (if not inherited from your base)
integer_scale = true;
pad = 10;