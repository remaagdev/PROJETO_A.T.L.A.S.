function colisionBlock(_wSpd, _hSpd, _player, _colisionDamage){
// aplica colisão horizontal contra objetos oCharachter
if (place_meeting(x + _wSpd, y, [oBlock, global.tile_colision])) {
	// Ao esbarrar nas paredes, recebe dano
    if (_player){
        apply_damage(_colisionDamage, id);
    }
	
	// enquanto NÂO houver parede a 1 pxl de distancia na diração
	while (!place_meeting(x + sign(_wSpd), y, [oBlock, global.tile_colision])){
		x += sign(_wSpd);
	}
	_wSpd = 0;
}

// aplica o movimento ao personagem
x += _wSpd;

// aplica colisão vertical contra objetos oCharachter
if (place_meeting(x, y + _hSpd, [oBlock, global.tile_colision])) {
	// Ao esbarrar nas paredes, recebe dano 
    if (_player){
        apply_damage(_colisionDamage, id);
    }
	
	// enquanto NÂO houver parede a 1 pxl de distancia na diração
	while (!place_meeting(x, y + sign(_hSpd), [oBlock, global.tile_colision])){
		y += sign(_hSpd);
	}
	_hSpd = 0;
}

// aplica o movimento ao personagem
y += _hSpd;
}