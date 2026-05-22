package Controller.Gestiones;

import Model.ConexionBD;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GestionarTratamientos {

    // =========================
    // AGREGAR
    // =========================
    public boolean agregar(String nombreTx, Timestamp fechaTx,
                           double precio, String descripcion,
                           int idProfesional) {

        String sql = "INSERT INTO Tratamiento "
                   + "(nombreTx, fechaTx, precio, descripcionTx, idProfesional) "
                   + "VALUES (?,?,?,?,?)";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, nombreTx);
            ps.setTimestamp(2, fechaTx);
            ps.setDouble(3, precio);
            ps.setString(4, descripcion);
            ps.setInt(5, idProfesional);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {

            System.out.println("ERROR AL INSERTAR TRATAMIENTO");
            e.printStackTrace();
            return false;
        }
    }

    // =========================
    // LISTAR
    // =========================
    public List<Tratamientos> listar() {

        List<Tratamientos> lista = new ArrayList<>();

        String sql = "SELECT t.*, p.nombreProfesional "
                   + "FROM Tratamiento t "
                   + "LEFT JOIN Profesionales p "
                   + "ON t.idProfesional = p.idProfesional";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Tratamientos t = new Tratamientos();

                t.setIdTx(rs.getInt("idTx"));
                t.setNombreTx(rs.getString("nombreTx"));
                t.setFechaTx(rs.getTimestamp("fechaTx"));
                t.setPrecio(rs.getDouble("precio"));
                t.setDescripcionTx(rs.getString("descripcionTx"));
                t.setIdProfesional(rs.getInt("idProfesional"));
                t.setNombreProfesional(rs.getString("nombreProfesional"));

                lista.add(t);
            }

        } catch (SQLException e) {

            System.out.println("ERROR AL LISTAR TRATAMIENTOS");
            e.printStackTrace();
        }

        return lista;
    }

    // =========================
    // OBTENER POR ID
    // =========================
    public Tratamientos obtenerPorId(int id) {

        String sql = "SELECT t.*, p.nombreProfesional "
                   + "FROM Tratamiento t "
                   + "LEFT JOIN Profesionales p "
                   + "ON t.idProfesional = p.idProfesional "
                   + "WHERE t.idTx = ?";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Tratamientos t = new Tratamientos();

                t.setIdTx(rs.getInt("idTx"));
                t.setNombreTx(rs.getString("nombreTx"));
                t.setFechaTx(rs.getTimestamp("fechaTx"));
                t.setPrecio(rs.getDouble("precio"));
                t.setDescripcionTx(rs.getString("descripcionTx"));
                t.setIdProfesional(rs.getInt("idProfesional"));
                t.setNombreProfesional(rs.getString("nombreProfesional"));

                return t;
            }

        } catch (SQLException e) {

            System.out.println("ERROR AL OBTENER TRATAMIENTO");
            e.printStackTrace();
        }

        return null;
    }

    // =========================
    // ACTUALIZAR
    // =========================
    public boolean actualizar(int id, String nombreTx,
                              Timestamp fechaTx,
                              double precio,
                              String descripcion,
                              int idProfesional) {

        String sql = "UPDATE Tratamiento SET "
                   + "nombreTx=?, fechaTx=?, precio=?, "
                   + "descripcionTx=?, idProfesional=? "
                   + "WHERE idTx=?";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, nombreTx);
            ps.setTimestamp(2, fechaTx);
            ps.setDouble(3, precio);
            ps.setString(4, descripcion);
            ps.setInt(5, idProfesional);
            ps.setInt(6, id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {

            System.out.println("ERROR AL ACTUALIZAR");
            e.printStackTrace();
            return false;
        }
    }

    // =========================
    // ELIMINAR
    // =========================
    public boolean eliminar(int id) {

        String sql = "DELETE FROM Tratamiento WHERE idTx=?";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {

            System.out.println("ERROR AL ELIMINAR");
            e.printStackTrace();
            return false;
        }
    }

    // =========================
    // VINCULAR MASCOTA
    // =========================
    public boolean vincularMascota(int idTx, int idMascota) {

        String sql =
            "INSERT INTO MascotaTratamientos(idMascota,idTx) "
          + "VALUES(?,?)";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idMascota);
            ps.setInt(2, idTx);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }

    // =========================
    // DESVINCULAR MASCOTA
    // =========================
    public boolean desvincularMascota(int idTx, int idMascota) {

        String sql =
            "DELETE FROM MascotaTratamientos "
          + "WHERE idTx=? AND idMascota=?";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idTx);
            ps.setInt(2, idMascota);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }

    // =========================
    // LISTAR MASCOTAS VINCULADAS
    // =========================
    public List<Mascota> mascotasDeTratamientos(int idTx) {

        List<Mascota> lista = new ArrayList<>();

        String sql =
            "SELECT m.* FROM Mascota m "
          + "INNER JOIN MascotaTratamientos mt "
          + "ON m.idMascota = mt.idMascota "
          + "WHERE mt.idTx=?";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idTx);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Mascota m = new Mascota();

                m.setIdMascota(rs.getInt("idMascota"));
                m.setNombre(rs.getString("nombre"));
                m.setRaza(rs.getString("raza"));
                m.setEdad(rs.getInt("edad"));
                m.setGenero(rs.getString("genero"));
                m.setFoto(rs.getString("foto"));

                lista.add(m);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return lista;
    }
}