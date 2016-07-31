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

// Creamos y aplicamos la fuente
fnt_bitmap_font = font_add_sprite(spr_bitmap_font, ord(" "), 1, 1);
draw_set_font(fnt_bitmap_font);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_halign(fa_top);


