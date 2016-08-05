/// Actualizaciones enemigo tipo B

vida = 2; // Vida del enemigo
danyo = 3;// Daño que hace el enemigo
puntos = 200; // Puntos que da el enemigo al ser derrotado

distancia_vuelo = 100; // Distancia en y que recorre el enemigo
velocidad_vuelo = 3; // Velocidad mientras vuela
subiendo = true; // ¿Está subiendo el enemigo?
y_inicial = y; // Altura inicial de recorrido 
y_final = y_inicial - distancia_vuelo; // Altura de fin de recorrido 

enemigo_activo = false; // El enemigo está desactivado (quieto) antes de acercarnos
distancia_activacion = 200; // ¿Enemigo activado (moviéndose)?

image_speed = 0.5; // Velocidad de animación del sprite del enemigo
