/// Graphical User Interface update

draw_sprite(spr_hud_player_base, 0, x, y);


var separacion_health_marks = 2;

var vida;
if (instance_exists(obj_player)) 
{ 
    vida = obj_player.vida; 
}
else
{
    vida = 0;
}

var i;
for (i = 0; i < vida; i ++)
{
   draw_sprite(spr_hud_player_health_mark, 0, x, y - i * separacion_health_marks);
}

