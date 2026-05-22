package Controller.Gestiones;


import Model.ConexionBD;
import java.sql.*;
import java.util.*;

public class GestionarPropietario {

   public boolean registrarPropietarioConUsuario(Propietario p, String usuario, String clave) {

    String sqlProp = "INSERT INTO Propietario(nombre,apellidos,cedula,telefono,direccion,correo) VALUES (?,?,?,?,?,?)";
    String sqlUser = "INSERT INTO Usuario(usuario,clave,rol,idPropietario) VALUES (?,?,?,?)";

    try (Connection con = ConexionBD.getConexion()) {

        // 1. INSERT PROPIETARIO
        PreparedStatement ps1 = con.prepareStatement(sqlProp, Statement.RETURN_GENERATED_KEYS);

        ps1.setString(1, p.getNombre());
        ps1.setString(2, p.getApellidos());
        ps1.setString(3, p.getCedula());
        ps1.setString(4, p.getTelefono());
        ps1.setString(5, p.getDireccion());
        ps1.setString(6, p.getCorreo());

        ps1.executeUpdate();

        ResultSet rs = ps1.getGeneratedKeys();
        int idProp = 0;

        if (rs.next()) {
            idProp = rs.getInt(1);
        }

        // 2. INSERT USUARIO
        PreparedStatement ps2 = con.prepareStatement(sqlUser);

        ps2.setString(1, usuario);
        ps2.setString(2, clave);
        ps2.setString(3, "propietario");
        ps2.setInt(4, idProp);

        ps2.executeUpdate();

        return true;

    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }

    }

    public List<Propietario> listar() {
        List<Propietario> lista = new ArrayList<>();
        String sql = "SELECT * FROM Propietario ORDER BY nombre";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Propietario p = new Propietario();
                p.setIdPropietario(rs.getInt("idPropietario"));
                p.setNombre(rs.getString("nombre"));
                p.setApellidos(rs.getString("apellidos"));
                p.setCedula(rs.getString("cedula"));
                p.setTelefono(rs.getString("telefono"));
                p.setDireccion(rs.getString("direccion"));
                p.setCorreo(rs.getString("correo"));
                lista.add(p);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return lista;
    }

    public Propietario obtenerPorId(int id) {
        String sql = "SELECT * FROM Propietario WHERE idPropietario=?";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Propietario p = new Propietario();
                p.setIdPropietario(rs.getInt("idPropietario"));
                p.setNombre(rs.getString("nombre"));
                p.setApellidos(rs.getString("apellidos"));
                p.setCedula(rs.getString("cedula"));
                p.setTelefono(rs.getString("telefono"));
                p.setDireccion(rs.getString("direccion"));
                p.setCorreo(rs.getString("correo"));
                return p;
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public boolean actualizar(int id, String nombre, String apellido, String cedula,
                               String telefono, String direccion, String correo) {
        String sql = "UPDATE Propietario SET nombre=?,apellidos=?,cedula=?,"
                   + "telefono=?,direccion=?,correo=? WHERE idPropietario=?";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, cedula);
            ps.setString(4, telefono);
            ps.setString(5, direccion);
            ps.setString(6, correo);
            ps.setInt(7, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM Propietario WHERE idPropietario=?";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
}