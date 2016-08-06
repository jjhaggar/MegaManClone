// Se inicializan las variables del ancho y el alto para el modo ventana
global.ORIGINAL_WIDTH = 432;
global.ORIGINAL_HEIGHT = 243;

// Se inicializan las variables del ancho y el alto para el modo full_screen
global.RELACION_ANCHO = display_get_width() / global.ORIGINAL_WIDTH;
global.RELACION_ALTO = display_get_height() / global.ORIGINAL_HEIGHT;

menu_controlable = false;
alarm[0] = room_speed * 1;
