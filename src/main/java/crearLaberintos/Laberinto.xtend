package crearLaberintos

import org.eclipse.xtend.lib.annotations.Accessors
/**
 * 
 * ESTA CLASE SIMULA SER UNA LISTA DE LABERINTOS FICTICIA.
 * 
 */
@Accessors
class Laberinto {
	int id
	String nombre
	String path

	new() {
	}

	new(int id, String nombre, String path) {
		this.id = id
		this.nombre = nombre
		this.path = path
	}

/**
 * Este metodo genera los laberintos. Luego es llamado desde el controller.
 */
	def listaLaberintos() {
		#[
			new Laberinto(1, "Casa embrujada", "saraza"),
			new Laberinto(2, "Museo", "lalala")
		]
	}

}
