package Controller.svPropietario;

import Controller.Gestiones.GestionarPropietario;
import Controller.Gestiones.Propietario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "svAgregarPropietario", urlPatterns = {"/svAgregarPropietario"})
public class svAgregarPropietario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Propietario/agregarPropietario.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre    = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String cedula    = request.getParameter("cedula");
        String telefono  = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String correo    = request.getParameter("correo");
        String usuario   = request.getParameter("usuario");
        String clave     = request.getParameter("clave");

        Propietario p = new Propietario();
        p.setNombre(nombre);
        p.setApellidos(apellidos);
        p.setCedula(cedula);
        p.setTelefono(telefono);
        p.setDireccion(direccion);
        p.setCorreo(correo);

        GestionarPropietario gp = new GestionarPropietario();
        boolean ok = gp.registrarPropietarioConUsuario(p, usuario, clave);

        if (ok) {
            response.sendRedirect(
                request.getContextPath() + "/Inicio/iniciodesesion.jsp"
            );
        } else {
            request.setAttribute("error", "❌ Error al registrar. Intenta de nuevo.");
            request.getRequestDispatcher("Propietario/agregarPropietario.jsp")
                   .forward(request, response);
        }
    }
}