/// Actualizaciones proyectil

x += vel_horiz_bala; // El proyectil se desplaza en "x" a su velocidad horizontal

if (abs(posicion_inicial - x) > distancia_alcance) // Si la bala se aleja hasta su distancia de alcance:
{
    instance_destroy(); // Se destruye el proyectil
}
