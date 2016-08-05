/// Actualizaciones enemigo tipo A

if (vida <= 0) // Si el enemigo pierde toda la vida
{
    if (sprite_index != spr_enemy_death) // Si su aninación no es la de morir...
    {
        sprite_index = spr_enemy_death; // ... le asignamos la animación de morir
    }
    if (image_index == (image_number-1)) // Cuando acaba la animación de morir:
    {
        global.puntos += puntos; // Se suman sus puntos a los del jugador 
        instance_destroy(); // Se destruye la instancia del enemigo
    }    
}

if (mira_a_dcha) // Si mira a la derecha
{
    // Si no hay pared y seguimos pisando suelo al avanzar un tile (16 pix), se sigue moviendo a la derecha
    if ( !(place_meeting(x+1, y, obj_wall)) && (place_meeting(x+16, y + 1, obj_wall)) )
    {
        x += velocidad;
    }
    else // De lo contrario, se da la vuelta
    {
        mira_a_dcha = false;
        image_xscale = 1;
    }
}

if (!mira_a_dcha)
{
    // Si no hay pared y seguimos pisando suelo al avanzar un tile (16 pix), se sigue moviendo a la izquierda
    if ( !(place_meeting(x-1, y, obj_wall)) && (place_meeting(x-16, y + 1, obj_wall)) )
    {
        x -= velocidad;
    }
    else // De lo contrario, se da la vuelta
    {
        mira_a_dcha = true;
        image_xscale = -1;
    }
}



