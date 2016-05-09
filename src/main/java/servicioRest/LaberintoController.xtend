package servicioRest

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.XTRest
import repo.Repo
import crearLaberintos.LaberintoFactory

@Controller
class LaberintoController {
	extension JSONUtils = new JSONUtils

	@Get("/laberintos")
	def mostrarLaberintos() {
		response.contentType = "application/json"

		val repo = new Repo()

		ok(repo.laberintos.toJson)
	}

	@Get("/laberintos/:userid")
	def mostrarLista() {
		response.contentType = "application/json"

		val idJugador = Long.parseLong(userid)

		var repo = new Repo()
		val jugador = repo.getJugador(idJugador)
		val laberinto = repo.getLaberinto(idJugador)

		//val todosLosLaberintos = repo.getLaberintos()
		//val laberintos = LaberintoFactory.conEstadoPara(todosLosLaberintos, jugador)
		//ok(jugador.laberintos.toJson)
		ok(laberinto.toJson)
	}

	@Get("/iniciarLaberinto")
	def mostrarDatosLaberinto(String uid, String lid) {
		response.contentType = "application/json"

		val idJugador = Long.parseLong(uid)
		val idLab = Long.parseLong(lid)

		var repo = new Repo()
		val jugador = repo.getJugador(idJugador)
		val laberinto = repo.getLaberinto(idLab)
		
		val respuesta = new LaberintoFactory(laberinto, jugador)
		ok(respuesta.toJson)
	}

	def static void main(String[] args) {

		XTRest.start(LaberintoController, 9000)
	}
}
