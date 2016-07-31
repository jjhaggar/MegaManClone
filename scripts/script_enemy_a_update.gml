/// Actualizaciones enemigo tipo A

if (vida <= 0)
{
    if (sprite_index != spr_enemy_death)
    {
        sprite_index = spr_enemy_death;
    }

    if (image_index == (image_number-1))
    {
        obj_player.puntos += puntos;
        instance_destroy();
    }    
}

if (mira_a_dcha)
{
    // Si no hay pared y seguimos pisando suelo al avanzar un tile (16 pix)
    if ( !(place_meeting(x+1, y, obj_wall)) && (place_meeting(x+16, y + 1, obj_wall)) )
    {
        x += velocidad;
    }
    else 
    {
        mira_a_dcha = false;
        image_xscale = 1;
    }
}

if (!mira_a_dcha)
{
    // Si no hay pared y seguimos pisando suelo al avanzar un tile (16 pix)
    if ( !(place_meeting(x-1, y, obj_wall)) && (place_meeting(x-16, y + 1, obj_wall)) )
    {
        x -= velocidad;
    }
    else 
    {
        mira_a_dcha = true;
        image_xscale = -1;
    }
}



