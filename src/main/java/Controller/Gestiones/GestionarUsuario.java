package Controller.Gestiones;

import Model.ConexionBD;
import java.sql.*;

public class GestionarUsuario {

    public Usuario login(String usuario, String clave) {
        String sql = "SELECT * FROM Usuario WHERE usuario=? AND clave=?";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, usuario);
            ps.setString(2, clave);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Usuario u = new Usuario();
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setUsuario(rs.getString("usuario"));
                u.setClave(rs.getString("clave"));
                u.setRol(rs.getString("rol"));
                u.setIdPropietario(rs.getInt("idPropietario"));
                return u;
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    // Obtener idPropietario desde idUsuario
    public int obtenerIdPropietario(int idUsuario) {
        String sql = "SELECT idPropietario FROM Usuario WHERE idUsuario=?";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("idPropietario");
        } catch (SQLException e) { e.printStackTrace(); }
        return -1;
    }
}