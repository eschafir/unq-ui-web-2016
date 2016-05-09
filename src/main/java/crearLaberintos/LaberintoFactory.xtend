package crearLaberintos

import java.util.ArrayList
import java.util.List
import unq_ciu.gatoEncerrado.Jugador
import unq_ciu.gatoEncerrado.Laberinto
import unq_ciu.gatoEncerrado.Habitacion

class LaberintoFactory {

	def static conEstadoPara(List<Laberinto> laberintos, Jugador jugador) {

		var lista = new ArrayList<Laberinto>

		for (Laberinto l : laberintos) {
			if (jugador.laberintos.contains(l)) {
				val lab = new Laberinto(l.id,l.nombre,l.path)
				lista.add(lab)
			}
		}
		return lista
	}

	def static iniciarHabitacionesDe(Laberinto laberinto) {
		var List<Habitacion> habs = new ArrayList<Habitacion>
		for (Habitacion h : laberinto.habitaciones){
			val hab = new Habitacion(h.id,h.nombre,h.acciones,h.path)
			habs.add(hab)
		}
		return habs
	}
		
	def static iniciarLaberintoPara(Laberinto laberinto, Jugador jugador){
		
		var Laberinto lab = null
		for(Laberinto l : jugador.laberintos){
			if (jugador.laberintos.contains(l)){
				val habsParaEnviar = iniciarHabitacionesDe(l)
				lab = new Laberinto(l.id,l.nombre,l.path,habsParaEnviar)
			}
		}	
		return lab
	}
}
