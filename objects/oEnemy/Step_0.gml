// CRIANDO IA BASICA DE MOVIMENTO
if (!player_detected && can_move){
    move_time--;
    
    if (move_time <= 0){
        move_time = irandom_range(60, 120); // de 1 a 2 segundos em uma direção
        move_dir = irandom_range(-1, 1);    // -1 esquerda, 0 parado, 1 direita
    }

    if (move_dir != 0) {
        x += move_dir * (velocity * .6); // Se move devagar enquanto n está em perseguição
    }
}

// AO DETECTAR PLAYER PROXIMO, COMEÇA A SE MOVER EM SUA DIREÇÃO
if (instance_exists(oPlayer)) {
    var _distance_player = distance_to_object(oPlayer);
    
    if (_distance_player <= range_detected) { 
        player_detected = true; 
    } else {
        player_detected = false;
    }
    
    if (player_detected){
        // DESCOBRE DIREÇÃO ATÉ O PLAYER
        var _dir = point_direction(x, y, oPlayer.x, oPlayer.y);
        
        // SE MOVE EM DIREÇÃO AO PLAYER COM VETORES NORMALIZADOS
        x += lengthdir_x(velocity, _dir);
        y += lengthdir_y(velocity, _dir);
        
        // TROCA DIREÇÃO DA IMAGEM APATIR DA DIFERENÇA ENTRE A POSIÇÃO DO INIMIGO E DO PLAYER
        if (oPlayer.x != x) {
            image_xscale = sign(oPlayer.x -x);
        }
    }
}

// criar variavel que checa veracidade, quando n for mais verdade volta comportamento normal

// checar colisão para dar dano no submarino
var _player_colision = instance_place(x, y, oPlayer);
// Aplicando dano caso haja colisão
if (_player_colision != noone) {
    //aplica ao colidir com submarino
    apply_damage(damage, oPlayer);
}


if (hp <=  0){
	can_move = false;
    sprite_index = spr_dead;
		
    if (image_index >= image_number - 1){
        image_index = image_number - 1;
        image_speed = 0;	
        instance_destroy();	
    }
}

