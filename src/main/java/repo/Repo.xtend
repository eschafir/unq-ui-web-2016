package repo

import crearLaberintos.Laberinto

class Repo {
	
	

	/**
 * Este metodo genera los laberintos. Luego es llamado desde el controller.
 */
	def listaLaberintos() {
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
	
	def getUsuario(Long id){
		listaJugadores.findFirst[ it.id == id]
	}

}
