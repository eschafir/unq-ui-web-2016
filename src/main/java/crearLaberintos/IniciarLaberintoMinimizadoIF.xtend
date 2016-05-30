package crearLaberintos

import org.eclipse.xtend.lib.annotations.Accessors
import unq_ciu.gatoEncerrado.Jugador
import unq_ciu.gatoEncerrado.Laberinto

@Accessors
class IniciarLaberintoMinimizadoIF {
	String habInicial
	String habFinal
	IniciarLaberintoMinimizado laberinto

	new(Jugador jugador, Laberinto laberinto) {
		jugador.inventario = newArrayList()
		this.habInicial = laberinto.getHabitacionInicial
		this.habFinal = laberinto.getHabitacionFinal
		this.laberinto = new IniciarLaberintoMinimizado(jugador, laberinto)
	}

}
