/// Inicio de fase

var musica = audio_play_sound(mus_stage_01, 10, true);
audio_sound_gain(musica, 0.5, 0); // index, vol, fade_time(ms)

//test sumar dos números
var sumaPrueba = script_execute(script_sumar_dos_numeros, 7, 8);
show_debug_message(sumaPrueba);
