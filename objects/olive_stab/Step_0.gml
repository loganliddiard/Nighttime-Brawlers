

if (can_skewer and !olive_skewed){

	theta = (theta + omega) mod 360;

	// orbiting point position
	orb_x = cx + lengthdir_x(radius, theta);
	orb_y = cy + lengthdir_y(radius, theta);


	
    // Launch stab
    if (keyboard_check_pressed(vk_space)) {
        can_skewer = false;
        stab_phase = 1;              // going in
        home_x = orb_x;              // remember where to return
        home_y = orb_y;
        // direction from ring to center
        stab_dir = point_direction(orb_x, orb_y, cx, cy);
		sk_x = orb_x;
		sk_y = orb_y;
    }

} else{
	
    // ----- STAB / RETURN -----
    if (stab_phase == 1) {
        // Going inward toward center
        var px = sk_x;
        var py = sk_y;

        sk_x += lengthdir_x(stab_spd, stab_dir);
        sk_y += lengthdir_y(stab_spd, stab_dir);

        // --- HIT CHECK (coordinate-based) ---
        // If you're using an olive object, see the collision_line version below.
        // Segment-vs-circle (approx): check new point; add prev check to reduce tunneling.
        if (point_distance(sk_x, sk_y, olive_x, olive_y) <= olive_r
        ||  point_distance(px,   py,   olive_x, olive_y) <= olive_r) {
            // handle hit (pop olive, score, etc.)
            // e.g., move olive away or flag it as skewered
            // For demo: nudge olive outward
            var out_dir = point_direction(cx, cy, olive_x, olive_y);

			olive_speed = 0;
			olive_skewed = true;
        }

        // Reached center?
        if (point_distance(sk_x, sk_y, cx, cy) <= stab_spd) {
            sk_x = cx;
            sk_y = cy;
            // reverse direction (head back out)
            stab_dir = (stab_dir + 180) mod 360;
            stab_phase = 2;
        }

    } else if (stab_phase == 2) {
        // Going outward back to the ring home position
        var to_home_dir = point_direction(sk_x, sk_y, home_x, home_y);
        sk_x += lengthdir_x(stab_spd, to_home_dir);
        sk_y += lengthdir_y(stab_spd, to_home_dir);

        // Snap + re-arm when close enough
        if (point_distance(sk_x, sk_y, home_x, home_y) <= stab_spd) {
            sk_x = home_x;
            sk_y = home_y;
            can_skewer = true;
            stab_phase = 0;
        }
    }
}




if(olive_skewed){
	
	if (stab_phase != 0){
		olive_x += lengthdir_x(stab_spd, stab_dir);
		olive_y += lengthdir_y(stab_spd, stab_dir);
	}
	

}
else{

	if(point_in_circle(olive_x,olive_y,cx,cy,radius-48) && !olive_skewed){

		
			rotate += 1;
			// Add movement to x and y
			olive_x += lengthdir_x(olive_speed, dir);
			olive_y += lengthdir_y(olive_speed, dir);


	}else{
	
		dir = (dir + 180) mod 360;
		olive_x += lengthdir_x(olive_speed, dir);
		olive_y += lengthdir_y(olive_speed, dir);

	}


}


