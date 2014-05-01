package ar.edu.mdp

import org.junit.Assert
import org.junit.Test

class CostoDeTareasTest {
	
	@Test
	def calcularCostoTareaSimpleMinimaTresDiasSinImpuestos() {
		val tarea = new Tarea(3, new Minima)
		val costo = tarea.getCostoTotal()
		Assert.assertEquals(75, costo, 0d) 
	}
	
	@Test
	def calcularCostoTareaSimpleMediaTresDiasSinImpuestos() {
		val tarea = new Tarea(3, new Media)
		val costo = tarea.getCostoTotal()
		Assert.assertEquals(78.75, costo, 0d) 
	}
	
	@Test
	def calcularCostoTareaSimpleMaximaTresDiasSinImpuestos() {
		val tarea = new Tarea(3, new Maxima)
		val costo = tarea.getCostoTotal()
		Assert.assertEquals(80.25, costo, 0d) 
	}
	
	@Test
	def calcularCostoTareaSimpleMaximaOnceDiasSinImpuestos() {
		val tarea = new Tarea(11, new Maxima)
		val costo = tarea.getCostoTotal()
		Assert.assertEquals(304.25, costo, 0d) 
	}
	
	@Test
	def calcularCostoTareaMinimaTresDiasSinImpuestosConSubtareaMinimaUnDia(){
		val tarea = new Tarea(3, new Minima)
		val subtarea = new Tarea(1, new Minima)
		
		tarea.agregarSubtarea(subtarea)
		val costo = tarea.getCostoTotal()

		Assert.assertEquals(100, costo, 0d)
	}
	
	@Test
	def calcularCostoTareaMinimaTresDiasSinImpuestosConCuatroSubtareasMinimasDeUnDia() {
		val tarea = new Tarea(3, new Minima)
		
		val subtarea1 = new Tarea(1, new Minima)
		val subtarea2 = new Tarea(1, new Minima)
		val subtarea3 = new Tarea(1, new Minima)
		val subtarea4 = new Tarea(1, new Minima)
		
		tarea.agregarSubtarea(subtarea1)
		tarea.agregarSubtarea(subtarea2)
		tarea.agregarSubtarea(subtarea3)
		tarea.agregarSubtarea(subtarea4)
		val costo = tarea.getCostoTotal()

		Assert.assertEquals(175 * 1.04, costo, 0d)
	}
	
	@Test
	def dadaUnaTareaSinSubtareasSeTerminaOk() {
		val tarea = new Tarea(1, new Minima)
		
		tarea.terminar()
		
		Assert.assertTrue(tarea.estaTerminada)
	}
	
	/*
	 * NUEVO REQUERIMIENTO:  
	 * no se puede terminar una tarea si las subtareas no estan resueltas.
	 */
	@Test
	def dadaUnaTareaConUnaSubtareaNoResueltaSiLaTerminoNoDebePoderse() {
		val tarea = new Tarea(3, new Minima)
		val subtarea = new Tarea(1, new Minima)
		
		tarea.agregarSubtarea(subtarea)

		try {
			tarea.terminar()
			Assert.fail
		} catch (SubtareasNoTerminadasException excepcion) {
			Assert.assertFalse(tarea.estaTerminada)
		}
	}
	
	
	
	
	
	
	
	
}