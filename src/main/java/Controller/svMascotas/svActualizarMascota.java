package Controller.svMascotas;
import Controller.Gestiones.GestionarMascota;
import Controller.Gestiones.Mascota;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet(name = "svActualizarMascota", urlPatterns = {"/svActualizarMascota"})
public class svActualizarMascota extends HttpServlet {

    // 🔵 CARGAR DATOS PARA EDITAR (GET)
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));

            GestionarMascota gm = new GestionarMascota();

            Mascota mascota = gm.obtenerPorId(id);

            req.setAttribute("mascota", mascota);

            req.getRequestDispatcher("Mascotas/editarMascota.jsp").forward(req, res);

        } catch (Exception e) {
            req.setAttribute("resultado", "❌ Error cargando mascota: " + e.getMessage());
            req.getRequestDispatcher("index.jsp").forward(req, res);
        }
    }

    // 🟢 ACTUALIZAR DATOS (POST)
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            req.setCharacterEncoding("UTF-8");

            int id = Integer.parseInt(req.getParameter("id"));
            String nombre = req.getParameter("nombre");
            String raza = req.getParameter("raza");

            String edadStr = req.getParameter("edad");
            int edad = (edadStr != null && !edadStr.isEmpty())
                    ? Integer.parseInt(edadStr)
                    : 0;

            String genero = req.getParameter("genero");
            String foto = req.getParameter("foto");

            int idTipo = Integer.parseInt(req.getParameter("idTipoMascota"));
            int idProp = Integer.parseInt(req.getParameter("idPropietario"));

            GestionarMascota gm = new GestionarMascota();

            boolean ok = gm.actualizar(id, nombre, raza, edad, genero, foto, idTipo, idProp);

            if (ok) {
                // ✔ redirección correcta (evita reenvío de formulario)
                res.sendRedirect(req.getContextPath() + "/svActualizarMascota");
            } else {
                req.setAttribute("resultado", "❌ No se pudo actualizar la mascota");
                req.getRequestDispatcher("Mascotas/editarMascota.jsp").forward(req, res);
            }

        } catch (Exception e) {
            req.setAttribute("resultado", "❌ Error: " + e.getMessage());
            req.getRequestDispatcher("Mascotas/editarMascota.jsp").forward(req, res);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet de actualización de mascotas";
    }
}