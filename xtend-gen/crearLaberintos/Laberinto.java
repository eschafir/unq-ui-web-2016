package crearLaberintos;

/**
 * ESTA CLASE SIMULA SER UNA LISTA DE LABERINTOS FICTICIA.
 */
/* @Accessors
 */@SuppressWarnings("all")
public class Laberinto {
  private int id;
  
  private /* String */Object nombre;
  
  private /* String */Object path;
  
  public Laberinto() {
  }
  
  public Laberinto(final int id, final /* String */Object nombre, final /* String */Object path) {
    this.id = id;
    this.nombre = nombre;
    this.path = path;
  }
}
