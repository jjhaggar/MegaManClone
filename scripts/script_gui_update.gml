/// Graphical User Interface update

draw_sprite(spr_hud_player_base, 0, x, y);

var separacion_health_marks = 2;

var vida;
if (instance_exists(obj_player)) 
{ 
    vida = obj_player.vida; 
    num_vidas = obj_player.numero_vidas;
    puntos = obj_player.puntos;
}
else
{
    vida = 0;
    num_vidas = 0;
    puntos = 0;
}

// Mostrar vida en barra de vida
var i;
for (i = 0; i < vida; i ++)
{
   draw_sprite(spr_hud_player_health_mark, 0, x, y - i * separacion_health_marks);
}

// Escribir vidas en HUD
draw_text(x+24, y+8, "x" + string(num_vidas));

// Escribir puntos en HUD
var cadena = string_format(puntos, 6, 0);
cadena = string_replace_all(cadena, ' ', '0');
draw_text(x+192, y+8, cadena); 
// Lo anterior se puede escribir así:
// draw_text(x+192, y+8, string_replace_all(string_format(puntos, 6, 0), ' ', '0')); 

