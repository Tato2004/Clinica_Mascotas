package Controller.svMascotas;

import Controller.Gestiones.GestionarMascota;
import Controller.Gestiones.GestionarUsuario;
import Controller.Gestiones.Mascota;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.List;

@WebServlet("/svMisMascotas")
public class svMisMascotas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession sesion = req.getSession(false);

        // Verificar sesión y rol
        if (sesion == null || !"propietario".equals(sesion.getAttribute("rol"))) {
            res.sendRedirect(req.getContextPath() + "/Inicio/iniciodesesion.jsp");
            return;
        }

        int idUsuario = (int) sesion.getAttribute("idUsuario");

        // Obtener idPropietario desde el idUsuario
        GestionarUsuario gu = new GestionarUsuario();
        int idPropietario = gu.obtenerIdPropietario(idUsuario);

        if (idPropietario <= 0) {
            req.setAttribute("error", "No se encontró el propietario asociado a tu cuenta.");
            req.getRequestDispatcher("Mascotas/misMascotas.jsp").forward(req, res);
            return;
        }

        // Obtener mascotas del propietario
        GestionarMascota gm = new GestionarMascota();
        List<Mascota> mascotas = gm.listarPorPropietario(idPropietario);

        req.setAttribute("mascotas", mascotas);
        req.getRequestDispatcher("Mascotas/misMascotas.jsp").forward(req, res);
    }
}