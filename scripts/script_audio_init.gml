/// Audio Init


if (room == room_boss)
{
    show_debug_message("boss");
    global.musica = audio_play_sound(mus_boss_intro, 10, false); // Se reproduce la intro de la música
    
    // Y cuando acabe se reproduce el loop de la misma
    global.mus_a_reproducir = mus_boss_loop;
    global.mus_a_reproducir_canal = 10;
    global.mus_a_reproducir_loop = true;
    alarm[0] = room_speed * 3.474; // 3.474 es la duración de la intro
        
}
else if (room == room_intro)
{
    show_debug_message("intro");
    global.musica = audio_play_sound(mus_intro, 10, false); 
}

else if (room == room_ending)
{
    show_debug_message("ending");
    global.musica = audio_play_sound(mus_ending, 10, false); 
}

else
{
    show_debug_message("else");
    global.musica = audio_play_sound(mus_stage_01, 10, true); // Se reproduce la música
    // audio_sound_gain(global.musica, 0.5, 0); // Se ajusta el volumen de la música al 50%
}


audio_master_gain(0.5); // Se ajusta elvolumen global al 50%
