package Controller.svTratamiento;

import Controller.Gestiones.GestionarTratamientos;
import Controller.Gestiones.GestionarProfesional;
import Controller.Gestiones.Tratamientos;

import java.io.IOException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "svEditarTratamiento", urlPatterns = {"/svEditarTratamiento"})
public class svEditarTratamiento extends HttpServlet {

    GestionarTratamientos gtx = new GestionarTratamientos();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Tratamientos t = gtx.obtenerPorId(id);

        
        GestionarProfesional gp = new GestionarProfesional();

        request.setAttribute("tratamiento", t);
        request.setAttribute("profesionales", gp.listar());

        request.getRequestDispatcher("Tratamiento/editarTratamiento.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String fechaStr = request.getParameter("fecha");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String descripcion = request.getParameter("descripcion");
        int idProfesional = Integer.parseInt(request.getParameter("idProfesional"));

        Timestamp fecha = Timestamp.valueOf(fechaStr.replace("T", " ") + ":00");

        boolean ok = gtx.actualizar(id, nombre, fecha, precio, descripcion, idProfesional);

        if (ok) {
            response.sendRedirect("svListarTratamiento");
        } else {
            response.sendRedirect("svListarTratamiento?error=1");
        }
    }
}