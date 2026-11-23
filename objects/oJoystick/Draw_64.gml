
/// @description DESENHO DO JOYSTICK

// Base do joystick
draw_set_alpha(0.35);
draw_set_color(c_white);

draw_circle(
    joy_base_x,
    joy_base_y,
    joy_radius,
    false
);

// Direcional interno
var _knob_x = joy_base_x + joy_x * joy_radius;
var _knob_y = joy_base_y + joy_y * joy_radius;

draw_set_alpha(0.75);
draw_set_color(c_aqua);

draw_circle(
    _knob_x,
    _knob_y,
    28,
    false
);

// Restaura configurações
draw_set_alpha(1);
draw_set_color(c_white);
