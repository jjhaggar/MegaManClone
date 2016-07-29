
// Dependiendo del estado actual se muestra una animación u otra
switch (mi_estado_actual)
{
    case ANIM_PERSONAJE.quieto:
    {
        sprite_index = spr_player_idle; 
    }; 
    break;

    case ANIM_PERSONAJE.andando:
    {
        sprite_index = spr_player_walk;
    }; 
    break;
    
    case ANIM_PERSONAJE.saltando:
    {
        sprite_index = spr_player_jump;
    }; 
    break;
}

// Dependiendo de si se mueve el personaje horizontalmente, voltear sprite a un lado u otro
if (movimiento_horizontal != 0)
{
    image_xscale = movimiento_horizontal;
}

