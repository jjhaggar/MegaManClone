///Inicializar Variables

gravedad = 0.9;
vel_hor = 0; // Velocidad horizontal actual
vel_andar = 5; // Velocidad andar

vel_ver = 0; // Velocidad vertical actual
vel_salto = 12; // Velocidad salto
vel_max_caida = 10; // Velocidad máxima de caída

vida_maxima = 27; // Vida (energía) máxima del personaje
//vida = vida_maxima; // Inicializamos la vida (energía) del personaje al máximo

numero_maximo_vidas = 3; // Número de Vidas máximo del personaje
//numero_vidas = numero_maximo_vidas; // Inicializamos el nº de vidas al máximo

if (room == 0 ) // Si entramos en la primera fase
{
    global.puntos = 0; // Ponemos los puntos a 0
    global.numero_vidas = numero_maximo_vidas; // Inicializamos el nº de vidas al máximo
    global.vida = vida_maxima; // Inicializamos la vida (energía) del personaje al máximo
}

// Asignar velocidad a las animaciones del personaje (por defecto su valor es 1, más rápido)
image_speed = 0.5;

// Implementar máquina de estados de animaciones e inicializar animacion_personaje
enum ANIM_PERSONAJE
{
    quieto,
    andando,
    saltando,
    disparando_quieto,
    disparando_andando,
    disparando_saltando,
    recibiendo_golpe,
    muriendo
    // Etc.
}
mi_estado_actual = ANIM_PERSONAJE.quieto;

// Inicializar hacia dónde mira el personaje
mira_a_dcha = true;

// Controlar la velocidad del disparo
vel_proyectil = 10;
momento_inicio_disparo = current_time;
momento_actual  = current_time;
tiempo_disparando = 200; //steps
personaje_esta_disparando = false;

// Control del jugador sobre el personaje
personaje_controlable = true;

// Vulnerabilidad del personaje a los enemigos, y tiempos de invulnerabilidad.
personaje_vulnerable = true;
invulnerabilidad_tras_impacto = 15;
invulnerabilidad_tras_muerte = 30;
