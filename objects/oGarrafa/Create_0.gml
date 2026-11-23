// Inherit the parent event
event_inherited();

durability =  new Stat("Vida do Inimigo", 4);																														// Durabilidade, pontos de vida base
hp = durability.currentValue;

// STATES
spr_idle = sGarrafa_idle;
spr_walk = sGarrafa_idle;
spr_dead = sGarrafa_morte;