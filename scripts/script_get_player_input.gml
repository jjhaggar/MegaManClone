/// Player Input


// Alternar Full Screen al hacer click con el ratón ----------------------------------------------------------------------------------------
if mouse_check_button_pressed(mb_left) // Si se hace click con el ratón...
{
    if window_get_fullscreen() // ... si el juego está a pantalla completa ...
    {
        window_set_fullscreen(false); // ... se quita la pantalla completa.
    }
    else // ... de lo contrario (es decir, si no está a pantalla completa)...
    {
        window_set_fullscreen(true); // ... lo ponemos a pantalla completa.
    }
}



// Recoger el input de teclado del jugador en 3 variables. El método keyboard_check(tecla) devuelve 1 ó 0 ------------------------------------
tecla_derecha = keyboard_check(vk_right);
tecla_izquierda = -keyboard_check(vk_left);
tecla_salto = keyboard_check_pressed(vk_space);



//Reaccionar al input del teclado y a la gravedad --------------------------------------------------------------------------------------------

// Pulsar derecha e izquierda:
movimiento_horizontal = tecla_izquierda + tecla_derecha; // Si se pulsan izq y dcha a la vez, el movimiento horizontal sería 0...
vel_hor = movimiento_horizontal * vel_andar; // ... pero en caso contrario, la vel_andar se multiplicaría por +1 ó -1.

// Caer:
if (vel_ver < vel_max_caida) // Si no se supera la velocidad máxima de caída...
{
    vel_ver += gravedad; // ... se sigue aumentando la velocidad vertical del personaje.
}

// Saltar:
if (place_meeting(x, y + 1, obj_wall)) // Si la "x" y la "y+1" del personaje coinciden con la posición de un bloque obj_wall...
{
    if (tecla_salto) // ... y se ha pulsado la tecla salto...
    {
        vel_ver = -vel_salto // ... se asigna la vel_ver de salto al personaje (es negativa porque la "y" aumenta hacia abajo).
    }
}
 


// Colisiones Horizontales --------------------------------------------------------------------------------------------------------------------
if (place_meeting(x+vel_hor, y, obj_wall)) // Si la "x+vel_horiz" y la "y" del pers coinciden con la pos de un obj_wall...
{
    while(!place_meeting(x+sign(vel_hor), y, obj_wall)) // ... mientras el personaje no esté a 1 píxel de colisionar...
    {
        x += sign(vel_hor); // ... se le suma o resta uno a su posición en "x".
    }
    vel_hor = 0; // ... y asignamos 0 a la velocidad horizontal.
}
x += vel_hor; // Tanto si se entra en el "if" como si no, se le suma la velocidad_horizontal a la "x" (si entramos en el "if", se le sumará 0)
 


//Colisiones verticales ----------------------------------------------------------------------------------------------------------------------
if (place_meeting(x,y+vel_ver, obj_wall)) // Si el personaje chocaría con el suelo/techo de seguir a la misma velocidad...
{
    while(!place_meeting(x, y+sign(vel_ver), obj_wall)) // ... mientras el personaje no esté a 1 píxel de colisionar...
    {
        y += sign(vel_ver); // ... se le suma o resta uno a su posición en "y".
    }
    vel_ver = 0; // ... y asignamos 0 a la velocidad vertical.
}
y += vel_ver;
