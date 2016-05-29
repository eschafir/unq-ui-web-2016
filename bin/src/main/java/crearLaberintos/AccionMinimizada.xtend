package crearLaberintos

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AccionMinimizada {
	int id
	String nombre

	new(int id, String nombre) {
		this.id = id
		this.nombre = nombre
	}
}
