package crearLaberintos

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import repo.Repo
import unq_ciu.gatoEncerrado.Item
import unq_ciu.gatoEncerrado.Jugador
import unq_ciu.gatoEncerrado.Laberinto

@Accessors
class IniciarLaberintoMinimizado {
	int laberintoId
	List<HabitacionMinimizada> habitaciones
	List<Item> inventario

	new(Jugador j, Laberinto l) {
		this.laberintoId = l.id
		this.inventario = j.inventario
		this.habitaciones = Repo.minimizarHabitaciones(l)
	}

	def encontrarInicial() {
		for (HabitacionMinimizada h : habitaciones) {
		}
	}

	def static iniciarLaberinto(Jugador j, Laberinto l) {
		new IniciarLaberintoMinimizado(j, l)
	}

}
