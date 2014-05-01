package ar.edu.mdp

import ar.edu.mdp.TipoDeTarea

class Media implements TipoDeTarea {
	
	override getCostoTotal(int tiempo) {
		tiempo * 25 * 1.05
	}
	
}