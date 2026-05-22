package Controller.Gestiones;

import java.sql.Timestamp;

public class Tratamientos {

    private int idTx;
    private String nombreTx;
    private Timestamp fechaTx;
    private double precio;
    private String descripcionTx;
    private int idProfesional;

    // 🔥 para mostrar en tabla (JOIN)
    private String nombreProfesional;

    public Tratamientos() {
    }

    public Tratamientos(int idTx, String nombreTx, Timestamp fechaTx,
                        double precio, String descripcionTx,
                        int idProfesional, String nombreProfesional) {
        this.idTx = idTx;
        this.nombreTx = nombreTx;
        this.fechaTx = fechaTx;
        this.precio = precio;
        this.descripcionTx = descripcionTx;
        this.idProfesional = idProfesional;
        this.nombreProfesional = nombreProfesional;
    }

    public int getIdTx() {
        return idTx;
    }

    public void setIdTx(int idTx) {
        this.idTx = idTx;
    }

    public String getNombreTx() {
        return nombreTx;
    }

    public void setNombreTx(String nombreTx) {
        this.nombreTx = nombreTx;
    }

    public Timestamp getFechaTx() {
        return fechaTx;
    }

    public void setFechaTx(Timestamp fechaTx) {
        this.fechaTx = fechaTx;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDescripcionTx() {
        return descripcionTx;
    }

    public void setDescripcionTx(String descripcionTx) {
        this.descripcionTx = descripcionTx;
    }

    public int getIdProfesional() {
        return idProfesional;
    }

    public void setIdProfesional(int idProfesional) {
        this.idProfesional = idProfesional;
    }

    public String getNombreProfesional() {
        return nombreProfesional;
    }

    public void setNombreProfesional(String nombreProfesional) {
        this.nombreProfesional = nombreProfesional;
    }
}