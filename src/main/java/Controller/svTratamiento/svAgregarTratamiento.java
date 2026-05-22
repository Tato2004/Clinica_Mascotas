package Controller.svTratamiento;

import Controller.Gestiones.GestionarTratamientos;
import Controller.Gestiones.GestionarProfesional;
import java.io.IOException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "svAgregarTratamiento", urlPatterns = {"/svAgregarTratamiento"})
public class svAgregarTratamiento extends HttpServlet {

    GestionarTratamientos gtx = new GestionarTratamientos();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // cargar profesionales para el combo
        GestionarProfesional gp = new GestionarProfesional();

        request.setAttribute("profesionales", gp.listar());

        request.getRequestDispatcher("Tratamiento/agregarTratamiento.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String nombre = request.getParameter("nombre");
            String fechaStr = request.getParameter("fecha");
            String descripcion = request.getParameter("descripcion");

            double precio = Double.parseDouble(request.getParameter("precio"));
            int idProfesional = Integer.parseInt(request.getParameter("idProfesional"));

            
            fechaStr = fechaStr.replace("T", " ") + ":00";
            Timestamp fecha = Timestamp.valueOf(fechaStr);

            boolean ok = gtx.agregar(nombre, fecha, precio, descripcion, idProfesional);

            if (ok) {
                response.sendRedirect("svListarTratamiento");
            } else {
                response.sendRedirect("svListarTratamiento?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("svListarTratamiento?error=exception");
        }
    }
}