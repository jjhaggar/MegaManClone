// Se inicializan las variables del ancho y el alto para el modo ventana
global.ORIGINAL_WIDTH = 432;
global.ORIGINAL_HEIGHT = 243;

// Se inicializan las variables del ancho y el alto para el modo full_screen
global.RELACION_ANCHO = display_get_width() / global.ORIGINAL_WIDTH;
global.RELACION_ALTO = display_get_height() / global.ORIGINAL_HEIGHT;

menu_controlable = false;
alarm[0] = room_speed * 0.25;



// Creamos y aplicamos la fuente
fnt_bitmap_font = font_add_sprite(spr_bitmap_font, ord(" "), false, 0); // false es para que sea monospace
draw_set_font(fnt_bitmap_font);
draw_set_colour(c_white); // Color fuente
draw_set_halign(fa_left); // Alineación horizontal de fuente: a la izquierda
draw_set_valign(fa_top);  // Alineación vertical de fuente: arriba 



// Preparamos el Menú Principal
x_main_menu = 180; // Posición en x delmenú
y_main_menu = 136; // Posición en y delmenú

menuText[0] = "Empezar"  // Texto de la opción 0 (almacenamos los valores en un "array" para poder iterar entre ellos)
menuText[1] = "Continuar"     // Texto de la opción 1
menuText[2] = "Instrucciones"// Texto de la opción 2
menuText[3] = "Quitar"   // Texto de la opción 3

menuSelected = 0; // Opción seleccionada

