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
    make_upgrade (idUpgrade);
    
