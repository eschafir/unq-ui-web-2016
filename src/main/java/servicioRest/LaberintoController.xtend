package servicioRest

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import crearLaberintos.Laberinto
import org.uqbar.xtrest.api.XTRest

@Controller
class LaberintoController {
	extension JSONUtils = new JSONUtils

	@Get("/laberintos")
	def mostrarLista() {
		response.contentType = "application/json"
		var laberintos = new Laberinto()
		ok(laberintos.listaLaberintos().toJson)
	}

	def static void main(String[] args) {

		XTRest.start(LaberintoController, 9000)
	}
}
