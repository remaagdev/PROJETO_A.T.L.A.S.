
/// @description CONFIGURAÇÃO DOS CONTROLES MOBILE

// Joystick
joy_active = false;
joy_touch = -1;

joy_x = 0;
joy_y = 0;

joy_radius = 100;
joy_deadzone = 8;

// Posição visual do joystick na GUI
joy_base_x = 150;
joy_base_y = 0;

// Disparo mobile
mobile_shoot = false;
mobile_aim_x = 0;
mobile_aim_y = 0;

// Posição visual
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

joy_base_y = gui_h - 120;
