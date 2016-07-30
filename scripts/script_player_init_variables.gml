///Inicializar Variables

gravedad = 0.9;
vel_hor = 0; // Velocidad horizontal actual
vel_andar = 5; // Velocidad andar

vel_ver = 0; // Velocidad vertical actual
vel_salto = 12; // Velocidad salto
vel_max_caida = 10; // Velocidad máxima de caída


// Implementar máquina de estados e inicializar mi_estado_actual
enum ANIM_PERSONAJE
{
    quieto,
    andando,
    saltando,
    disparando_quieto,
    disparando_andando,
    disparando_saltando
    // Etc.
}
mi_estado_actual = ANIM_PERSONAJE.quieto;

// Inicializar a dónde mira el personaje
mira_a_dcha = true;

// Controlar la velocidad del disparo
vel_proyectil = 10;
momento_inicio_disparo = current_time;
momento_actual  = current_time;
tiempo_disparando = 200; //steps
personaje_esta_disparando = false;

// Asignar velocidad a las animaciones del personaje (por defecto su valor es 1, más rápido)
image_speed = 0.5;


