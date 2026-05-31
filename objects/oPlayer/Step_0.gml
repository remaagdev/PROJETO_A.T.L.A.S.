
// -----------------------// -----------------------
//				MOVIMENTO E COLISÃO
// -----------------------// -----------------------
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

// -----------------------// -----------------------
//						DISPAROS
// -----------------------// -----------------------
var _shoot_click = mouse_check_button_pressed(mb_left);															// Detecta o click do mouse

// Verifica se o player clicou e se pode atirar para realizar os disparos
if (_shoot_click && can_shooting) {
	can_shooting = false;
	
	qBullet = bulletFire.currentValue;																								// Pega inamicamente a quantia de balas
	var _tiro = instance_create_layer(x, y, "Instances", oBullet);														// Cria a instancia do tiro
	var _dir = point_direction(x + 16, y, mouse_x, mouse_y);															// Direção do mouse 
	
	with(_tiro) {
		direction = _dir;
		speed = 10;
		image_angle = _dir;
	}
	
	qBullet--;																																					// Diminui quantia de tiros que possui
	
	// CHECAGEM DE CONTINUIDADE
	if (qBullet> 0) {
		// Converte o tempo de cadencia em frames
		alarm[1] = cadencyFire.currentValue * game_get_speed(gamespeed_fps);
	} else {
		alarm[2] = coldownFire.currentValue * game_get_speed(gamespeed_fps);
	}
}













