// -----------------------// -----------------------
//				 STATUS FISICOS
// -----------------------// -----------------------
oxygen = new Stat("Oxigenio do Submarino", 30);																							   		// cilindro de oxigenio, timer de quanto tempo o submarifo fica submerso base

hp =  new Stat("Durabilidade do Submarino", 100);																								// Durabilidade, pontos de vida base

velocity = new Stat ("Velocidade do Subimarino", 3);																								// Velocidade de navegaçao por segundo base
hSpd =  0;
wSpd = 0;

resistPresurre = new Stat("Resistencia a Pressao do Submarino", 763);															// Ressistencia a pressao de profundidade em metros(px)

// -----------------------// -----------------------
//				STATUS COMBATE
// -----------------------// -----------------------
shield = new Stat("Armadura do Submarino", 0);																										// Armadura do submarino

damage = new Stat("Dano do Submarino", 10);																										// Dano por disparo base

cadencyFire = new Stat("Cadencia de tiros do Submarino", 2);																			// Quantidade de disparos realizados por tiro base

invencibility = new Stat("Duraçao Invencibilidade", 60);																						// Tempo em que fica invuneravel

colisionDamage = new Stat("Dano de Colisao", 5);																										// Colisao contra paredes

fisherLuck = new Stat("Sorte do Pescador", 0.1);																											// SORTE DO PESCADOR
// -----------------------// -----------------------
//				GETTERS
// -----------------------// -----------------------
is_vunerable = true;
is_fired = true;



// sprites states
spr_idle = sSubmarino_idle;
spr_walk = sSubmarino_walk;