package ar.edu.mdp

import java.util.List
import java.util.ArrayList

class Tarea {
	
	TipoDeTarea tipo
	int duracion
	List<Tarea> subtareas = new ArrayList
	
	@Property boolean estaTerminada = false
	
	new (int unosDias, TipoDeTarea unTipoDeTarea) {
		duracion = unosDias
		tipo = unTipoDeTarea
	}
	
	def double getCostoTotal() {
		var porcentajeOverhead = 1.0
		if (subtareas.length > 3) {
			porcentajeOverhead = 1.04
		}
		(tipo.getCostoTotal(duracion) + costoDeSubtareas) * porcentajeOverhead
	}
		
	def getCostoDeSubtareas() {
		subtareas.fold(0d, [ acum, tarea | acum + tarea.costoTotal ])
	}
	
	def void agregarSubtarea(Tarea tarea) {
		this.subtareas.add(tarea)
	}
	
	def terminar() {
		if (!this.todasLasSubtareasEstanTerminadas()) {
			throw new SubtareasNoTerminadasException("Aún hay tareas que no han sido resueltas. Debe terminar todas las subtareas para poder terminar la tarea")
		}
		estaTerminada = true
	}
	
	def todasLasSubtareasEstanTerminadas() {
		subtareas.forall[ subtarea | subtarea.estaTerminada ]
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}