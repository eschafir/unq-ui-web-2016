package crearLaberintos

import unq_ciu.gatoEncerrado.Accion
import unq_ciu.gatoEncerrado.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import unq_ciu.gatoEncerrado.Habitacion

@Accessors
class AnalizarEfecto {
	Accion object
	Jugador jugador
	Habitacion habitacion

	new(Accion o, Jugador jugador, Habitacion habitacion) {
		this.object = o
		this.jugador = jugador
		this.habitacion = habitacion
	}

	def analizar() {
	}
}
