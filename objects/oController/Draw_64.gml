// PRIMEIRA LINHA DO DRAW GUI (ANTES DO IF)
show_debug_message("--- DRAW GUI EXECUTANDO AGORA! ---");
if (room == rResults) {
    // 1. Força a opacidade em 1 (se algum script deixou em 0, nada aparece)
    draw_set_alpha(1);
    
    // 2. QUADRADO DE TESTE: Desenha um bloco vermelho no topo esquerdo (X:0, Y:0)
    // Se esse quadrado NÃO aparecer, o evento Draw GUI não está sendo executado de forma alguma!
    draw_rectangle_color(0, 0, 150, 150, c_red, c_red, c_red, c_red, false);

    // 3. Alinhamento e Cor
    draw_set_halign(fa_center); 
    draw_set_font(-1);          
    draw_set_color(c_white);    
    
    // 4. CORREÇÃO DA COORDENADA: Pega o centro real da sua tela física, não da Room
    var _centro_tela = display_get_gui_width() / 2;
    
    // 5. Desenho do Texto
    draw_text(_centro_tela, 100, "RETORNO À SUPERFÍCIE!");
    draw_text(_centro_tela, 150, "Status: " + string(global.return_reason));
    draw_text(_centro_tela, 200, "Coletado na Run: $" + string(global.bio_collected));
    draw_text(_centro_tela, 250, "Total Ganho (com taxas): $" + string(bio_current));
    
    // Reseta o alinhamento para não quebrar outros textos do jogo
    draw_set_halign(fa_left); 
}