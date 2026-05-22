/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.Gestiones;

import Model.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GestionarMascota {

    // =========================
    // AGREGAR MASCOTA
    // =========================
    public boolean agregar(String nombre, String raza, int edad,
                           String genero, String foto,
                           int idTipo, int idPropietario) {

        String sql = "INSERT INTO Mascota(nombre, raza, edad, genero, foto, idTipoMascota, idPropietario) "
                   + "VALUES(?,?,?,?,?,?,?)";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, nombre);
            ps.setString(2, raza);
            ps.setInt(3, edad);
            ps.setString(4, genero);
            ps.setString(5, foto);
            ps.setInt(6, idTipo);
            ps.setInt(7, idPropietario);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // =========================
    // LISTAR TODAS LAS MASCOTAS
    // =========================
    public List<Mascota> listar() {
    List<Mascota> lista = new ArrayList<>();
    String sql = "SELECT m.*, "
               + "tm.nombre AS nombreTipo, "
               + "CONCAT(pr.nombre,' ',pr.apellidos) AS nombrePropietario, "
               + "GROUP_CONCAT(t.nombreTx SEPARATOR ', ') AS nombreTratamiento, "
               + "GROUP_CONCAT(CONCAT(p.nombreProfesional,' ',p.apellidoProfesional) SEPARATOR ', ') AS nombreProfesional "
               + "FROM Mascota m "
               + "LEFT JOIN TipoMascota tm ON m.idTipoMascota = tm.idTipoMascota "
               + "LEFT JOIN Propietario pr ON m.idPropietario = pr.idPropietario "
               + "LEFT JOIN MascotaTratamientos mt ON m.idMascota = mt.idMascota "
               + "LEFT JOIN Tratamiento t ON mt.idTx = t.idTx "
               + "LEFT JOIN Profesionales p ON t.idProfesional = p.idProfesional "
               + "GROUP BY m.idMascota";
    try (Connection con = ConexionBD.getConexion();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
            Mascota m = new Mascota();
            m.setIdMascota(rs.getInt("idMascota"));
            m.setNombre(rs.getString("nombre"));
            m.setRaza(rs.getString("raza"));
            m.setEdad(rs.getInt("edad"));
            m.setGenero(rs.getString("genero"));
            m.setFoto(rs.getString("foto"));
            m.setIdTipoMascota(rs.getInt("idTipoMascota"));
            m.setIdPropietario(rs.getInt("idPropietario"));
            m.setNombreTipo(rs.getString("nombreTipo"));
            m.setNombrePropietario(rs.getString("nombrePropietario"));
            m.setNombreTx(rs.getString("nombreTratamiento"));
            m.setNombreProfesional(rs.getString("nombreProfesional"));
            lista.add(m);
        }
    } catch (SQLException e) { e.printStackTrace(); }
    return lista;
}

