// --- CÓDIGO TEMPORÁRIO DE DEBUG ---
if (keyboard_check(vk_anykey)) {
    show_debug_message("=== TESTE DE INPUT ===");
    show_debug_message("Apertando algo! X Input: " + string(_xInput) + " | Y Input: " + string(_yInput));
}

// OBJETIVOS A FAZER
- Deixar janela full screen

// criar lógica dos botões (código puro ou estrutura obj)
>> EVENTO MOUSE ENTRAR: 
    image_scale = 1.3;
    image_index = 1;

>> EVENTO MOUSE SAIR: 
    image_scale = 1;
    image_index = 0;

// criar variaveis para identificar o upgrade a ser feito
>> EVENTO CREATE BOTÃO
    idUpgrade = noone;          // index do upgrade
    nameUpgrade = noone;        // nome do upgrade sendo criado
    lvlMaxUpgrade = noone;      // Nivél maximo que o upgrade pode chegar   
    multiUpgrade = noone;       // Quantia acrescentada por porcentagem% no status

    stateUpgrade = noone;      // status que o upgrade irá alterar

    // adicionando upgrade na lista de modificadores do status
    array_push(oPlayer.stateUpgrade.upgradesList[idUpgrade], 
        new Upgrade(idUpgrade, nameUpgrade, lvlMaxUpgrade, multiUpgrade)
    );

>> EVENTO SE O BOTÃO FOR CLICADO
    make_upgrade(idUpgrade);
    

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
    if (keyboard_check(vk_f11)) {
    window_set_fullscreen(!window_get_fullscreen());
    }

    if (keyboard_check(vk_scape)) {
        game_end();
    }