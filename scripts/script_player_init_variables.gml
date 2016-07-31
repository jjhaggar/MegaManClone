///Inicializar Variables

gravedad = 0.9;
vel_hor = 0; // Velocidad horizontal actual
vel_andar = 5; // Velocidad andar

vel_ver = 0; // Velocidad vertical actual
vel_salto = 12; // Velocidad salto
vel_max_caida = 10; // Velocidad máxima de caída

vida_maxima = 27
vida = vida_maxima;

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


// Vulnerabilidad del personaje a los enemigos etc
personaje_vulnerable = true;
tiempo_invulnerable = 30; //steps
tiempo_invulnerable_actual = 0;
personaje_muerto = false;
