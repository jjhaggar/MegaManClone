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


if (menu_controlable == true)
{
    if(keyboard_check(vk_enter))   
    {
        audio_play_sound(snd_menu_select, 10, false);
        
        switch(menuSelected) 
        {
            case 0: // Empezar Juego
                alarm[1] = room_speed * 0.5;
            break;
            case 1: // Continuar Partida
                show_message("No hay ninguna partida salvada");
            break;
            case 2: // Instrucciones
                show_message(
                "INSTRUCCIONES #" +
                "----------------------------------------------#" +                
                "Z: Salto #" +
                "X: Disparo #" +
                "CURSORES: Mover a derecha e izquierda #" +
                "CLICK IZQ: Cambio entre ventana y full screen #" +
                "ESCAPE: Salir del juego");
            break;
            case 3: // Salir del Juego
                game_end();
            break;
        }
    }
    
    if(keyboard_check_pressed(vk_up))
    {
        audio_play_sound(snd_menu_move, 10, false);
        menuSelected -=1;
        if (menuSelected < 0) 
        { 
            menuSelected = array_length_1d(menuText)-1; 
        }
    }
    if(keyboard_check_pressed(vk_down))
    {
        audio_play_sound(snd_menu_move, 10, false);
        menuSelected += 1;
        if (menuSelected >= array_length_1d(menuText)) 
        { 
            menuSelected = 0; 
        }
    }
}

