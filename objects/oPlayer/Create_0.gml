// -----------------------// -----------------------
//				 STATUS FISICOS
// -----------------------// -----------------------
oxygen = new Stat("Oxigenio do Submarino", 30);																							   		// cilindro de oxigenio, timer de quanto tempo o submarifo fica submerso base
qOxygen = oxygen.currentValue;																																	// Variavel para armazenar valor de oxigenio atual
alarm[3] = 1 * game_get_speed(gamespeed_fps);																									// Começa a diminuir a cada segundo a quantia de oxigênio

durability =  new Stat("Durabilidade do Submarino", 100);																								// Durabilidade, pontos de vida base
hp = durability.currentValue;

velocity = new Stat ("Velocidade do Subimarino", 3);																								// Velocidade de navegaçao por segundo base
hSpd =  0;
wSpd = 0;

resistPresurre = new Stat("Resistencia a Pressao do Submarino", 763);															// Ressistencia a pressao de profundidade em metros(px)

// -----------------------// -----------------------
//				STATUS COMBATE
// -----------------------// -----------------------
shield = new Stat("Armadura do Submarino", 0);																										// Armadura do submarino

damage = new Stat("Dano do Submarino", 10);																										// Dano por disparo base

cadencyFire = new Stat("Cadencia de tiros do Submarino", 0.5);																			// Tempo de cadencia entre os disparos realizados 

bulletFire = new Stat("Quantidade de Tiros", 2);																										// Quantidade de tiros realizados por disparo
qBullet = 0;																																												// Variavel para ser usada no sistema de disparos, armazena quantos disparos submarino possui

coldownFire = new Stat("Coldown de Disparo", 2);																									// Tempo de coldown entre novos disparos

invencibility = new Stat("Duraçao Invencibilidade", 60);																						// Tempo em que fica invuneravel

colisionDamage = new Stat("Dano de Colisao", 5);																										// Colisao contra paredes

fisherLuck = new Stat("Sorte do Pescador", 0.1);																											// SORTE DO PESCADOR

// -----------------------// -----------------------
//						GETTERS
// -----------------------// -----------------------
is_vunerable = true;																																								// True = Objeto está sucetivel a receber dano																					
can_shooting = true;																																							// True = Objeto pode atirar
is_cadency = true;																																									// Ture = Objeto tem cadencia para disparar projetil
is_coldown = false;																																								// False = Não está em coldown para disparar

// -----------------------// -----------------------
//						SPRITE STATES
// -----------------------// -----------------------
spr_idle = sSubmarino_idle;
spr_walk = sSubmarino_walk;