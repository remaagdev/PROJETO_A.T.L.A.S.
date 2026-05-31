switch(room) {
	case rGame:									// Ao entrar no game, reseta status da partida
		global.bio_collected = 0;
		global.return_reason = "";
		break;
		
		case rResults:						// Ao entrar na tela de resultados, define multiplicador de bio-coins
		var _bio_multi = 1.0;			// Valor cheio
		if (global.return_reason == "dead"){
			_bio_multi = 0.5;				// aso tenha morrido, ganhos cortados pela metade
		}
		
		// Calcula valor e deposita ele na carteira
		bio_current = global.bio_collected * _bio_multi;
		global.bio_wallet += bio_current;
}