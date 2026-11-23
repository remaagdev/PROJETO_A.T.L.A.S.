global.bio_wallet = 0;														// Bio-Coins total acumulados
global.bio_collected = 0;													// Bio-Coins coletados durante a run
global.return_reason = "";  												// Getter para saber se o retorno do personagem é por "oxygen" ou "dead"
global.tile_colision = layer_tilemap_get_id("terreno");
stateGame = "running";

if (MOBILE_BUILD) {
    instance_create_layer(0, 0, "Instances", oJoystick);
}

// ADAPTAÇÃO DA CÂMERA PARA ANDROID

var _aspect = display_get_width() / display_get_height();

view_hport[0] = 768;
view_wport[0] = round(768 * _aspect);

// Altura fixa da câmera
var _camHeight = 180;

// Calcula a largura conforme o aparelho
var _camWidth = _camHeight * _aspect;

// Atualiza a câmera
camera_set_view_size(view_camera[0], _camWidth, _camHeight);