/// Player Input


// Recoger el input de teclado del jugador en 3 variables. El método keyboard_check(tecla) devuelve 1 ó 0 ------------------------------------
tecla_derecha = keyboard_check(vk_right);
tecla_izquierda = -keyboard_check(vk_left);



//Reaccionar al input del teclado ------------------------------------------------------------------------------------------------------------

// Pulsar derecha e izquierda:
movimiento_horizontal = tecla_izquierda + tecla_derecha; // Si se pulsan izq y dcha a la vez, el movimiento horizontal sería 0...
vel_hor = movimiento_horizontal * vel_andar; // ... pero en caso contrario, la vel_andar se multiplicaría por +1 ó -1.



// Colisiones Horizontales --------------------------------------------------------------------------------------------------------------------
if (place_meeting(x+vel_hor, y, obj_wall)) // Si la "x+vel_horiz" y la "y" del pers coinciden con la pos de un obj_wall...
{
    while(!place_meeting(x+sign(vel_hor), y, obj_wall)) // ... mientras el personaje no esté a 1 píxel de colisionar...
    {
        x += sign(vel_hor); // ... se le suma o resta uno a su posición en "x".
    }
    vel_hor = 0; // ... y asignamos 0 a la velocidad horizontal.
}
x += vel_hor; // Tanto si se entra en el "if" como si no, se le suma la velocidad_horizontal a la "x" (si entramos en el "if", se le sumará 0)
 

