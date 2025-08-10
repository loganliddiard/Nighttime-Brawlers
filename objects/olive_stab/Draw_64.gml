// --- Window layout (same as your other minigame) ---
var gw = display_get_gui_width();
var gh = display_get_gui_height();
var max_side = min(gw, gh) * (1/3);
var s = max(1, floor(min(max_side / logical_w, max_side / logical_h)));
var win_w = logical_w * s, win_h = logical_h * s;
var x0 = round((gw - win_w) * 0.5);
var y0 = round((gh - win_h) * 0.5);

// helper to map logical -> GUI
function gui_x(lx) { return x0 + lx * s; }
function gui_y(ly) { return y0 + ly * s; }

// Backdrop + frame (optional)
draw_set_alpha(0.5);
draw_rectangle(0,0,gw,gh,false);
draw_set_alpha(1);
draw_rectangle(x0-8, y0-8, x0+win_w+8, y0+win_h+8, false);
draw_rectangle_color(x0, y0, x0+win_w, y0+win_h, c_black, c_black, c_black, c_black, false);

// Glass outline (ellipse)
draw_set_color(make_color_rgb(30,30,30));
draw_ellipse(gui_x(glass_cx - glass_rx), gui_y(glass_cy - glass_ry),
             gui_x(glass_cx + glass_rx), gui_y(glass_cy + glass_ry), false);

// Olives
for (var i = 0; i < array_length(olives); i++) {
    var o = olives[i];
    if (o.hit) continue;
    var gx = gui_x(o.x), gy = gui_y(o.y), rr = max(1, round(o.r * s));
    draw_set_color(make_color_rgb(60, 160, 60));
    draw_circle(gx, gy, rr, false);
    draw_set_color(c_black);
    draw_circle(gx, gy, rr, true);
}

// Toothpick
// Rim point
var rim_px = gui_x(glass_cx + glass_rx * dcos(pick_angle));
var rim_py = gui_y(glass_cy + glass_ry * dsin(pick_angle));
draw_set_color(c_white);
draw_circle(rim_px, rim_py, 2*s, false);

// Segment if stabbing/returning
if (stab_state != "orbit") {
    var dir = point_direction(glass_cx, glass_cy, (glass_cx + glass_rx * dcos(pick_angle)), (glass_cy + glass_ry * dsin(pick_angle)));
    var opp_x = gui_x(glass_cx - glass_rx * dcos(dir));
    var opp_y = gui_y(glass_cy - glass_ry * dsin(dir));

    var t = (stab_state == "stab") ? clamp(stab_t / stab_duration, 0, 1)
                                   : 1 - clamp(stab_t / return_duration, 0, 1);

    var tip_x = lerp(rim_px, opp_x, t);
    var tip_y = lerp(rim_py, opp_y, t);

    draw_set_color(make_color_rgb(220, 200, 160));
    draw_line_width(rim_px, rim_py, tip_x, tip_y, max(1, pick_thickness * s));
    // toothpick tip
    draw_circle(tip_x, tip_y, 1.5*s, false);
}