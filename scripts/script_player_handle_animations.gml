
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
    
    case ANIM_PERSONAJE.disparando_quieto:
    {
        sprite_index = spr_player_shooting_idle;
    }; 
    break;
    
    case ANIM_PERSONAJE.disparando_andando:
    {
        sprite_index = spr_player_shooting_walk;
    }; 
    break;
    
    case ANIM_PERSONAJE.disparando_saltando:
    {
        sprite_index = spr_player_shooting_jump;
    }; 
    break;
    
    case ANIM_PERSONAJE.recibiendo_golpe:
    {
        sprite_index = spr_player_gethit;
    }; 
    break;
    
    case ANIM_PERSONAJE.muriendo:
    {
        sprite_index = spr_player_death;
    }; 
    break;
}

// Dependiendo de si se mueve el personaje horizontalmente, voltear sprite a un lado u otro
if (movimiento_horizontal != 0)
{
    image_xscale = movimiento_horizontal;
}

