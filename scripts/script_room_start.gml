/// Inicio de fase

instance_create(x, y, obj_audio); // Creamos un manejador de audio

instance_create(x, y, obj_gui); // Creamos un gui en la room

// Se inicializan las variables del ancho y el alto para el modo ventana
global.ORIGINAL_WIDTH = 432;
global.ORIGINAL_HEIGHT = 243;

// Se inicializan las variables del ancho y el alto para el modo full_screen
global.RELACION_ANCHO = display_get_width() / global.ORIGINAL_WIDTH;
global.RELACION_ALTO = display_get_height() / global.ORIGINAL_HEIGHT;

// Creamos y aplicamos la fuente
fnt_bitmap_font = font_add_sprite(spr_bitmap_font, ord(" "), 1, 1);
draw_set_font(fnt_bitmap_font);
draw_set_colour(c_white); // Color fuente
draw_set_halign(fa_left); // Alineación horizontal de fuente: a la izquierda
draw_set_halign(fa_top);  // Alineación vertical de fuente: arriba 


