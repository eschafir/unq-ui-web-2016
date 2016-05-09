package crearLaberintos

import java.util.ArrayList
import java.util.List
import unq_ciu.gatoEncerrado.Jugador
import unq_ciu.gatoEncerrado.Laberinto
import unq_ciu.gatoEncerrado.Habitacion
import org.eclipse.xtend.lib.annotations.Accessors
import unq_ciu.gatoEncerrado.Accion
import unq_ciu.gatoEncerrado.Item

@Accessors
class LaberintoFactory {
	Laberinto laberinto
	Jugador jugador
	List<Habitacion> habitaciones
	List<Accion> acciones
	List<Item> elementos
	
	new(Laberinto laberinto, Jugador jugador){
		this.laberinto = laberinto
		this.jugador = jugador
		this.habitaciones = laberinto.habitaciones
		//this.acciones = laberinto.habitaciones.acciones
		this.elementos = jugador.inventario
	}
	
	def static objetoADevolver(Jugador jug, Laberinto lab) {
		return new LaberintoFactory(lab, jug)
	}
}
