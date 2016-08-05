/// Actualizaciones enemigo tipo B

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

if instance_exists (obj_player) // Si existe el objeto obj_player...
{
    if (distance_to_object(obj_player) < distancia_activacion) // ... y está dentro de la distancia de activación...
    {
        enemigo_activo = true; // ... se activa el enemigo.
    }
}

if (enemigo_activo) // Si el enemigo está activo...
{
    if (subiendo) // Si está subiendo...
    {
        if (y >= y_final) // Si está más abajo de la y_final...
        {
            y -= velocidad_vuelo; // Sigue subiendo
        }
        else  // De lo contrario, si está más arriba de la y_final...
        {
            subiendo = false; // ... deja de subir
        }
    }
    if (!subiendo) // Si NO está subiendo...
    {
        if (y <= y_inicial) // Si está más abajo de la y_inicial...
        {
            y += velocidad_vuelo; // Sigue bajando
        }
        else // De lo contrario, si está más abajo de la y_inicial...
        {
            subiendo = true; // ... empiezaa subir
        }
    }
}
