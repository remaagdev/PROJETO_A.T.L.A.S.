// Structs/ Constructs para criar upgrades
function Upgrade(_nameUp, _lvlUp_limit, _multiUp) constructor {
		nameUp = _nameUp;											// Nome do upgrade
		lvlUp = 0;																	// Nivel do upgrade
		lvlUp_limit = _lvlUp_limit;									// Limite de nivel do upgrade
		multiUp = _multiUp;												// O quanto aumenta ao subir de nivel um upgrade
		
}

// Structs/ Constructs para criar status
function Stat(_name, _base) constructor {
	name = _name;															// Nome do Status
	baseValue = _base;													// Valor base do status
	currentValue = _base;												// Valor correto do status no momento
	upgradesList = [];														// Array dinamico para armazenar os upgrades e status
	
	
	// metodo para fazer o upgrade
	static make_upgrade = function(upgrade_index) {
		// segurança: Verifica se o index existe na lista
		if (upgrade_index >= 0 && upgrade_index < array_length(upgradesList))  {
				var _up = upgradesList[upgrade_index];									// atalho para minimizar linhas de cod
				
				// segurança:  Realiza o upgrade se o nivel dele for menor que o limite
				if (_up.lvlUp < _up.lvlUp_limit) {
					_up.lvlUp++;													// Aumenta o nivel do upgrade
					statusCurrentValue();								// atualiza o status current do upgrade
				}
		}
	}
	
	// Metodo para recalcular o valor final do status
	static statusCurrentValue = function() {
		var _totalBonus = 0;
		
		for (var i = 0; i < array_length(upgradesList); i++) {
			_totalBonus += baseValue * (upgradesList[i].lvlUp * upgradesList[i].multiUp);
		}
		
		currentValue = baseValue + totalBonus;
	}
}