// Calculando a porcentagem (supondo que hp_max seja 10)
var _porcentagem = (hp / 10) * 100;

draw_healthbar(50, 20, 200, 40, _porcentagem, c_black, c_red, c_green, 0, true, true);

// 1. Configurações de Texto (Opcional, para deixar bonito)
draw_set_font(-1);          // Usa a fonte padrão do GameMaker (ou coloque a sua aqui)
draw_set_color(c_white);    // Cor do texto
draw_set_valign(fa_top);    // Alinhamento vertical no topo
draw_set_halign(fa_left);   // Alinhamento horizontal à esquerda

// 2. Definir a posição inicial na tela (Margem de 20 pixels do canto superior esquerdo)
var _posX = 50;
var _posY = 40;
    
// 3. Desenhar o Ícone da Moeda
// Parâmetros: (sprite, imagem_index, x, y)
draw_sprite(sBioCoin, 0, _posX, _posY);
    
// 4. Desenhar o Valor ao Lado
// Descobrimos a largura do sprite para o texto não ficar em cima da imagem
var _sprite_width = sprite_get_width(sBioCoin);
    
// Damos um espaçamento extra de 8 pixels após o ícone
var _text_posX = _posX + _sprite_width + 8; 
    
// Centralizamos levemente o texto na altura do ícone (ajuste o +4 se necessário)
var _text_posY = _posY + 8; 
    
// Desenha o texto transformando o valor numérico em String (Texto)
draw_text(_text_posX, _text_posY, string(global.bio_collected));

