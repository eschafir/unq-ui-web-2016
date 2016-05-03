package servicioRest

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import crearLaberintos.Laberinto
import org.uqbar.xtrest.api.XTRest
import repo.Repo

@Controller
class LaberintoController {
	extension JSONUtils = new JSONUtils

	@Get("/laberintos")
	def mostrarLista() {
		response.contentType = "application/json"
		
		var repo = new Repo()
		
		var idJugador = .....
		val jugador = repo.getJugador(idJugador)
		val todosLosLabs = repo.getLaberintos()
		val laberintos = LaberintoFactory.conEstadoPara(laberintos, usaurio)..............]
		ok(laberintos.toJson)
	}

	def static void main(String[] args) {

		XTRest.start(LaberintoController, 9000)
	}
}
