
/// @description LEITURA DOS CONTROLES TOUCH

// Atualiza dimensões da GUI
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

joy_base_y = gui_h - 120;

// Reinicia entradas
joy_x = 0;
joy_y = 0;
mobile_shoot = false;

// --------------------------------
// JOYSTICK
// --------------------------------

// Procura um dedo para controlar o joystick
if (!joy_active) {
    for (var i = 0; i < 4; i++) {

        if (device_mouse_check_button_pressed(i, mb_left)) {

            var _tx = device_mouse_x_to_gui(i);
            var _ty = device_mouse_y_to_gui(i);

            // Só aceita toques na metade esquerda
            if (_tx < gui_w * 0.45) {
                joy_active = true;
                joy_touch = i;
                break;
            }
        }
    }
}

// Atualiza joystick enquanto o dedo estiver pressionado
if (joy_active) {

    if (device_mouse_check_button(joy_touch, mb_left)) {

        var _tx = device_mouse_x_to_gui(joy_touch);
        var _ty = device_mouse_y_to_gui(joy_touch);

        var _dir = point_direction(
            joy_base_x,
            joy_base_y,
            _tx,
            _ty
        );

        var _dist = point_distance(
            joy_base_x,
            joy_base_y,
            _tx,
            _ty
        );

        // Limita o deslocamento do joystick
        var _power = clamp(_dist / joy_radius, 0, 1);

        joy_x = lengthdir_x(_power, _dir);
        joy_y = lengthdir_y(_power, _dir);

        // Zona morta
        if (_dist < joy_deadzone) {
            joy_x = 0;
            joy_y = 0;
        }

    } else {

        // Soltou o dedo
        joy_active = false;
        joy_touch = -1;
    }
}

// --------------------------------
// MIRA E DISPARO
// --------------------------------

// Procura um dedo pressionado na metade direita
for (var i = 0; i <= 4; i++) {

    // Ignora o dedo que já está controlando o joystick
    if (joy_active && i == joy_touch) {
        continue;
    }
    
    if (device_mouse_check_button(i, mb_left)) {

        var _tx = device_mouse_x_to_gui(i);

        if (_tx >= gui_w * 0.45) {

            mobile_shoot = true;

            // Coordenadas do toque na Room
            mobile_aim_x = device_mouse_x(i);
            mobile_aim_y = device_mouse_y(i);

            break;
        }
    }
}

for (var i = 0; i <= 4; i++) {
    var _pressed = device_mouse_check_button(i, mb_left);

    show_debug_message(
    "ID 0: " + string(device_mouse_check_button(0, mb_left)) +
    " | ID 1: " + string(device_mouse_check_button(1, mb_left)) +
    " | ID 2: " + string(device_mouse_check_button(2, mb_left)) +
    " | ID 3: " + string(device_mouse_check_button(3, mb_left)) +
    " | ID 4: " + string(device_mouse_check_button(4, mb_left))
);

    if (joy_active && i == joy_touch) {
        continue;
    }

    if (_pressed) {
        var _tx = device_mouse_x_to_gui(i);

        if (_tx >= gui_w * 0.45) {
            mobile_shoot = true;
            mobile_aim_x = device_mouse_x(i);
            mobile_aim_y = device_mouse_y(i);
        }
    }
}
