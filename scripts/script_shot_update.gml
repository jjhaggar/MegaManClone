/// Actualizaciones proyectil

var instancia_enemigo;
instancia_enemigo = instance_place(x, y, obj_enemy);
if instancia_enemigo != noone
{    
    instancia_enemigo.vida -= 1;
    instance_destroy();
}

x += vel_horiz_bala;

if (abs(posicion_inicial - x) > distancia_alcance)
{
    instance_destroy();
}
