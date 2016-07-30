/// Actualizaciones enemigo tipo B

if (vida <= 0)
{
    if (sprite_index != spr_enemy_death)
    {
        sprite_index = spr_enemy_death;
    }

    if (image_index == (image_number-1))
    {
        instance_destroy();
    }    
}

