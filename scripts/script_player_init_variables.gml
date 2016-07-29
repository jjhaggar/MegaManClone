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
    saltando
    // Etc.
}
mi_estado_actual = ANIM_PERSONAJE.quieto;

// Inicializar a dónde mira el personaje
mira_a_dcha = true;

// Asignar velocidad a las animaciones del personaje (por defecto su valor es 1, más rápido)
image_speed = 0.5;

surface_resize(application_surface, display_get_width(), display_get_height());
