package crearLaberintos

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class LaberintoMinimizado {
	int laberintoId
	String nombre
	String path

	new(int laberintoID, String nombre, String path){
		this.laberintoId = laberintoID
		this.nombre = nombre
		this.path = path
	}
}
