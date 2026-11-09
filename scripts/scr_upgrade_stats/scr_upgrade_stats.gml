// Structs/ Constructs para criar upgrades
function Upgrade(_idUp, _nameUp, _lvlUp_limit, _multiUp, _costUp) constructor {
		idUp = _idUp;
		nameUp = _nameUp;											// Nome do upgrade
		lvlUp = 0;																	// Nivel do upgrade
		lvlUp_limit = _lvlUp_limit;									// Limite de nivel do upgrade
		multiUp = _multiUp;												// O quanto aumenta ao subir de nivel um upgrade
		costUp = _costUp;
}

// Structs/ Constructs para criar status
function Stat(_name, _base) constructor {
	name = _name;															// Nome do Status
	baseValue = _base;													// Valor base do status
	currentValue = _base;												// Valor correto do status no momento
	upgradesList = [];														// Array dinamico para armazenar os upgrades e status
	
	
	// metodo para fazer o upgrade
	static make_upgrade = function(_stat, upgrade_index) {
		// segurança: Verifica se o index existe na lista
		if (upgrade_index >= 0 && upgrade_index < array_length(_stat.upgradesList))  {
				var _up = _stat.upgradesList[upgrade_index];									// atalho para minimizar linhas de cod
				
				// segurança:  Realiza o upgrade se o nivel dele for menor que o limite
				if (_up.lvlUp < _up.lvlUp_limit && _up.costUp <= global.bio_wallet) {
					_up.lvlUp++;													// Aumenta o nivel do upgrade
					_stat.statusCurrentValue();								// atualiza o status current do upgrade
				    
					global.bio_wallet -= _up.costUp;
					_up.costUp = ceil(_up.costUp * 1.2);				// Aredonda para cima valor de custo
					return true;
                } else {
					return false;
				}
		}
	}
	
	// Metodo para recalcular o valor final do status
	static statusCurrentValue = function() {
		var _totalBonus = 0;
		
		for (var i = 0; i < array_length(_stat.upgradesList); i++) {
			_totalBonus += baseValue * (_stat.upgradesList[i].lvlUp * _stat.upgradesList[i].multiUp);
		}
		
		_stat.currentValue = _stat.baseValue + _totalBonus;
	}
}