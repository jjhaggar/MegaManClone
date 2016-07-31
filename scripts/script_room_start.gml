/// Inicio de fase

var musica = audio_play_sound(mus_stage_01, 10, true);
audio_sound_gain(musica, 0.5, 0); // index, vol, fade_time(ms)

//test sumar dos números
var sumaPrueba = script_execute(script_sumar_dos_numeros, 7, 8);
show_debug_message(sumaPrueba);

instance_create(x, y, obj_gui);

global.ORIGINAL_WIDTH = 432;
global.ORIGINAL_HEIGHT = 243;

// global.DISPLAY_WIDTH = display_get_width();
// global.DISPLAY_HEIGHT = display_get_height();

global.RELACION_ANCHO = display_get_width() / global.ORIGINAL_WIDTH;
global.RELACION_ALTO = display_get_height() / global.ORIGINAL_HEIGHT;

