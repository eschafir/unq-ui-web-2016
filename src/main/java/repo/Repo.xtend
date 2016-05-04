package repo

import unq_ciu.gatoEncerrado.Jugador
import java.util.ArrayList
import unq_ciu.gatoEncerrado.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Repo {

	new() {
	}

	/**
 	* Este metodo genera los laberintos. Luego es llamado desde el controller.
 	*/
	def getLaberintos() {
		#[
			new Laberinto(1, "Casa embrujada", "image.jpg"),
			new Laberinto(2, "Museo", "image2.jpg"),
			new Laberinto(2, "Plaza", "image3.jpg")
		]
	}

	/**
 	* Este metodo genera los jugadores. Luego es llamado desde el controller.
 	*/
	def listaJugadores() {

		var listaJugadores = new ArrayList<Jugador>

		var jugador1 = new Jugador(1, "Casa embrujada")
		var jugador2 = new Jugador(2, "Museo")

		jugador1.laberintosGanados = laberintos.tail.toList
		jugador2.laberintosGanados = laberintos

		listaJugadores.add(jugador1)
		listaJugadores.add(jugador2)

		return listaJugadores
	}

	def getJugador(Long id) {
		listaJugadores.findFirst[it.id == id]
	}

}
