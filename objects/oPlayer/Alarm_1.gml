/// @description Cadencia de Disparo
var _tiro = instance_create_layer(x, y, "Instances", oBullet);														// Cria a instancia do tiro
var _dir = point_direction(x + 16, y, mouse_x, mouse_y);															// Direção do mouse 
	
with(_tiro) {
	direction = _dir;
	speed = 10;
	image_angle = _dir;
}
	
qBullet--;																																					// Diminui quantia de tiros que possui
	
// CHECAGEM DE CONTINUIDADE
if (qBullet > 0) {
	// Converte o tempo de cadencia em frames
	alarm[1] = cadencyFire.currentValue * game_get_speed(gamespeed_fps);
} else {
	alarm[2] = coldownFire.currentValue * game_get_speed(gamespeed_fps);
}



