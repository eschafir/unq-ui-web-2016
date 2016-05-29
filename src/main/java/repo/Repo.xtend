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
	def getListaItems() {

		var martillo = new Item("Martillo", "Martillo comun")
		var llaveCocina = new Item("Llave de la cocina", "Llave de la cocina")
		var pala = new Item("Pala", "Pala ancha")
		var cuchillo = new Item("Cuchillo", "Cuchillo de cocina")
		var pistola = new Item("Pistola", "Pistola")
		var llaveEntradaPrision = new Item("Llave", "Llave de la entrada")
		var bisturi = new Item("Bisturi", "Bisturi oxidado")
		var tuboGas = new Item("Tubo de gas", "Tubo de gas")
		var llaveLabo = new Item("Llave del laboratorio", "Llave del laboratorio")
		var palanca = new Item("Palanca", "Palanca")
		var destornillador = new Item("Destornillador", "Destornillador")

		var items = #[martillo, llaveCocina, pala, cuchillo, pistola, llaveEntradaPrision, bisturi, tuboGas, llaveLabo,
			palanca, destornillador]
		items
	}

	def getHabitaciones() {

		//Habitaciones de casa abandonada
		var entrada = new Habitacion(0, "Entrada", true, false, "")
		var cocina = new Habitacion(1, "Cocina", false, true, "")
		var garage = new Habitacion(2, "Garage", false, false, "")
		var living = new Habitacion(3, "Living", false, false, "")
		var baño = new Habitacion(4, "Baño", false, false, "")

		//habitaciones de museo
		var zoologia = new Habitacion(5, "Zoologia", true, false, "")
		var biologia = new Habitacion(6, "Biologia", false, false, "")
		var historia = new Habitacion(7, "Historia", false, true, "")

		//habitaciones de prision
		var celda = new Habitacion(8, "Celda", true, false, "")
		var pasillo = new Habitacion(9, "Pasillo", false, false, "")
		var salaCentral = new Habitacion(10, "Sala central", false, false, "")
		var entradaPrision = new Habitacion(11, "Entrada", false, true, "")

		//habitaciones de hospital
		var salaInt = new Habitacion(12, "Sala de internacion", true, false, "")
		var hall = new Habitacion(13, "Hall central", false, true, "")
		var laboratorio = new Habitacion(14, "Laboratorio", false, false, "")
		var salaMaquinas = new Habitacion(15, "Sala de maquinas", false, false, "")

		//habitaciones de estacion de bomberos
		var oficina = new Habitacion(16, "Oficina", true, false, "")
		var bañoBomberos = new Habitacion(17, "Baño", false, true, "")
		var vestuario = new Habitacion(18, "Vestuario", false, false, "")

		var habitaciones = #[entrada, cocina, garage, living, baño, zoologia, biologia, historia, celda, pasillo,
			salaCentral, entradaPrision, salaInt, hall, laboratorio, salaMaquinas, oficina, bañoBomberos, vestuario]
		habitaciones
	}

	def habitacionesCasa() {
		var habCasa = newArrayList()
		for (var i = 0; i < 5; i++) {
			var h = habitaciones.get(i)
			habCasa.add(h)
		}
		return habCasa
	}

	def habsFinalesCasa() {
		var habFinales = habitacionesCasa

		val moverGarage = new Mover(1, habFinales.get(2))
		val moverLiving = new Mover(4, habFinales.get(3))
		val moverCocina = new Mover(6, habFinales.get(1))
		val usarLlaveCoc = new Usar(5, listaItems.get(1), moverCocina)
		val usarMartillo = new Usar(7, listaItems.get(0), moverCocina)

		//Entrada: Agarrar(Martillo), Mover(Garage)
		habFinales.get(0).agregarAccion(new Agarrar(0, listaItems.get(0)))
		habFinales.get(0).agregarAccion(moverGarage)

		//Cocina: Salir
		habFinales.get(1).agregarAccion(new Salir(2))

		//Garage: Agarrar(llave cocina), Mover(Living)
		habFinales.get(2).agregarAccion(new Agarrar(3, listaItems.get(1)))
		habFinales.get(2).agregarAccion(moverLiving)

		//Living: Usar(llave cocina) ---> Mover(cocina)
		habFinales.get(3).agregarAccion(usarLlaveCoc)

		//Baño: Usar(martillo) ---> Mover(cocina)
		habFinales.get(4).agregarAccion(usarMartillo)
		habFinales
	}

	def habitacionesMuseo() {
		var habMuseo = newArrayList()
		for (var i = 5; i < 8; i++) {
			var h = habitaciones.get(i)
			habMuseo.add(h)
		}
		return habMuseo
	}

	def habsFinalesMuseo() {
		var habFinales = habitacionesMuseo

		var moverBiologia = new Mover(9, habFinales.get(1))
		var usarPala = new Usar(10, listaItems.get(2), new Agarrar(11, listaItems.get(3)))
		var moverZoologia = new Mover(12, habFinales.get(2))
		var usarCuchillo = new Usar(13, listaItems.get(3), new Salir(14))

		//Zoologia: Agarrar(pala), Mover(Biologia)
		habFinales.get(0).agregarAccion(new Agarrar(8, listaItems.get(2)))
		habFinales.get(0).agregarAccion(moverBiologia)

		//Biologia: Usar(pala) ----> Agarrar(cuchillo); Mover(Zoologia)
		habFinales.get(1).agregarAccion(usarPala)
		habFinales.get(1).agregarAccion(moverZoologia)

		//Zoologia: Usar(cuchillo) ----> Salir
		habFinales.get(2).agregarAccion(usarCuchillo)
		habFinales
	}

	def habitacionesPrision() {
		var habPrision = newArrayList
		for (var i = 8; i < 12; i++) {
			var h = habitaciones.get(i)
			habPrision.add(h)
		}
		habPrision
	}

	def habsFinalesPrision() {
		var habFinales = habitacionesPrision

		var moverPasillo = new Mover(15, habFinales.get(1))
		var moverSalaCentral = new Mover(17, habFinales.get(2))
		var moverEntradaPrision = new Mover(19, habFinales.get(3))
		var usarPistola = new Usar(18, listaItems.get(4), moverEntradaPrision)
		var usarLlaveEntrada = new Usar(21, listaItems.get(5), new Salir(22))

		//Celda: Mover(Pasillo)
		habFinales.get(0).agregarAccion(moverPasillo)

		//Pasillo: Agarrar(pistola), Mover(SalaCentral)
		habFinales.get(1).agregarAccion(new Agarrar(16, listaItems.get(4)))
		habFinales.get(1).agregarAccion(moverSalaCentral)

		//Sala central: Usar(pistola) ---> Mover(entradaPrision); Agarrar(llaveEntradaPrision)
		habFinales.get(2).agregarAccion(usarPistola)
		habFinales.get(2).agregarAccion(new Agarrar(20, listaItems.get(5)))

		//Entrada prision: Usar(llaveEntrada) ---> Salir
		habFinales.get(3).agregarAccion(usarLlaveEntrada)
		habFinales
	}

	def habitacionesHospital() {
		var habHospital = newArrayList
		for (var i = 12; i < 16; i++) {
			var h = habitaciones.get(i)
			habHospital.add(h)
		}
		habHospital
	}

	def habsFinalesHospital() {
		var habFinales = habitacionesHospital

		var moverHall = new Mover(23, habFinales.get(1))
		var moverSalaMaquinas = new Mover(25, habFinales.get(3))
		var moverLaboratorio = new Mover(26, habFinales.get(2))
		var usarLlaveLabo = new Usar(28, listaItems.get(8), moverHall)
		var usarTuboGas = new Usar(29, listaItems.get(7), moverLaboratorio)
		var usarBisturi = new Usar(30, listaItems.get(6), new Salir(31))

		//Sala de internacion: Mover(Hall)
		habFinales.get(0).agregarAccion(moverHall)

		//Hall central: Agarrar(TuboGas), Mover(SalaMaquinas), Agarrar(llaveLabo)
		//				Usar(Bisturi) ---> Salir
		habFinales.get(1).agregarAccion(new Agarrar(24, listaItems.get(7)))
		habFinales.get(1).agregarAccion(moverSalaMaquinas)
		habFinales.get(1).agregarAccion(new Agarrar(26, listaItems.get(8)))
		habFinales.get(1).agregarAccion(usarBisturi)

		//Laboratorio: Agarrar(Bisturi), Usar(LlaveLabo) ---> Mover(Hall)
		habFinales.get(2).agregarAccion(new Agarrar(27, listaItems.get(6)))
		habFinales.get(2).agregarAccion(usarLlaveLabo)

		//Sala de maquinas: Usar(tuboGas) ---> Mover(Laboratorio)
		habFinales.get(3).agregarAccion(usarTuboGas)
		habFinales
	}

	def habitacionesBomberos() {
		var habBomberos = newArrayList
		for (var i = 16; i < 19; i++) {
			var h = habitaciones.get(i)
			habBomberos.add(h)
		}
		habBomberos
	}

	def habsFinalesBomberos() {
		var habFinales = habitacionesBomberos

		var moverVestuario = new Mover(33, habFinales.get(2))
		var usarDestornillador = new Usar(34, listaItems.get(10), new Salir(35))
		var moverBañoBomberos = new Mover(37, habFinales.get(1))
		var usarPalanca = new Usar(35, listaItems.get(9), new Agarrar(36, listaItems.get(10)))

		//Oficina: Agarrar(Palanca) , Mover(Vestuario)
		habFinales.get(0).agregarAccion(new Agarrar(32, listaItems.get(9)))
		habFinales.get(0).agregarAccion(moverVestuario)

		//Baño: Usar(Destornillador) ---> Salir
		habFinales.get(1).agregarAccion(usarDestornillador)

		//Vestuario: Usar(Palanca) ---> Agarrar(Destornillador); Mover(Baño)
		habFinales.get(2).agregarAccion(usarPalanca)
		habFinales.get(2).agregarAccion(moverBañoBomberos)

		habFinales
	}

	def habsFinales() {
		var habsFinales = newArrayList

		habsFinales.addAll(habsFinalesCasa)
		habsFinales.addAll(habsFinalesMuseo)
		habsFinales.addAll(habsFinalesPrision)
		habsFinales.addAll(habsFinalesHospital)
		habsFinales.addAll(habsFinalesBomberos)
		habsFinales
	}

	/**
 	* Este metodo genera los laberintos. Luego es llamado desde el controller.
 	*/
	def getLaberintosMinimizados() {

		#[
			new Laberinto(1, "Casa abandonada", "casa.jpg", habsFinalesCasa),
			new Laberinto(2, "Museo", "museo.jpg", habsFinalesMuseo),
			new Laberinto(3, "Prision", "prision.jpg", habsFinalesPrision),
			new Laberinto(4, "Hospital", "hospital.jpg", habsFinalesHospital),
			new Laberinto(5, "Estación de bomberos", "bomberos.jpg", habsFinalesBomberos)
		]
	}

	/**
 	* Este metodo genera los jugadores. Luego es llamado desde el controller.
 	*/
	def listaJugadores() {

		//Jugador1
		var jugador1 = new Jugador(1, "Player1")
		jugador1.agregarAlInventario(listaItems.get(1))
		jugador1.agregarAlInventario(listaItems.get(0))

		//Jugador2 en "Garage" con llave de la cocina
		var jugador2 = new Jugador(2, "Player2", habitaciones.get(2))
		jugador2.agregarAlInventario(listaItems.get(1))

		//Jugador3 en Cocina
		var jugador3 = new Jugador(3, "Jugador 3", habitaciones.get(1))

		jugador1.laberintos = laberintosMinimizados
		jugador2.laberintos = laberintosMinimizados
		jugador3.laberintos = laberintosMinimizados.tail.toList

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
		habsFinales.findFirst[it.id == id]
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
