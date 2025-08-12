

if (show_sequence) exit;

// --- INPUT CAPTURE ---
if (tap_ready && result != "Win") {
    if (keyboard_check_pressed(ord("A"))) {
        tap_picked = 1;
        tap_ready = false;
    }
    else if (keyboard_check_pressed(ord("W"))) {
        tap_picked = 2;
        tap_ready = false;
    }
    else if (keyboard_check_pressed(ord("S"))) {
        tap_picked = 3;
        tap_ready = false;
    }
    else if (keyboard_check_pressed(ord("D"))) {
        tap_picked = 4;
        tap_ready = false;
    }
}

// --- RELEASE DETECTION ---
if (!tap_ready) {
    // Wait for *any* of the four keys to be released
    if (
        keyboard_check_released(ord("A")) ||
        keyboard_check_released(ord("W")) ||
        keyboard_check_released(ord("S")) ||
        keyboard_check_released(ord("D"))
    ) {
        // Do your "compute" action here
        // e.g., score check, sequence match, etc.
        
		//checks if input is correct. If so, we either move to win state or 
		if(sequence[seq_idx] == tap_picked){
			seq_idx +=1
			if(seq_idx == array_length(sequence)){
				
				result = "Win"
			}
		} else{
			
			seq_idx = 0;
			
		}
		

        // Reset for next press
        tap_picked = 0;
        tap_ready = true;
    }
}

