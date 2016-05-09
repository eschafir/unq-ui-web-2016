package repo

import unq_ciu.gatoEncerrado.Jugador
import java.util.ArrayList
import unq_ciu.gatoEncerrado.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors
import unq_ciu.gatoEncerrado.Habitacion
import unq_ciu.gatoEncerrado.acciones.Mover
import unq_ciu.gatoEncerrado_DummyData.DummyData
import unq_ciu.gatoEncerrado.Accion

@Accessors
class Repo {

	new() {
	}

	/**
 	* Este metodo genera los laberintos. Luego es llamado desde el controller.
 	*/
	def getLaberintos() {
		val listaAcciones = new ArrayList<Accion>()
		
		val hab3 = new Habitacion(2, "Pasillo", true, false, "hab3.jpg")
		val accion1 = new Mover(1, hab3)
		listaAcciones.add(accion1)
		
		hab3.acciones = listaAcciones
		
		
		//val hab2 = new Habitacion(2, "Pasillo", true, false, listaAcciones, "hab2.jpg")
		//acc1 = new Mover(hab2)
		//hab2 = new Habitacion(1, "Living", true, false, listaAcciones, "hab1.jpg")
	
		
		#[
			new Laberinto(2, "Museo", "image2.jpg", #[hab3]),
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
	
	/**
	 * Devuelve el laberinto cuyo id fue ingresado.
	 * @params id : id del laberinto que se quiere obtener.
	 */
	def getLaberinto(Long id){
		getLaberintos.findFirst[it.id == id]
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
