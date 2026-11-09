// resetar room
if (keyboard_check_pressed(ord("R"))) {
	room_goto(rGame);	

}

// resetar room
if (keyboard_check_pressed(ord("U"))) {
	room_goto(rUpgrades);	

}

// Fullscreen
if (keyboard_check(vk_f11)) {
window_set_fullscreen(!window_get_fullscreen());
}

// fechar o jogo
if (keyboard_check(vk_escape)) {
    game_end();
}