 // criando tiro

if (is_fired){
	show_debug_message("TIRO CRIADO!");
    is_fired = false; 
    alarm[1] = 15;            // tempo entre tiros

    var _tiro = instance_create_layer(x, y, "Instances", oBullet);
    var _dir = point_direction(x + 16, y, mouse_x, mouse_y);

    with(_tiro) {
        direction = _dir;
        speed= 10;
        image_angle = _dir;
    }

} 