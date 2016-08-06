// Si se pulsa ESC, salir del juego --------------------------------------------------------------------------------------------------------
if(keyboard_check_pressed(vk_escape))
{
    game_end();
}

// Alternar Full Screen al hacer click con el ratón ----------------------------------------------------------------------------------------
if(mouse_check_button_pressed(mb_left)) // Si se hace click con el ratón...
{
    if(window_get_fullscreen()) // ... si el juego está a pantalla completa ...
    {
        window_set_fullscreen(false); // ... se quita la pantalla completa.
        display_set_gui_size(432, 243);
    }
    else // ... de lo contrario (es decir, si no está a pantalla completa)...
    {
        window_set_fullscreen(true); // ... lo ponemos a pantalla completa.
        display_set_gui_maximise(global.RELACION_ANCHO, global.RELACION_ALTO); // funciona
    }
}


// Si se pulsa Intro, volver a main screen ------------------------------------------------------------------------------------------------
if(keyboard_check(vk_enter))   
{
    global.puntos = 0;
    script_execute(script_room_ends, room_intro); // Se reinicia el juego desde la primera habitación (el número índice es 0)
}

