function apply_damage(_damage, _object){
	// se NAO estiver invencivel, ignora o dano (saia da funçao)
	if (!_object.is_vunerable) return;
	
	// Calcula o dano
	var _true_damage = max(0, _damage - _object.shield.currentValue);
	// aplica o dano
	_object.hp.currentValue -= _true_damage;
	
	// Inicia invencibilidade
	_object.is_vunerable  = false;
	_object.alarm[0] = _object.invencibility.currentValue;
	
	show_debug_message(string(_object.id) + " levou " + string(_damage) + " de dano");
}