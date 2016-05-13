package repo

import crearLaberintos.AccionMinimizada
import crearLaberintos.HabitacionMinimizada
import crearLaberintos.LaberintoMinimizado
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import unq_ciu.gatoEncerrado.Accion
import unq_ciu.gatoEncerrado.Habitacion
import unq_ciu.gatoEncerrado.Item
import unq_ciu.gatoEncerrado.Jugador
import unq_ciu.gatoEncerrado.Laberinto
import unq_ciu.gatoEncerrado.acciones.Usar

@Accessors
class Repo {

	new() {
	}

	/**
 	* Este metodo genera los laberintos. Luego es llamado desde el controller.
 	*/
	def getLaberintosMinimizados() {

		var habitaciones = newArrayList()
		var hab = new Habitacion(1, "Inicial", true, false, "path")
		var hab1 = new Habitacion(2, "cocina", false, false, "path2")
		val accion = new Usar(new Item("Pala", "Pala de punta"), new Accion(3, "accion consecuencia"))
		hab.agregarAccion(accion)
		habitaciones.add(hab)
		habitaciones.add(hab1)

		#[
			new Laberinto(0, "Testing", "path de imagen", habitaciones),
			new Laberinto(1, "Casa abandonada", "image1.jpg"),
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
		jugador1.inventario = #[
			new Item("Mochila", "Mochila grande"),
			new Item("Pila", "Pila AA")
		]

		jugador1.laberintos = laberintosMinimizados.tail.toList
		jugador2.laberintos = laberintosMinimizados

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
	def getLaberinto(Long id) {
		laberintosMinimizados.findFirst[it.id == id]
	}

	def laberintosDeJugador(Jugador j) {

		var lista = new ArrayList<LaberintoMinimizado>

		for (Laberinto l : j.laberintos) {
			val lab = new LaberintoMinimizado(l.id, l.nombre, l.path)
			lista.add(lab)
		}
		return lista
	}

	def static minimizarHabitaciones(Laberinto l) {
		var lista = newArrayList()

		for (Habitacion h : l.habitaciones) {
			val hab = new HabitacionMinimizada(h.id, h.nombre, h.acciones, h.path)
			lista.add(hab)
		}
		return lista
	}

	def static minimizarAcciones(List<Accion> acciones) {
		var lista = newArrayList()

		for (Accion a : acciones) {
			val acc = new AccionMinimizada(a.id, a.nombre)
			lista.add(acc)
		}
		return lista
	}

}
