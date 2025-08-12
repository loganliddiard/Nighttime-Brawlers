// Create
drink_reward   = "IPA";
amount_awarded = 0;

result = "Lost";
timer  = 8;

// Pick a random sequence length between 3 and 6
seq_length = irandom_range(3, 6);

// Create the sequence array
sequence = array_create(seq_length, 0);

for (var i = 0; i < seq_length; i++) {
    sequence[i] = irandom_range(1, 4);
}


seq_idx = 0;
show_sequence = true;
tap_ready = true;

tap_picked = 0;

show_sequence_timer = .5;

alarm[0] = game_get_speed(gamespeed_fps) * timer;
alarm[1] = game_get_speed(gamespeed_fps)*show_sequence_timer;



