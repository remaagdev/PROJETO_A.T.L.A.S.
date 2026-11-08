/// @Description DRAW GUI HUD E TELA DE RESULTADOS

// VÁRIAVEIS
var _state = oPlayer.stateCurrent;
var _wScreen = display_get_gui_width();
var _hScreen = display_get_gui_height();

// DIMENSÕES DO RETANGULO
var _w = _wScreen * .5;
var _h = _hScreen * .4;
	
// CORDENADAS PARA CENTRALIZAR
var _x1 = (_wScreen - _w) / 2;
var _y1 = (_hScreen - _h) / 2;
var _x2 = _x1 + _w;
var _y2 = _y1 + _h;
	

draw_set_colour(c_orange);
//draw_rectangle(_x1, _y1, _x2, _y2, false);
	
// RESULTADOS
if (_state == "dead"){

	// Criar retangulo  sobre tela de jogo, sem hud
	draw_set_alpha(1);
	draw_set_colour(c_orange);
	draw_rectangle(_x1, _y1, _x2, _y2, false);
}

// HUD

// PAUSE

if (room == rResults) {
    // Força a opacidade em 1 (se algum script deixou em 0, nada aparece)
    draw_set_alpha(1);

    // Alinhamento e Cor
    draw_set_halign(fa_center); 
    draw_set_font(-1);          
    draw_set_color(c_white);    
    
    // Pega o centro real da sua tela física, não da Room
    var _centro_tela = _hScreen / 2;
    
    // Desenho do Texto
    draw_text(_centro_tela, 100, "RETORNO À SUPERFÍCIE!");
    draw_text(_centro_tela, 150, "Status: " + string(global.return_reason));
    draw_text(_centro_tela, 200, "Coletado na Run: $" + string(global.bio_collected));
    draw_text(_centro_tela, 250, "Total Ganho (com taxas): $" + string(bio_current));
    
    // Reseta o alinhamento para não quebrar outros textos do jogo
    draw_set_halign(fa_left); 
}