public List<Mascota> listarPorPropietario(int idPropietario) {
    List<Mascota> lista = new ArrayList<>();
    String sql = "SELECT m.*, "
               + "tm.nombre AS nombreTipo, "
               + "CONCAT(pr.nombre,' ',pr.apellidos) AS nombrePropietario, "
               + "GROUP_CONCAT(t.nombreTx SEPARATOR ', ') AS nombreTratamiento, "
               + "GROUP_CONCAT(CONCAT(p.nombreProfesional,' ',p.apellidoProfesional) SEPARATOR ', ') AS nombreProfesional "
               + "FROM Mascota m "
               + "LEFT JOIN TipoMascota tm ON m.idTipoMascota = tm.idTipoMascota "
               + "LEFT JOIN Propietario pr ON m.idPropietario = pr.idPropietario "
               + "LEFT JOIN MascotaTratamientos mt ON m.idMascota = mt.idMascota "
               + "LEFT JOIN Tratamiento t ON mt.idTx = t.idTx "
               + "LEFT JOIN Profesionales p ON t.idProfesional = p.idProfesional "
               + "WHERE m.idPropietario = ? "
               + "GROUP BY m.idMascota";
    try (Connection con = ConexionBD.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, idPropietario);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Mascota m = new Mascota();
            m.setIdMascota(rs.getInt("idMascota"));
            m.setNombre(rs.getString("nombre"));
            m.setRaza(rs.getString("raza"));
            m.setEdad(rs.getInt("edad"));
            m.setGenero(rs.getString("genero"));
            m.setFoto(rs.getString("foto"));
            m.setIdTipoMascota(rs.getInt("idTipoMascota"));
            m.setIdPropietario(rs.getInt("idPropietario"));
            m.setNombreTipo(rs.getString("nombreTipo"));
            m.setNombrePropietario(rs.getString("nombrePropietario"));
            m.setNombreTx(rs.getString("nombreTratamiento"));
            m.setNombreProfesional(rs.getString("nombreProfesional"));
            lista.add(m);
        }
    } catch (SQLException e) { e.printStackTrace(); }
    return lista;
}

    // =========================
    // OBTENER MASCOTA POR ID
    // =========================
    public Mascota obtenerPorId(int id) {
    String sql = "SELECT m.*, "
               + "tm.nombre AS nombreTipo, "
               + "CONCAT(pr.nombre,' ',pr.apellidos) AS nombrePropietario, "
               + "GROUP_CONCAT(t.nombreTx SEPARATOR ', ') AS nombreTratamiento, "
               + "GROUP_CONCAT(CONCAT(p.nombreProfesional,' ',p.apellidoProfesional) SEPARATOR ', ') AS nombreProfesional "
               + "FROM Mascota m "
               + "LEFT JOIN TipoMascota tm ON m.idTipoMascota = tm.idTipoMascota "
               + "LEFT JOIN Propietario pr ON m.idPropietario = pr.idPropietario "
               + "LEFT JOIN MascotaTratamientos mt ON m.idMascota = mt.idMascota "
               + "LEFT JOIN Tratamiento t ON mt.idTx = t.idTx "
               + "LEFT JOIN Profesionales p ON t.idProfesional = p.idProfesional "
               + "WHERE m.idMascota = ? "
               + "GROUP BY m.idMascota";
    try (Connection con = ConexionBD.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Mascota m = new Mascota();
            m.setIdMascota(rs.getInt("idMascota"));
            m.setNombre(rs.getString("nombre"));
            m.setRaza(rs.getString("raza"));
            m.setEdad(rs.getInt("edad"));
            m.setGenero(rs.getString("genero"));
            m.setFoto(rs.getString("foto"));
            m.setIdTipoMascota(rs.getInt("idTipoMascota"));
            m.setIdPropietario(rs.getInt("idPropietario"));
            m.setNombreTipo(rs.getString("nombreTipo"));
            m.setNombrePropietario(rs.getString("nombrePropietario"));
            m.setNombreTx(rs.getString("nombreTratamiento"));
            m.setNombreProfesional(rs.getString("nombreProfesional"));
            return m;
        }
    } catch (SQLException e) { e.printStackTrace(); }
    return null;
}

    // =========================
    // ACTUALIZAR MASCOTA
    // =========================
    public boolean actualizar(int id, String nombre, String raza, int edad,
                              String genero, String foto,
                              int idTipo, int idPropietario) {

        String sql = "UPDATE Mascota "
                   + "SET nombre=?, raza=?, edad=?, genero=?, foto=?, "
                   + "idTipoMascota=?, idPropietario=? "
                   + "WHERE idMascota=?";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, nombre);
            ps.setString(2, raza);
            ps.setInt(3, edad);
            ps.setString(4, genero);
            ps.setString(5, foto);

            ps.setInt(6, idTipo);
            ps.setInt(7, idPropietario);

            ps.setInt(8, id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // =========================
    // ELIMINAR MASCOTA
    // =========================
    public boolean eliminar(int id) {

        String sql = "DELETE FROM Mascota WHERE idMascota=?";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

  