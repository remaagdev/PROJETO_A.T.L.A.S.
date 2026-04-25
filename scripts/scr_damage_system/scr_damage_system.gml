function apply_damage(_amount, _object){
	// se j´a estiver invencivel, ignora o dano
	if (_object.is_invincible) return;
	
	// Calcula o dano
	var _true_damage = max(0, _amount - _object.shield);
	// aplica o dano
	_object.hp_current -= _true_damage;
	
	// Inicia invencibilidade
	_object.is_invincible = true;
	_object.alarm[0] = _object.inv_duration;
	
	show_debug_message(_object.hp_current);
}