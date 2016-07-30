x += vel_horiz_bala;

if (abs(posicion_inicial - x) > distancia_alcance){
instance_destroy();
}
