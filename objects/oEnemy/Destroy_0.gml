/// @description Quantia de drop
for (i = drop_bioCoin.currentValue; i > 0; i--) {
		instance_create_layer(x, y, "Instances", oBioCoin);
}