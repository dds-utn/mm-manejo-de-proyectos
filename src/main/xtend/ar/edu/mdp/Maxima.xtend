package ar.edu.mdp

import ar.edu.mdp.TipoDeTarea

class Maxima implements TipoDeTarea {
	
	override getCostoTotal(int tiempo) {
		if (tiempo <= 10) {
			tiempo * 25 * 1.07
		} else {
			//(tiempo * $25) + 7% + $10 por cada día después del décimo
			(tiempo * 25 * 1.07 ) + (tiempo - 10) * 10
		}
	}
	
}