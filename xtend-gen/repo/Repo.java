package repo;

import crearLaberintos.Laberinto;

@SuppressWarnings("all")
public class Repo {
  public Repo() {
  }
  
  /**
   * Este metodo genera los laberintos. Luego es llamado desde el controller.
   */
  public java.util.List getLaberintos() {
    Laberinto _laberinto = new Laberinto(1, "Casa embrujada", "saraza");
    Laberinto _laberinto_1 = new Laberinto(2, "Museo", "lalala");
    return Collections.<Object>unmodifiableList(org.eclipse.xtext.xbase.lib.CollectionLiterals.<Object>newArrayList(_laberinto, _laberinto_1));
  }
  
  public java.util.List listaJugadores() {
    throw new Error("Unresolved compilation problems:"
      + "\nJugador cannot be resolved."
      + "\nJugador cannot be resolved.");
  }
  
  public Object getJugador(final /* Long */Object id) {
    throw new Error("Unresolved compilation problems:"
      + "\nfindFirst cannot be resolved"
      + "\nid cannot be resolved"
      + "\n== cannot be resolved");
  }
}
