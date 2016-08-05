/// Player Input


// Si se pulsa ESC, salir del juego --------------------------------------------------------------------------------------------------------
if(keyboard_check_pressed(vk_escape))
{
    game_end();
}



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



// Recoger el input de teclado del jugador en 4 variables. El método keyboard_check(tecla) devuelve 1 ó 0 ------------------------------------
tecla_derecha = keyboard_check(vk_right);
tecla_izquierda = keyboard_check(vk_left);
tecla_salto = keyboard_check_pressed(ord('Z'));
tecla_disparo = keyboard_check_pressed(ord('X')); 



// Reaccionar al input del teclado y a la gravedad -------------------------------------------------------------------------------------------

// Pulsar derecha e izquierda:
movimiento_horizontal = tecla_derecha - tecla_izquierda; // Si se pulsan izq y dcha a la vez, el movimiento horizontal sería 0...
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
    var obj_proyectil; // Declaramos una variable para asignarle un objeto proyectil
    var correccion_x_proyectil = 6; // Ajusta (en píxeles) de dónde sale el proyectil en x, para que salga del cañón y no del centro
    var correccion_y_proyectil = -1; // Ajusta (en píxeles) de dónde sale el proyectil en y
    if (mira_a_dcha) // Si el personaje mira a la derecha, se crea el proyectil y se le asigna velocidad a la derecha
    {
        obj_proyectil = instance_create(x+correccion_x_proyectil , y+correccion_y_proyectil, obj_shot);
        obj_proyectil.vel_horiz_bala  = vel_proyectil;
    }
    else // De lo contrario (si mira a la izquierda), se crea el proyectil y se le asigna velocidad a la izquierda
    {
        obj_proyectil = instance_create(x-correccion_x_proyectil, y+correccion_y_proyectil, obj_shot);
        obj_proyectil.vel_horiz_bala  = -vel_proyectil;
    }
    audio_play_sound(snd_player_shot, 10, false); // Se reproduce el sonido del disparo
    personaje_esta_disparando = true; // El personaje está disparando (esto se usará para mostrar una animación u otra)
    momento_inicio_disparo = current_time; // Se inicia el contador al tiempo actual
}
// Cuando transcurra el "tiempo_disparando" el personaje dejará de "estar disparando", afectando a su animación
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
    vel_hor = 0; // ... y al acabar (es decir, cuando esté a 0 píxeles de distancia) se asigna 0 a la velocidad horizontal.
}
x += vel_hor; // Tanto si se entra en el "if" como si no, se le suma la velocidad horizontal a la "x" (si entra en el "if", vel_hor será 0)
 


// Colisiones verticales ----------------------------------------------------------------------------------------------------------------------
if (place_meeting(x,y+vel_ver, obj_wall)) // Si el personaje chocaría con el suelo/techo de seguir a la misma velocidad...
{
    while(!place_meeting(x, y+sign(vel_ver), obj_wall)) // ... mientras el personaje no esté a 1 píxel de colisionar...
    {
        y += sign(vel_ver); // ... se le suma o resta uno a su posición en "y".
    }
    vel_ver = 0; // ... y asignamos 0 a la velocidad vertical.
}
y += vel_ver; // Se le suma la velocidad vertical a la y



// Fin de fase ----------------------------------------------------------------------------------------------------------------------------------
var margen_x = 3; // Margen en la x para entrar en "puerta de final de fase"
var margen_y = 6; // Margen en la y para entrar en "puerta de final de fase"
if (obj_player.x <= obj_door.x+ margen_x && obj_player.x >= obj_door.x - margen_x) // Si el personaje está dentro de los márgenes de "x"...
{
    if (obj_player.y <= obj_door.y+ margen_y && obj_player.y >= obj_door.y - margen_y) //... y de los márgene de "y"...
    {   
        script_execute(script_room_ends, room + 1); // ... se ejecuta el script de "script_room_ends", pasándole el valor de la siguiente habitación 
    }
}



