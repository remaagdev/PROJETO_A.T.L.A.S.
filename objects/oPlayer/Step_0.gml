// Inputs para identificar a direçao em que o player quer se locomover
// outputs = 1, 0, -1
var _xInput = keyboard_check(ord("D"))  - keyboard_check(ord("A"));
var _yInput = keyboard_check(ord("S"))  - keyboard_check(ord("W"));

// veriica sinal do xinput para espelhamento correto
if (_xInput != 0) {
	image_xscale = sign(_xInput);	
}

// verifica se ha movimento
if (_xInput != 0 || _yInput != 0) {
	// verifica o angulo do movimento
	var _dir = point_direction(0, 0, _xInput, _yInput);
	
	// O lengthdir garante que o "comprimento" do vetor seja sempre igual à velocidade
	wSpd = lengthdir_x(velocity.currentValue, _dir);
	hSpd = lengthdir_y(velocity.currentValue, _dir);
	
	// troca a sprite do submarino para a de movimento
	sprite_index = spr_walk;
	
} else { // Caso NAO haja movimento
	wSpd = 0;
	hSpd = 0;
	
		// troca a sprite do submarino para parada
	sprite_index = spr_idle;
}

// verifica direção para espelhar a sprite corretamente no eixo Xs
if (_xInput != 0) {
	image_xscale = sign(_xInput); // retorna sinal
}

// aplica colisão horizontal contra objetos oCharachter
if (place_meeting(x + wSpd, y, oBlock)) {
	// Ao esbarrar nas paredes, recebe dano
	apply_damage(colisionDamage.currentValue, id);
	
	// enquanto NÂO houver parede a 1 pxl de distancia na diração
	while (!place_meeting(x + sign(wSpd), y, oBlock)){
		x += sign(wSpd);
	}
	wSpd = 0;
}

// aplica o movimento ao personagem
x += wSpd;

// aplica colisão vertical contra objetos oCharachter
if (place_meeting(x, y + hSpd, oBlock)) {
	// Ao esbarrar nas paredes, recebe dano
	apply_damage(colisionDamage.currentValue, id);
	
	// enquanto NÂO houver parede a 1 pxl de distancia na diração
	while (!place_meeting(x, y + sign(hSpd), oBlock)){
		y += sign(hSpd);
	}
	hSpd = 0;
}

// aplica o movimento ao personagem
y += hSpd;

/////////////////////////////////////////////// calculo de hp e oxigenio ///////////////////////////////////////////////////////////////////


