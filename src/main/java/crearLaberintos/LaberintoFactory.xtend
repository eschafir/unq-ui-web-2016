package crearLaberintos

import java.util.List
import unq_ciu.gatoEncerrado.Jugador
import unq_ciu.gatoEncerrado.Laberinto
import unq_ciu.gatoEncerrado.Habitacion
import org.eclipse.xtend.lib.annotations.Accessors
import unq_ciu.gatoEncerrado.Accion
import unq_ciu.gatoEncerrado.Item

@Accessors
class LaberintoFactory {
	int laberintoId
	List<Habitacion> habitaciones
	List<Item> inventario

	new(Laberinto laberinto, Jugador jugador) {
		this.laberintoId = laberinto.id
		this.habitaciones = laberinto.habitaciones
		this.inventario = jugador.inventario
	}

	def static objetoADevolver(Laberinto lab, Jugador jug) {
		return new LaberintoFactory(lab, jug)
	}

	def static conEstadoPara(Jugador jug, Laberinto lab) {
	}
}
