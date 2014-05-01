package ar.edu.mdp

import ar.edu.mdp.TipoDeTarea

class Minima implements TipoDeTarea {
	
	override getCostoTotal(int tiempo) {
		tiempo * 25
	}
	
}