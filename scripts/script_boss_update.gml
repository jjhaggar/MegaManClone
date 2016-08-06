/// Actualizaciones Boss

if (vida <= 0) // Si el boss pierde toda la vida
{
    if (sprite_index != spr_enemy_death) // Si su aninación no es la de morir...
    {
        sprite_index = spr_enemy_death; // ... le asignamos la animación de morir
        audio_stop_all();
        audio_play_sound(snd_enemy_damage, 10, false);
        
    }
    if (image_index == (image_number-1)) // Cuando acaba la animación de morir:
    {
        global.puntos += puntos; // Se suman sus puntos a los del jugador
        instance_destroy(); // Se destruye la instancia del boss
    }    
}

if (ojo_abierto) // Si su ojo está abierto...
{
    if (steps_desde_ultimo_parpadeo >= tiempo_parpadeo * room_speed)
    {
        if (sprite_index != spr_boss_closing_eye)
        {
            sprite_index = spr_boss_closing_eye;
        }
        else if ((sprite_index == spr_boss_closing_eye) && image_index == (image_number-1))
        {
            sprite_index = spr_boss_closed_eye;
            ojo_abierto = false;
            steps_desde_ultimo_parpadeo = 0;
        }
    }
}
if (!ojo_abierto) // Si su ojo NO está abierto...
{
    if (steps_desde_ultimo_parpadeo >= tiempo_parpadeo * room_speed)
    {
        if (sprite_index != spr_boss_opening_eye)
        {
            sprite_index = spr_boss_opening_eye;
        }
        else if ((sprite_index == spr_boss_opening_eye) && image_index == (image_number-1))
        {
            sprite_index = spr_boss_opened_eye;
            ojo_abierto = true;
            steps_desde_ultimo_parpadeo = 0;
            
            var obj_proyectil; // Declaramos una variable para asignarle un objeto proyectil
            var x_fix = -16; // Ajusta (en píxeles) de dónde sale el proyectil en x, para que salga del cañón y no del centro
            var y_fix = 32; // Ajusta (en píxeles) de dónde sale el proyectil en y
            var sep_proy = 24; // Separación vertical entre proyectiles
            var numero_de_disparos = 4;
            var disparo_no_lanzado = choose(0, 1, 2, 3);
            var i;
            for (i = 0; i < numero_de_disparos; i ++)
            {   
                if (disparo_no_lanzado == 1 || disparo_no_lanzado == 2)
                {
                    if (i != 1 && i!= 2)
                    {
                        obj_proyectil = instance_create(x-x_fix, y+y_fix-sep_proy*i, obj_boss_shot);
                    }
                }
                else if (i != disparo_no_lanzado)
                {
                    obj_proyectil = instance_create(x-x_fix, y+y_fix-sep_proy*i, obj_boss_shot);
                }
            }
            audio_play_sound(snd_player_shot, 10, false); // Se reproduce el sonido del disparo
        }
    }
}

steps_desde_ultimo_parpadeo ++;
