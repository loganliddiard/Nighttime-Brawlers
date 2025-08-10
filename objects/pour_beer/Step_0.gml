var pouring = keyboard_check(vk_space);

// POURING: build liquid + foam
if (pouring) {
    poured += pour_liquid_per_step;
    foam   = min(foam + foam_build_per_step, foam_cap);
} 
// NOT POURING: foam settles into liquid (some lost)
else if (foam > 0) {
    var settle = min(foam, foam_settle_rate);
    foam   -= settle;
    poured += settle * foam_settle_yield;
}

// Clamp liquid
poured = clamp(poured, 0, 999);

// Overpour flag (based on liquid; you can switch to visual if desired)
over_poured = (poured >= target + buffer);

// Smooth visuals
display_liquid = lerp(display_liquid, poured, smooth_k);
display_foam   = lerp(display_foam,   foam,   smooth_k);

// Optional: end condition still handled by Alarm[0]
