package crearLaberintos;

/* @Accessors
 */@SuppressWarnings("all")
public class LaberintoMinimizado {
  private int laberintoId;
  
  private /* String */Object nombre;
  
  private /* String */Object path;
  
  public LaberintoMinimizado(final int laberintoID, final /* String */Object nombre, final /* String */Object path) {
    this.laberintoId = laberintoID;
    this.nombre = nombre;
    this.path = path;
  }
  
  public LaberintoMinimizado(final /* Laberinto */Object l) {
    throw new Error("Unresolved compilation problems:"
      + "\nid cannot be resolved"
      + "\nnombre cannot be resolved"
      + "\npath cannot be resolved");
  }
}
