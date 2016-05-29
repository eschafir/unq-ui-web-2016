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
import unq_ciu.gatoEncerrado.acciones.Agarrar
import unq_ciu.gatoEncerrado.acciones.Salir
import unq_ciu.gatoEncerrado.acciones.Mover

@Accessors
class Repo {

	new() {
	}
	
	//La lista de items de todo el repo
	def getListaItems(){
		
		var Item martillo = new Item("Martillo", "Martillo comun")
		var Item llaveCocina = new Item("Llave", "Llave de la cocina")
		var Item pala = new Item("Pala", "Pala ancha")
		var Item cuchillo = new Item("Cuchillo", "Cuchillo de cocina")
		var Item pistola = new Item("Pistola", "Pistola")
		
		var items = newArrayList
		
		items.add(martillo)
		items.add(llaveCocina)
		items.add(pala)
		items.add(cuchillo)
		items.add(pistola)
		items
	}
	
	//La lista de acciones de todo el repo
	def List<Accion> getListaAcciones(){
		
		val agarrar1 = new Agarrar(0, listaItems.get(0))
		val agarrar2 = new Agarrar(1, listaItems.get(1))
		val agarrar3 = new Agarrar(2, listaItems.get(2))
		val agarrar4 = new Agarrar(3, listaItems.get(3))
		val agarrar5 = new Agarrar(4, listaItems.get(4))
		val mover1 = new Mover(5, new Habitacion(0, "Inicial", true, false, ""))
		val mover2 = new Mover(6, new Habitacion(1, "Cocina", false, true, ""))
		val mover3 = new Mover(7, new Habitacion(2, "Garage", false, false, ""))
		val mover4 = new Mover(8, new Habitacion(3, "Living", false, false, ""))
		val mover5 = new Mover(9, new Habitacion(4, "Baño", false, false, ""))
		val usar1 = new Usar(10, listaItems.get(0), new Accion(16, "Resultado de usar el martillo"))
		val usar2 = new Usar(11, listaItems.get(1), mover1)
		val usar3 = new Usar(12, listaItems.get(2), new Accion(17, "Resultado de usar la pala"))
		val usar4 = new Usar(13, listaItems.get(3), new Accion(18, "Resultado de usar el cuchillo"))
		val usar5 = new Usar(14, listaItems.get(4), new Accion(19, "Resultado de usar la pistola"))
		val salir = new Salir(15)
		
		var List<Accion> acciones = newArrayList
		
		acciones.add(agarrar1)
		acciones.add(agarrar2)
		acciones.add(agarrar3)
		acciones.add(agarrar4)
		acciones.add(agarrar5)
		acciones.add(mover1)
		acciones.add(mover2)
		acciones.add(mover3)
		acciones.add(mover4)
		acciones.add(mover5)
		acciones.add(usar1)
		acciones.add(usar2)
		acciones.add(usar3)
		acciones.add(usar4)
		acciones.add(usar5)
		acciones.add(salir)
		
		acciones
	}
	
	def getHabitaciones() {
		
		var hab = new Habitacion(0, "Inicial", true, false, "")
		hab.agregarAccion(listaAcciones.get(0))
		hab.agregarAccion(listaAcciones.get(7))
		
		var hab1 = new Habitacion(1, "Cocina", false, true, "")
		hab1.agregarAccion(listaAcciones.get(15))
		
		var hab2 = new Habitacion(2, "Garage", false, false, "")
		hab2.agregarAccion(listaAcciones.get(1))
		hab2.agregarAccion(listaAcciones.get(11))
		
		var hab3 = new Habitacion(3, "Living", false, false, "")
		var hab4 = new Habitacion(4, "Baño", false, false, "")
		
		var habitaciones = #[hab, hab1, hab2, hab3, hab4]
		habitaciones
	}
	

	/**
 	* Este metodo genera los laberintos. Luego es llamado desde el controller.
 	*/
	def getLaberintosMinimizados() {

		#[
			new Laberinto(0, "Testing", "path de imagen", habitaciones),
			new Laberinto(1, "Casa abandonada", "image1.jpg", habitaciones),
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

		//Jugador1
		var jugador1 = new Jugador(1, "Player1")
		
		//Jugador2 en "Garage" con llave de la cocina
		var jugador2 = new Jugador(2, "Player2", habitaciones.get(2))
		jugador2.agregarAlInventario(listaItems.get(1))

		//Jugador3 en Cocina
		var jugador3 = new Jugador(3, "Jugador 3", habitaciones.get(1))

		jugador1.laberintos = laberintosMinimizados.tail.toList
		jugador2.laberintos = laberintosMinimizados
		jugador3.laberintos = laberintosMinimizados

		var listaJugadores = #[jugador1, jugador2, jugador3]
		listaJugadores
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

	/**
	 * Devuelve ls habitacion cuyo id fue ingresado.
	 * @params id : id de la habitacion que se quiere obtener.
	 */
	def getHabitacion(Long id) {
		habitaciones.findFirst[it.id == id]
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

	def Laberinto traerLaberinto(Habitacion h) {
		laberintosMinimizados.findFirst[it.habitaciones.contains(h)]
	}

}