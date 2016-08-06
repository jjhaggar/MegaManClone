/// Dibujar Menu

// Para dibujar las letras con "draw_text(x, y, txt)" debemos estar en un evento "draw"

for (i = 0; i < array_length_1d(menuText); i++)
{
    if (menuSelected = i) { draw_set_color(c_yellow); } else { draw_set_color(c_white); }
    draw_text(x_main_menu, y_main_menu + i*16, menuText[i]);
}

