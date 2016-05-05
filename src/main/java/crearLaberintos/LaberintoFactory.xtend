package crearLaberintos

import java.util.List
import unq_ciu.gatoEncerrado.Laberinto
import unq_ciu.gatoEncerrado.Jugador
import java.util.ArrayList

class LaberintoFactory {

	def static conEstadoPara(List<Laberinto> laberintos, Jugador jugador) {

		var lista = new ArrayList<Laberinto>

		for (Laberinto l : laberintos) {
			if (jugador.laberintos.contains(l)) {
				lista.add(l)
			}
		}
		return lista
	}
}
