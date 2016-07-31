/// Player Input


// Alternar Full Screen al hacer click con el ratón ----------------------------------------------------------------------------------------
if mouse_check_button_pressed(mb_left) // Si se hace click con el ratón...
{
    if window_get_fullscreen() // ... si el juego está a pantalla completa ...
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



// Recoger el input de teclado del jugador en 3 variables. El método keyboard_check(tecla) devuelve 1 ó 0 ------------------------------------
tecla_derecha = keyboard_check(vk_right);
tecla_izquierda = -keyboard_check(vk_left);
tecla_salto = keyboard_check_pressed(ord('Z'));
tecla_disparo = keyboard_check_pressed(ord('X')); 



// Reaccionar al input del teclado y a la gravedad -------------------------------------------------------------------------------------------

// Pulsar derecha e izquierda:
movimiento_horizontal = tecla_izquierda + tecla_derecha; // Si se pulsan izq y dcha a la vez, el movimiento horizontal sería 0...
vel_hor = movimiento_horizontal * vel_andar; // ... pero en caso contrario, la vel_andar se multiplicaría por +1 ó -1.
if (movimiento_horizontal > 0)
{
    mira_a_dcha = true;
}
if (movimiento_horizontal < 0)
{
    mira_a_dcha = false;
}


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
 

// Disparar
if (tecla_disparo)
{
    var obj_proyectil;
    var correccion_x_proyectil = 6;
    var correccion_y_proyectil = -1;
    if (mira_a_dcha)
    {
        obj_proyectil = instance_create(x+correccion_x_proyectil , y+correccion_y_proyectil, obj_shot);
        obj_proyectil.vel_horiz_bala  = vel_proyectil;
    }
    else
    {
        obj_proyectil = instance_create(x-correccion_x_proyectil, y+correccion_y_proyectil, obj_shot);
        obj_proyectil.vel_horiz_bala  = -vel_proyectil;
    }
    audio_play_sound(snd_player_shot, 10, false);
    personaje_esta_disparando = true;
    momento_inicio_disparo = current_time;
}
if (personaje_esta_disparando && (current_time - momento_inicio_disparo) >= tiempo_disparando)
{
    personaje_esta_disparando = false;
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
 


// Colisiones verticales ----------------------------------------------------------------------------------------------------------------------
if (place_meeting(x,y+vel_ver, obj_wall)) // Si el personaje chocaría con el suelo/techo de seguir a la misma velocidad...
{
    while(!place_meeting(x, y+sign(vel_ver), obj_wall)) // ... mientras el personaje no esté a 1 píxel de colisionar...
    {
        y += sign(vel_ver); // ... se le suma o resta uno a su posición en "y".
    }
    vel_ver = 0; // ... y asignamos 0 a la velocidad vertical.
}
y += vel_ver;



// Actualizar el estado de la animación del personaje -------------------------------------------------------------------------------

if (sprite_index != spr_player_gethit && sprite_index != spr_player_death)
{
    if (place_meeting(x, y + 1, obj_wall)) // Si estamos pisando el suelo
    {
        if (vel_hor == 0 && vel_ver == 0)
        {
            if (personaje_esta_disparando)
                mi_estado_actual = ANIM_PERSONAJE.disparando_quieto;
            else    
                mi_estado_actual = ANIM_PERSONAJE.quieto;
        }
        if (vel_hor != 0 && vel_ver == 0)
        {
            if (personaje_esta_disparando)
                mi_estado_actual = ANIM_PERSONAJE.disparando_andando;
            else
                mi_estado_actual = ANIM_PERSONAJE.andando;
        }
    }
    if (vel_ver != 0)
    {
        if (personaje_esta_disparando)
            mi_estado_actual = ANIM_PERSONAJE.disparando_saltando;    
        else
            mi_estado_actual = ANIM_PERSONAJE.saltando;
    }
}



// Colisión con enemigos ----------------------------------------------------------------------------------------------------------------------

if (personaje_vulnerable)
{
    var inst_enemigo;
    inst_enemigo = instance_place(x, y, obj_enemy);
    if (inst_enemigo != noone)
    {    
        vida -= inst_enemigo.danyo;
        personaje_controlable = false;
        
        show_debug_message(vida);
        
        if (vida > 0)
        {
            mi_estado_actual = ANIM_PERSONAJE.recibiendo_golpe;
            audio_play_sound(snd_player_damage, 10, false);
            personaje_vulnerable = false;
        }
        else
        {
            mi_estado_actual = ANIM_PERSONAJE.muriendo;
            audio_play_sound(snd_player_death, 10, false);
            personaje_vulnerable = false;   
        }
    }
}
else //el personaje está invulnerable, o bien porque acaba de morir o porque haya recibido un golpe y siga vivo
{
    if (sprite_index == spr_player_death)
    {
        if (image_index == (image_number-1))
        {
            if (numero_vidas >= 0)
            {
                alarm[0] = invulnerabilidad_tras_muerte; // la alarma[0] hace personaje_vulnerable = true;
                personaje_controlable = true;
                numero_vidas--;
                vida = vida_maxima;
                mi_estado_actual = ANIM_PERSONAJE.saltando;
            }
            else
            {
                instance_destroy();
            }
        }
    }
    
    if (sprite_index == spr_player_gethit)
    {
        if (mira_a_dcha)
        {
            x--;
        }
        if (!mira_a_dcha)
        {
            x++;
        }
        
        if (image_index == (image_number-1))
        {
            alarm[0] = invulnerabilidad_tras_impacto; // la alarma[0] hace personaje_vulnerable = true;
            personaje_controlable = true;
            mi_estado_actual = ANIM_PERSONAJE.saltando;
        }
    }
}
