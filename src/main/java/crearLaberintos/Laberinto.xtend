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

}
