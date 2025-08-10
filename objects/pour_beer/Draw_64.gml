


draw_sprite_ext(background,0,display_get_gui_width()/2,display_get_gui_height()/2,3,3,0,c_white,1.0);

var gw = display_get_gui_width();
var gh = display_get_gui_height();
var scale = 3; // whatever looks good in your overlay window

var cx = gw * 0.5;
var cy = gh * 0.7;

// Glass sprite metrics
var spr = spr_beer_glass;
var sw = sprite_get_width(spr)  * scale;
var sh = sprite_get_height(spr) * scale;

// Anchor at center-bottom so it “sits” nicely
var x0 = cx - sw * 0.5;
var y0 = cy - sh; // top-left of where glass will draw

// 3) Define the glass’s inner fill area (pixels in the *source* sprite)
// Measure these once in your art program or trial-and-error
var inner_left   = 1;
var inner_right  = sprite_get_width(spr)-1;
var inner_bottom = sprite_get_height(spr)-1;
var inner_top    = 14;

// Convert to GUI coords with scale
var fx0 = x0 + inner_left   * scale;
var fx1 = x0 + inner_right  * scale;
var fyb = y0 + inner_bottom * scale;  // bottom
var fyt = y0 + inner_top    * scale;  // top

var inner_h = fyb - fyt;

// 4) Compute fill height from poured/target
var fill_norm = clamp(display_poured / target, 0, 2); // allow “overpour” > 1 if you want to visualize mistakes
var fill_top  = fyb - inner_h * min(fill_norm, 1);

// 5) Draw beer fill rectangle (behind the glass)
draw_set_alpha(1);
draw_set_color(make_color_rgb(230, 185, 60)); // lager-ish; swap for your palette
draw_rectangle(fx0, fill_top, fx1, fyb, false);

// Foam line at the top (optional)
if (fill_norm > 0) {
    draw_set_color(c_white);
    draw_rectangle(fx0, fill_top - 3*scale, fx1, fill_top, false);
}


// Compute normalized visual height
var visual_units = display_liquid + display_foam * foam_visual_gain;
var fill_norm    = clamp(visual_units / target, 0, 2); // allow >1 to show overpour visually
var fill_top     = fyb - inner_h * min(fill_norm, 1);

// Beer (liquid) body
draw_set_alpha(1);
draw_set_color(make_color_rgb(230,185,60));
draw_rectangle(fx0, fill_top, fx1, fyb, false);

// Foam cap thickness (px) driven by display_foam
var foam_px = max(2 * scale, display_foam * 0.08 * scale); 
// tweak 0.08 to taste; higher = thicker foam for same foam value

if (visual_units > 0) {
    // Foam sits above the liquid line
    var foam_top = fill_top - foam_px;
    draw_set_color(c_white);
    draw_rectangle(fx0, foam_top, fx1, fill_top, false);

    // Optional: tiny wobble for life
    // foam_top += sin(current_time * 0.01) * (0.5 * scale);
}


// 6) Draw the glass on top (so outline/rim covers the beer)
if(over_poured){
	draw_sprite_ext(spr_beer_glass, 1, x0, y0, scale, scale, 0, c_white, 1);
} else{
	draw_sprite_ext(spr_beer_glass, 0, x0, y0, scale, scale, 0, c_white, 1);
}

// 7) UI: target and poured
draw_set_color(c_white);
draw_text(cx - 120, y0 - 40, "Target: " + string(target));
draw_text(cx - 120, y0 - 20, "Poured: " + string(round(display_poured)));
draw_text(cx - 120, y0,       "Range ±" + string(buffer));