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
			new Laberinto(3, "Plaza", "image3.jpg"),
			new Laberinto(4, "Hospital", "image4.jpg"),
			new Laberinto(5, "Estación de bomberos", "image5.jpg")
		]
	}

	/**
 	* Este metodo genera los jugadores. Luego es llamado desde el controller.
 	*/
	def listaJugadores() {

		var listaJugadores = new ArrayList<Jugador>

		var jugador1 = new Jugador(1, "Player1")
		var jugador2 = new Jugador(2, "Player2")

		jugador1.laberintos = laberintos.tail.toList
		jugador2.laberintos = laberintos

		listaJugadores.add(jugador1)
		listaJugadores.add(jugador2)

		return listaJugadores
	}

	/**
	 * Devuelve el jugador cuyo id fue ingresado.
	 * @params id : id del jugador que se quiere obtener.
	 */
	def getJugador(Long id) {
		listaJugadores.findFirst[it.id == id]
	}

	def laberintosDeJugador(Jugador j) {

		var lista = new ArrayList<Laberinto>

		for (Laberinto l : laberintos) {
			if (j.laberintos.contains(l)) {
				lista.add(l)
			}
		}
		return lista
	}

}
