package Controller.Gestiones;

/**
 *
 * @author Kate
 */
public class tipoMascota {
    // atributos
    private int idTipoMascota;
    private String nombre;

    public tipoMascota() {
    }

    public tipoMascota(int idTipoMascota, String nombre) {
        this.idTipoMascota = idTipoMascota;
        this.nombre = nombre;
    }

    public int getIdTipoMascota() {
        return idTipoMascota;
    }

    public void setIdTipoMascota(int idTipoMascota) {
        this.idTipoMascota = idTipoMascota;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