// Actualizar el estado de la animación del personaje -------------------------------------------------------------------------------
if (sprite_index != spr_player_gethit && sprite_index != spr_player_death) // Si la animación actual no es spr_player_gethit ni spr_player_death...
{
    if (place_meeting(x, y + 1, obj_wall)) // ... y el personaje está pisando el suelo...
    {
        if (vel_hor == 0 && vel_ver == 0) // ... y además el personaje está quieto...
        {
            if (personaje_esta_disparando)  // ... si está disparando, actualizamos al estado ANIM_PERSONAJE.disparando_quieto
                mi_estado_actual = ANIM_PERSONAJE.disparando_quieto;
            else                            // ... si no está disparando, actualizamos al estado ANIM_PERSONAJE.quieto
                mi_estado_actual = ANIM_PERSONAJE.quieto;
        }
        if (vel_hor != 0 && vel_ver == 0) // ... y el personaje se mueve en la x...
        {
            if (personaje_esta_disparando)  // ... si está disparando, actualizamos al estado ANIM_PERSONAJE.disparando_andando
                mi_estado_actual = ANIM_PERSONAJE.disparando_andando;
            else                            // ... si no está disparando, actualizamos al estado ANIM_PERSONAJE.andando
                mi_estado_actual = ANIM_PERSONAJE.andando;
        }
    }
    if (vel_ver != 0) // ... y el personaje tiene velocidad vertical distinta de 0...
    {
        if (personaje_esta_disparando)  // ... si está disparando, actualizamos al estado ANIM_PERSONAJE.disparando_saltando
            mi_estado_actual = ANIM_PERSONAJE.disparando_saltando;    
        else                            // ... si no está disparando, actualizamos al estado ANIM_PERSONAJE.saltando
            mi_estado_actual = ANIM_PERSONAJE.saltando;
    }
}



// Colisión con enemigos ----------------------------------------------------------------------------------------------------------------------

if (personaje_vulnerable) // Si el personaje es vulnerable...
{
    var inst_enemigo = instance_place(x, y, obj_enemy); // Se intenta asignar una instancia de tipo obj_enemy que esté en colisión con el personaje
    if (inst_enemigo != noone) // Si existe una instancia de enemigo que esté colisionando con el personaje...
    {    
        global.vida -= inst_enemigo.danyo; // El personaje recibe el dañoque haga el enemigo
        personaje_controlable = false; // El personaje deja de ser controlable 
        if (global.vida > 0) // Si aún queda vida (energía) al personaje:
        {
            mi_estado_actual = ANIM_PERSONAJE.recibiendo_golpe; // Se actualiza al estado de animación ANIM_PERSONAJE.recibiendo_golpe
            audio_play_sound(snd_player_damage, 10, false); // Se reproduce el sonido de recibir daño
            personaje_vulnerable = false; // El personaje deja de ser vulnerable (si no el contacto con un enemigo lo mataría siempre)
        }
        else // De lo contrario, si no le queda vida (energía) al personaje:
        {
            mi_estado_actual = ANIM_PERSONAJE.muriendo;  // Se actualiza al estado de animación ANIM_PERSONAJE.muriendo
            audio_play_sound(snd_player_death, 10, false); // Se reproduce el sonido de morir
            personaje_vulnerable = false; // El personaje deja de ser vulnerable 
        }
    }
}
else //... si no, el personaje está invulnerable, o bien porque acaba de morir o porque haya recibido un golpe y siga vivo
{
    if (sprite_index == spr_player_death) // Si el sprite del personaje muestra la animación de la muerte...
    {
        if (image_index == (image_number-1)) // ... y la animación acaba:
        {
            if (global.numero_vidas > 0) // Si el personaje aún tiene vidas:
            {
                personaje_controlable = true; // El personaje vuelve a ser controlable
                global.numero_vidas--; // Reducimos una "vida"
                global.vida = vida_maxima; // Ponemos la vida/energía del personaje al máximo
                mi_estado_actual = ANIM_PERSONAJE.saltando; // Se actualiza al estado de animación ANIM_PERSONAJE.saltando
                alarm[0] = invulnerabilidad_tras_muerte; // la alarma[0] tiene este código -> personaje_vulnerable = true;
            }
            else // Si al personaje ya no le quedan vidas:
            {
                instance_destroy(); // se destruye al personaje
                if show_question("GAME OVER # ¿Jugar otra partida?") // Si se hace click en yes en la ventana con la pregunta:
                {
                    global.puntos = 0;
                    script_execute(script_room_ends, 0); // Se reinicia el juego desde la primera habitación (el número índice es 0)
                }
                else game_end(); // Si se hace click en no, se cierra el juego
            }
        }
    }
    
    if (sprite_index == spr_player_gethit) // Si el sprite del personaje muestra la animación de recibir daño...
    {
        if (mira_a_dcha) // ... y mira a la derecha:
        {
            x--; // ... el personaje retrocede hacia la izquierda por el impacto
        }
        if (!mira_a_dcha)// ... y mira a la izquierda:
        {
            x++; // ... el personaje retrocede hacia la derecha por el impacto
        }
        
        if (image_index == (image_number-1)) // Cuando la animación acaba:
        {
            personaje_controlable = true; // El personaje vuelve a ser controlable
            mi_estado_actual = ANIM_PERSONAJE.saltando; // Se actualiza al estado de animación ANIM_PERSONAJE.saltando
            alarm[0] = invulnerabilidad_tras_impacto; // la alarma[0] hace personaje_vulnerable = true;
        }
    }
}
