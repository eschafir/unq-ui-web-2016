package repo

import crearLaberintos.Laberinto

class Repo {
	
	new(){}

	/**
 * Este metodo genera los laberintos. Luego es llamado desde el controller.
 */
	def getLaberintos() {
		#[
			new Laberinto(1, "Casa embrujada", "saraza"),
			new Laberinto(2, "Museo", "lalala")
		]
	}
	
	def listaJugadores() {
		#[
			new Jugador(1, "Casa embrujada", "saraza"),
			new Jugador(2, "Museo", "lalala")
		]
	}
	
	def getJugador(Long id){
		listaJugadores.findFirst[ it.id == id]
	}

}
