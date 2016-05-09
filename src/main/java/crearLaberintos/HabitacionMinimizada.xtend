package crearLaberintos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import unq_ciu.gatoEncerrado.Accion
import java.util.ArrayList

@Accessors
class HabitacionMinimizada {
	int id
	String nombre
	List<Accion> acciones
	String path
	
	new(int id, String nom, String path ){
		this. id = id
		this.nombre = nombre
		this.acciones = new ArrayList<Accion>()
		this.path = path
	}
}