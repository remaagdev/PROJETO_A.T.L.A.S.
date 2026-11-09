// Create Event do oEnemy
durability =  new Stat("Vida do Inimigo", 10);																														// Durabilidade, pontos de vida base
hp = durability.currentValue;

damage = new Stat("Dano do Inimigo", 5);
damage = damage.currentValue;

velocity = new Stat("Velocidade do inimigo", 0);
velocity = velocity.currentValue;

shield = new Stat("Armadura do Inimigo", 0);																										// Armadura do inimigo

invencibility = new Stat("Duração Invencibilidade", 60);																						// Tempo em que fica invuneravel

drop_bioCoin = new Stat("Drop de Bio-Coins", 5);

range_detected = new Stat ("Detectar Submarino", 120);
range_detected = range_detected.currentValue;																								// Quantia de Bio-Coins que são dropados ao ser derrotado

iSprite = 0;

is_vunerable = true; // Estado de vulnerabilidade
can_move = false;
player_detected = false;

// STATES
spr_idle = "";
spr_walk = "";
spr_dead = "";

// CONTROLADOR DE MOVIMENTO
move_time = 0;
move_dir = -1; // -1 esquerda, 0 parado, 1 direita
