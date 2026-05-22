/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.Gestiones;

/**
 *
 * @author crist
 */
public class Profesional {
    private int    idProfesional;
    private String nombreProfesional;
    private String apellidoProfesional;
    private String cedulaProfesional;
    private String telefonoProfesional;
    private String correoProfesional;
    private String tipoProfesional;

    public Profesional() {
    }

    public Profesional(int idProfesional, String nombreProfesional, String apellidoProfesional, String cedulaProfesional, String telefonoProfesional, String correoProfesional, String tipoProfesional) {
        this.idProfesional = idProfesional;
        this.nombreProfesional = nombreProfesional;
        this.apellidoProfesional = apellidoProfesional;
        this.cedulaProfesional = cedulaProfesional;
        this.telefonoProfesional = telefonoProfesional;
        this.correoProfesional = correoProfesional;
        this.tipoProfesional = tipoProfesional;
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

    public String getApellidoProfesional() {
        return apellidoProfesional;
    }

    public void setApellidoProfesional(String apellidoProfesional) {
        this.apellidoProfesional = apellidoProfesional;
    }

    public String getCedulaProfesional() {
        return cedulaProfesional;
    }

    public void setCedulaProfesional(String cedulaProfesional) {
        this.cedulaProfesional = cedulaProfesional;
    }

    public String getTelefonoProfesional() {
        return telefonoProfesional;
    }

    public void setTelefonoProfesional(String telefonoProfesional) {
        this.telefonoProfesional = telefonoProfesional;
    }

    public String getCorreoProfesional() {
        return correoProfesional;
    }

    public void setCorreoProfesional(String correoProfesional) {
        this.correoProfesional = correoProfesional;
    }

    public String getTipoProfesional() {
        return tipoProfesional;
    }

    public void setTipoProfesional(String tipoProfesional) {
        this.tipoProfesional = tipoProfesional;
    }
    
    
    
    
}

