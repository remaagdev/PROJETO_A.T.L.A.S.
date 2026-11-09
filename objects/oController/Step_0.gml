// resetar room
if (keyboard_check_pressed(ord("R"))) {
	room_goto(rGame);	
	stateGame = "running";
}

// resetar room
if (keyboard_check_pressed(ord("U"))) {
	room_goto(rUpgrades);	

}

// Fullscreen
if (keyboard_check_pressed(vk_f11)) {
window_set_fullscreen(!window_get_fullscreen());
}

// fechar o jogo
if (keyboard_check_pressed(vk_escape)) {
    game_end();
}

if (keyboard_check_pressed(ord("P")) && stateGame == "running"){
	stateGame = "paused";
} else {
	stateGame = "running";
}

switch (stateGame) {
	case "running":
		instance_activate_layer("Instances");
		break;

	case "paused":
		instance_deactivate_layer("Instances");
		break;

	case "default":
		instance_activate_layer("Instances");
		break;
}
var _bio_multi = 1.0;			// Valor cheio
		if (global.return_reason == "dead"){
			_bio_multi = 0.5;				// aso tenha morrido, ganhos cortados pela metade
		
		}
		
		// Calcula valor e deposita ele na carteira
		bio_current = global.bio_collected * _bio_multi;
		global.bio_wallet += bio_current;