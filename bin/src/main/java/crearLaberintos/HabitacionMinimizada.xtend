package crearLaberintos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import unq_ciu.gatoEncerrado.Accion
import repo.Repo

@Accessors
class HabitacionMinimizada {
	int id
	String nombre
	List<AccionMinimizada> acciones
	String path

	new(int id, String nombre, List<Accion> acciones, String path) {
		this.id = id
		this.nombre = nombre
		this.acciones = Repo.minimizarAcciones(acciones)
		this.path = path
	}
}
