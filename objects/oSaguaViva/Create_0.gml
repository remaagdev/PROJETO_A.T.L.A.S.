// Herda o evento do oEnemy e sobreescreve abaixo
event_inherited();

durability =  new Stat("Vida do Inimigo", 6);																														// Durabilidade, pontos de vida base
hp = durability.currentValue;

// velocidade
velocity = 1.3;

can_move = true;
// STATES
spr_idle = sSaguaViva_idle;
spr_walk = sSaguaViva_idle;
spr_dead = sSaguaViva_morte;