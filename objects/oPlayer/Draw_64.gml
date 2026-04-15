// Calculando a porcentagem (supondo que hp_max seja 10)
var _porcentagem = (hp_current / 10) * 100;

draw_healthbar(50, 20, 200, 40, _porcentagem, c_black, c_red, c_green, 0, true, true);