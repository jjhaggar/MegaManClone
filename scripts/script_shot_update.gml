/// Actualizaciones proyectil

// El proyectil va coprobando si colisiona con un objeto de la superclase obj_enemy
// Esta superclase engloba a obj_enemy_a y a obj_enemy_b, así nos ahorramos comparaciones
var instancia_enemigo = instance_place(x, y, obj_enemy);


if instancia_enemigo != noone // Si existe una instancia de enemigo que colisione:
{    
    instancia_enemigo.vida -= 1; // Se le resta 1 a la vida del enemigo
    audio_play_sound(snd_enemy_damage, 10, false); // Se escucha el sonido de daño
    instance_destroy(); // Se destruye el proyectil
}

x += vel_horiz_bala; // El proyectil se desplaza en "x" a su velocidad horizontal

if (abs(posicion_inicial - x) > distancia_alcance) // Si la bala se aleja hasta su distancia de alcance:
{
    instance_destroy(); // Se destruye el proyectil
}
