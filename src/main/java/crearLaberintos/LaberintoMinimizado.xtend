package crearLaberintos

import org.eclipse.xtend.lib.annotations.Accessors
import unq_ciu.gatoEncerrado.Laberinto

@Accessors
class LaberintoMinimizado {
	int laberintoId
	String nombre
	String path

	new(int laberintoID, String nombre, String path) {
		this.laberintoId = laberintoID
		this.nombre = nombre
		this.path = path
	}

	new(Laberinto l) {
		this.laberintoId = l.id
		this.nombre = l.nombre
		this.path = l.path
	}
}
