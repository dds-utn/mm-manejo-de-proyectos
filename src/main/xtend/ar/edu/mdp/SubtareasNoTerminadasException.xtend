package ar.edu.mdp

import java.lang.RuntimeException

class SubtareasNoTerminadasException extends RuntimeException {
	
	new(String mensajeDeError) {
		super(mensajeDeError)
	}
}