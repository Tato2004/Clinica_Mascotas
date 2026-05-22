package Controller.Gestiones;

public class Mascota {

    private int idMascota;
    private String nombre;
    private String raza;
    private int edad;
    private String genero;
    private String foto;

    private int idTipoMascota;
    private int idPropietario;

    // JOIN básicos
    private String nombreTipo;
    private String nombrePropietario;

    // 🔥 NUEVO JOIN (tratamiento + profesional)
    private String nombreTx;
    private String nombreProfesional;

    // CONSTRUCTOR VACÍO
    public Mascota() {
    }

    // CONSTRUCTOR COMPLETO (básico)
    public Mascota(int idMascota, String nombre, String raza, int edad, String genero, String foto) {
        this.idMascota = idMascota;
        this.nombre = nombre;
        this.raza = raza;
        this.edad = edad;
        this.genero = genero;
        this.foto = foto;
    }

    // GETTERS Y SETTERS

    public int getIdMascota() {
        return idMascota;
    }

    public void setIdMascota(int idMascota) {
        this.idMascota = idMascota;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public int getIdTipoMascota() {
        return idTipoMascota;
    }

    public void setIdTipoMascota(int idTipoMascota) {
        this.idTipoMascota = idTipoMascota;
    }

    public int getIdPropietario() {
        return idPropietario;
    }

    public void setIdPropietario(int idPropietario) {
        this.idPropietario = idPropietario;
    }

    public String getNombreTipo() {
        return nombreTipo;
    }

    public void setNombreTipo(String nombreTipo) {
        this.nombreTipo = nombreTipo;
    }

    public String getNombrePropietario() {
        return nombrePropietario;
    }

    public void setNombrePropietario(String nombrePropietario) {
        this.nombrePropietario = nombrePropietario;
    }

    // 🔥 NUEVOS (TRATAMIENTO)

    public String getNombreTx() {
        return nombreTx;
    }

    public void setNombreTx(String nombreTx) {
        this.nombreTx = nombreTx;
    }

    public String getNombreProfesional() {
        return nombreProfesional;
    }

    public void setNombreProfesional(String nombreProfesional) {
        this.nombreProfesional = nombreProfesional;
    }
}