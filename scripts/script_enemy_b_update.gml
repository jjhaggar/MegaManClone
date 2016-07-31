/// Actualizaciones enemigo tipo B

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

if instance_exists (obj_player)
{
    if distance_to_object(obj_player) < 200
    {
        enemigo_activo = true;
    }
}

if (enemigo_activo)
{
    if (subiendo)
    {
        if (y >= y_final)
        {
            y -= velocidad_vuelo;
        }
        else 
        {
            subiendo = false;
        }
    }
    if (!subiendo)
    {
        if (y <= y_inicial)
        {
            y += velocidad_vuelo;
        }
        else 
        {
            subiendo = true;
        }
    }
}
