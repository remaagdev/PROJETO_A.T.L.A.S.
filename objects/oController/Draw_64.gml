/// @Description DRAW GUI HUD E TELA DE RESULTADOS
if (instance_exists(oPlayer)) {
    var _state = oPlayer.stateCurrent;

    switch(_state){
        case "returning":
            boxResults();
            break;
        
        case "destroyed":
            boxResults();
            break;
    }
    
    // HUD
    
    // PAUSE
}

// FUNÇÃO PARA DESENHAR BOX DE RESULTADOS
function boxResults() {
    var m = 20;         // Margem das bordas
    var p = 30;         // Espaçamento entre elementos

        // VÁRIAVEIS
    var _state = oPlayer.stateCurrent;
    var _wScreen = display_get_gui_width();
    var _hScreen = display_get_gui_height();
    
    // DIMENSÕES DO RETANGULO
    var _w = _wScreen * .4;
    var _h = _hScreen * .6;
    	
    // CORDENADAS PARA CENTRALIZAR
    var _x1 = (_wScreen - _w) / 2;
    var _y1 = (_hScreen - _h) / 2;
    var _x2 = _x1 + _w;
    var _y2 = _y1 + _h;
    	
    // Força a opacidade em 1 (se algum script deixou em 0, nada aparece)
    draw_set_alpha(1);

    // Criar retangulo  sobre tela de jogo, sem hud
    draw_set_colour(c_orange);
    draw_rectangle(_x1, _y1, _x2, _y2, false);

    // Alinhamento e Cor do texto
    draw_set_halign(fa_center); 
    draw_set_font(-1);          
    draw_set_color(c_black);    
    
    // centralizando
    var _centerX = _x1 + (_w / 2);
    // Desenho do Texto
    draw_text(_centerX, _y1 + (p * 1), "RETORNO À SUPERFÍCIE!");
    draw_text(_centerX, _y1 + (p * 2), "Status: " + string(global.return_reason));
    draw_text(_centerX, _y1 + (p * 3), "Coletado na Run: $" + string(global.bio_collected));
    draw_text(_centerX, _y1 + (p * 4), "Total Ganho (com taxas): $" + string(bio_current));
    
    // Reseta o alinhamento para não quebrar outros textos do jogo
    draw_set_halign(fa_left); 
}