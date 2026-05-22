package Controller.Gestiones;


import Model.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kate
 */
public class GestionarTipoMascota {

    public boolean agregar(String nombre) {
        String sql = "INSERT INTO TipoMascota(nombre) VALUES(?)";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, nombre);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public List<tipoMascota> listar() {
        List<tipoMascota> lista = new ArrayList<>();
        String sql = "SELECT * FROM TipoMascota ORDER BY nombre";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                tipoMascota t = new tipoMascota();
                t.setIdTipoMascota(rs.getInt("idTipoMascota"));
                t.setNombre(rs.getString("nombre"));
                lista.add(t);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return lista;
    }

    public tipoMascota obtenerPorId(int id) {
        String sql = "SELECT * FROM TipoMascota WHERE idTipoMascota=?";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                tipoMascota t = new tipoMascota();
                t.setIdTipoMascota(rs.getInt("idTipoMascota"));
                t.setNombre(rs.getString("nombre"));
                return t;
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public boolean actualizar(int id, String nombre) {
        String sql = "UPDATE TipoMascota SET nombre=? WHERE idTipoMascota=?";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, nombre);
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM TipoMascota WHERE idTipoMascota=?";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public boolean AgregarMascota(String nombre) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
