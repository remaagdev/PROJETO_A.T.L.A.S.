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

if (keyboard_check_pressed(ord"P") && stateGame == "running"){
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

	case default:
		instance_activate_layer("Instances");
		break;
}