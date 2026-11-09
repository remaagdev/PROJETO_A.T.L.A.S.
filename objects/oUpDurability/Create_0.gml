// Inherit the parent event
event_inherited();

    idUpgrade = 0;          // index do upgrade
    nameUpgrade = "Durability I";        // nome do upgrade sendo criado
    lvlMaxUpgrade = "10";      // Nivél maximo que o upgrade pode chegar   
    multiUpgrade = 0.1;       // Quantia acrescentada por porcentagem% no status

    stateUpgrade = noone;       // status que o upgrade irá alterar
    alarm[0] = 2;               // Deley para garantir que o oPlayer já esteja criado
//  INSERIR NO ALARM[0]   stateUpgrade = oPlayer.hp;