BEGIN TRANSACTION;
DROP TABLE IF EXISTS "Upgrades Elite";
CREATE TABLE "Upgrades Elite" (
	"ID"	INTEGER,
	"Nome_Upgrade"	TEXT,
	"Nivel" INTEGER,
	"Custo_BioCredito"	INTEGER,
	"Custo_Entulho"	INTEGER,
	"Capacidade_Coleta"	INTEGER,
	"Multiplicador_Dano_Porcentagem"	REAL,
	"Area_Ataque_Metros"	INTEGER,
	"Area_Ataque_Pixels"	INTEGER,
	"Multiplicador_BioCredito_Porcentagem"	REAL,
	"Bonus_Oxigenio_Segundos"	INTEGER,
	"Raio_Luz_Metros"	INTEGER,
	"Raio_Luz_Pixels"	INTEGER,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
INSERT INTO "Upgrades Elite" ("ID","Nome_Upgrade","Nivel","Custo_BioCredito","Custo_Entulho","Capacidade_Coleta","Multiplicador_Dano_Porcentagem","Area_Ataque_Metros","Area_Ataque_Pixels","Multiplicador_BioCredito_Porcentagem","Bonus_Oxigenio_Segundos","Raio_Luz_Metros","Raio_Luz_Pixels") VALUES (1,'Garra de Coleta',2,2000,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (2,'Garra de Coleta',3,4000,3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (3,'Sugador Oceânico',1,1500,2,NULL,NULL,15,75,5.0,NULL,NULL,NULL),
 (4,'Sugador Oceânico',2,3000,4,NULL,NULL,30,150,5.0,NULL,NULL,NULL),
 (5,'Sugador Oceânico',3,6000,6,NULL,NULL,45,225,5.0,NULL,NULL,NULL),
 (6,'Reciclando à Força',1,5000,5,NULL,5.0,NULL,NULL,NULL,NULL,NULL,NULL),
 (7,'Reciclando Oxigênio',1,3000,3,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL),
 (8,'Lanterna de Exploração',1,5000,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,175),
 (9,'Mergulho Profundo',1,5000,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DROP INDEX IF EXISTS "idx_elite_nivel";
CREATE UNIQUE INDEX idx_elite_nivel ON "Upgrades Elite" ("Nome_Upgrade", "Nivel");
COMMIT;
