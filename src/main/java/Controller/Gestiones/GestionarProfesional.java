package Controller.Gestiones;

import Model.ConexionBD;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GestionarProfesional {

    public boolean agregar(String nombre, String apellido,
                           String telefono, String correo,
                           String cedula, String tipo) {

        String sql = "INSERT INTO Profesionales "
                   + "(nombreProfesional, apellidoProfesional, telefonoProfesional, "
                   + "correoProfesional, cedulaProfesional, tipoProfesional) "
                   + "VALUES (?,?,?,?,?,?)";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, telefono);
            ps.setString(4, correo);
            ps.setString(5, cedula);
            ps.setString(6, tipo);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Profesional> listar() {

        List<Profesional> lista = new ArrayList<>();

        String sql = "SELECT * FROM Profesionales";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Profesional p = new Profesional();

                p.setIdProfesional(rs.getInt("idProfesional"));
                p.setNombreProfesional(rs.getString("nombreProfesional"));
                p.setApellidoProfesional(rs.getString("apellidoProfesional"));
                p.setTelefonoProfesional(rs.getString("telefonoProfesional"));
                p.setCorreoProfesional(rs.getString("correoProfesional"));
                p.setCedulaProfesional(rs.getString("cedulaProfesional"));
                p.setTipoProfesional(rs.getString("tipoProfesional"));

                lista.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    public Profesional obtenerPorId(int id) {

        String sql = "SELECT * FROM Profesionales WHERE idProfesional=?";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    Profesional p = new Profesional();

                    p.setIdProfesional(rs.getInt("idProfesional"));
                    p.setNombreProfesional(rs.getString("nombreProfesional"));
                    p.setApellidoProfesional(rs.getString("apellidoProfesional"));
                    p.setTelefonoProfesional(rs.getString("telefonoProfesional"));
                    p.setCorreoProfesional(rs.getString("correoProfesional"));
                    p.setCedulaProfesional(rs.getString("cedulaProfesional"));
                    p.setTipoProfesional(rs.getString("tipoProfesional"));

                    return p;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean actualizar(int id, String nombre, String apellido,
                              String telefono, String correo,
                              String cedula, String tipo) {

        String sql = "UPDATE Profesionales SET "
                   + "nombreProfesional=?, apellidoProfesional=?, telefonoProfesional=?, "
                   + "correoProfesional=?, cedulaProfesional=?, tipoProfesional=? "
                   + "WHERE idProfesional=?";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, telefono);
            ps.setString(4, correo);
            ps.setString(5, cedula);
            ps.setString(6, tipo);
            ps.setInt(7, id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminar(int id) {

        String sql = "DELETE FROM Profesionales WHERE idProfesional=?";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean agregarConUsuario(String nombre, String apellido, String telefono,
                                  String correo, String cedula, String tipo,
                                  String usuario, String clave) {

    String sqlProf = "INSERT INTO Profesionales(nombreProfesional,apellidoProfesional,"
                   + "telefonoProfesional,correoProfesional,cedulaProfesional,tipoProfesional)"
                   + " VALUES(?,?,?,?,?,?)";

    String sqlUser = "INSERT INTO Usuario(usuario,clave,rol,idPropietario)"
                   + " VALUES(?,?,?,NULL)";

    try (Connection con = ConexionBD.getConexion()) {

        // 1. Insertar profesional
        PreparedStatement ps1 = con.prepareStatement(sqlProf);
        ps1.setString(1, nombre);
        ps1.setString(2, apellido);
        ps1.setString(3, telefono);
        ps1.setString(4, correo);
        ps1.setString(5, cedula);
        ps1.setString(6, tipo);
        ps1.executeUpdate();

        // 2. Insertar usuario con el rol según tipo
        PreparedStatement ps2 = con.prepareStatement(sqlUser);
        ps2.setString(1, usuario);
        ps2.setString(2, clave);
        ps2.setString(3, tipo); // "medico" o "estetico"
        ps2.executeUpdate();

        return true;

    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
}