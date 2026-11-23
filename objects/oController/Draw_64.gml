/// @Description DRAW GUI HUD E TELA DE RESULTADOS
draw_set_color(c_white);

if (instance_exists(oPlayer)) {

    switch(stateGame){
        case "running":         // HUD
            var _hp = oPlayer.hp;
            var _hpMax = oPlayer.durability.currentValue;
            var _barSize = 100;
            var _porcent = 0;

            if (_hpMax > 0) {
                // dividir o tamanho total da vida em 10, e fazer com q o tamanho dela seja proporcional a vida atual
                _porcent = clamp(_hp / _hpMax, 0, 1);
            }

            // tamanho preenchido
            var _hpWidth = _barSize * _porcent;

            draw_set_color(c_black);
            draw_rectangle(100, 100, 100 + _barSize, 120, false);

            // TROCANDO DE COR BASEADO NA QUANTIA DE SOBRA
            if (_porcent > 0.5) {
                draw_set_color(c_lime);   // Acima de 50% (0.5): Verde
            } else if (_porcent > 0.25) {
                draw_set_color(c_yellow); // Entre 25% (0.25) e 50% (0.5): Amarelo
            } else {
                draw_set_color(c_red);    // Abaixo de 25% (0.25): Vermelho
            }
            draw_rectangle(100, 100, 100 + _hpWidth, 120, false);
            
            draw_set_color(c_white);
            draw_sprite_ext(sBioCoin, image_index, 100, 130, 2, 2, 0, c_white, 1);
            draw_text_transformed(130, 150, global.bio_collected, 2, 2, 0);
            //draw_sprite_ext(sOxigenio, image_index, 200, 13, 1, 1, 0, c_white, 1);
            draw_text_transformed(100, 180, "Ox: " + string(oPlayer.qOxygen), 2, 2, 0);
        break;

        case "paused":
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, "PAUSED");

            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
        break;
        
        case "returning":
            boxResults();
        break;
        
        case "destroyed":
            boxResults();
        break;
    }
    
    // PAUSE
}

// FUNÇÃO PARA DESENHAR BOX DE RESULTADOS
function boxResults() {
    var p = 45; // Espaçamento entre elementos (aumentado para caber texto 2x)

    // VARIÁVEIS DE TELA
    var _wScreen = display_get_gui_width();
    var _hScreen = display_get_gui_height();
    
    // DIMENSÕES DO RETÂNGULO PRINCIPAL
    var _w = _wScreen * 0.4;
    var _h = _hScreen * 0.6;
        
    // COORDENADAS PARA CENTRALIZAR
    var _x1 = (_wScreen - _w) / 2;
    var _y1 = (_hScreen - _h) / 2;
    var _x2 = _x1 + _w;
    var _y2 = _y1 + _h;
        
    // Fundo laranja semitransparente
    draw_set_alpha(0.8);
    draw_set_colour(c_orange);
    draw_rectangle(_x1, _y1, _x2, _y2, false);

    // Configurações de texto
    draw_set_alpha(1);
    draw_set_halign(fa_center); 
    draw_set_valign(fa_middle); // Centraliza verticalmente também (ajuda nos botões)
    draw_set_font(-1);          
    draw_set_color(c_black);    
    
    var _centerX = _x1 + (_w / 2);
    
    // Desenho dos Textos
    draw_text_transformed(_centerX, _y1 + (p * 1), "RETORNO À SUPERFÍCIE!", 2.2, 2.2, 0);
    draw_text_transformed(_centerX, _y1 + (p * 2), "Status: " + string(global.return_reason), 1.8, 1.8, 0);
    draw_text_transformed(_centerX, _y1 + (p * 3), "Coletado na Run: $" + string(global.bio_collected), 1.8, 1.8, 0);
    draw_text_transformed(_centerX, _y1 + (p * 4), "Total Ganho (com taxas): $" + string(bio_current), 1.8, 1.8, 0);

    // ==========================================
    // CONFIGURAÇÃO E DESENHO DOS BOTÕES
    // ==========================================
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    var _click = mouse_check_button_pressed(mb_left);

    var _btnW = _w * 0.6;  // Largura do botão (60% da caixa)
    var _btnH = 45;        // Altura do botão
    var _btnX1 = _centerX - (_btnW / 2);
    var _btnX2 = _centerX + (_btnW / 2);

    // --- BOTÃO 1: REINICIAR ---
    var _btn1Y1 = _y1 + (p * 5.2);
    var _btn1Y2 = _btn1Y1 + _btnH;
    var _hover1 = point_in_rectangle(_mx, _my, _btnX1, _btn1Y1, _btnX2, _btn1Y2);

    // Muda de cor se o mouse passar por cima
    draw_set_color(_hover1 ? c_dkgray : c_black);
    draw_rectangle(_btnX1, _btn1Y1, _btnX2, _btn1Y2, false);

    draw_set_color(c_white);
    draw_text_transformed(_centerX, _btn1Y1 + (_btnH / 2), "JOGAR NOVAMENTE", 1.8, 1.8, 0);

    if (_hover1 && _click) {
        room_restart();
    }

    // --- BOTÃO 2: MENU INICIAL ---
    var _btn2Y1 = _btn1Y2 + 15; // 15px abaixo do botão 1
    var _btn2Y2 = _btn2Y1 + _btnH;
    var _hover2 = point_in_rectangle(_mx, _my, _btnX1, _btn2Y1, _btnX2, _btn2Y2);

    draw_set_color(_hover2 ? c_dkgray : c_black);
    draw_rectangle(_btnX1, _btn2Y1, _btnX2, _btn2Y2, false);

    draw_set_color(c_white);
    draw_text_transformed(_centerX, _btn2Y1 + (_btnH / 2), "MENU INICIAL", 1.8, 1.8, 0);

    if (_hover2 && _click) {
        room_goto(rStartMenu); // <-- TROQUE PELO NOME DA SUA ROOM DE MENU
    }

    // Reseta alinhamentos e cores padrão
    draw_set_halign(fa_left); 
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}

/*
function startMenu() {
    var _lenght_menu = array
}
*/