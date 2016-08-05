/// Graphical User Interface update

draw_sprite(spr_hud_player_base, 0, x, y); // Se dibuja el sprite base del HUD

// Declaramos variables necesarias
var separacion_health_marks = 2;
var vida;
var num_vidas;
var puntos;

if (instance_exists(obj_player)) // Si hay una instancia del obj_player cargamos las variables
{ 
    vida = global.vida; 
    num_vidas = global.numero_vidas;
    puntos = global.puntos;
}
else // Si no, les asignamos el valor 0
{
    vida = 0;
    num_vidas = 0;
    puntos = 0;
}

// Se dibujan las marcas de la vida (energía) sobre la base del HUD
var i;
for (i = 0; i < vida; i ++)
{
   draw_sprite(spr_hud_player_health_mark, 0, x, y - i * separacion_health_marks);
}

// Escribir las vidas en el HUD
draw_text(x+24, y+8, "x" + string(num_vidas));

// Escribir los puntos en HUD
var cadena = string_format(puntos, 6, 0); // Se formatean los puntos con 6 dígitos, rellenando con espacios si es necesario
cadena = string_replace_all(cadena, ' ', '0'); // Se reemplazan los espacios de la cadena con ceros
draw_text(x+192, y+8, cadena); // Se escribe la cadena final resultante en el hud
// Lo anterior también se puede escribir resumido así:
// draw_text(x+192, y+8, string_replace_all(string_format(puntos, 6, 0), ' ', '0')); 

