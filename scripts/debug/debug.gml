// --- CÓDIGO TEMPORÁRIO DE DEBUG ---
if (keyboard_check(vk_anykey)) {
    show_debug_message("=== TESTE DE INPUT ===");
    show_debug_message("Apertando algo! X Input: " + string(_xInput) + " | Y Input: " + string(_yInput));
}

    
/*
////////////////////////
// HUD FUNCIONAL
>> BARRA DE DURABILIDADE DO SUBMARINO
    var _hp = oPlayer.hp;
    var _hpMax = oPlayer.durability.currentValue;
    var _barSize = 100;

    // dividir o tamanho total da vida em 10, e fazer com q o tamanho dela seja proporcional a vida atual
    var _porcent = clamp(_hp / _hpMax, 0, 1);

    // tamanho preenchido
    var _hpWidth = _barSize * _porcent;


>> EVENT DRAW GUI
draw_retangule(100, 100, 100 + _hpWidth, 120, false);
draw_sprite(sVida_idle);

//////////////
// TELA FULL SCREEN 
>> EVENTO STEP OCONTROLER
