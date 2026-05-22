package Controller.svInicioSesion;

import Controller.Gestiones.GestionarUsuario;
import Controller.Gestiones.Usuario;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "svInicioSesion", urlPatterns = {"/svInicioSesion"})
public class svInicioSesion extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(
                request.getContextPath()
                + "/Inicio/iniciodesesion.jsp"
        );
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        GestionarUsuario gu = new GestionarUsuario();

        Usuario u = gu.login(usuario, clave);

        if (u != null) {

            HttpSession sesion = request.getSession();

            sesion.setAttribute("usuario", u.getUsuario());
            sesion.setAttribute("rol", u.getRol());
            sesion.setAttribute("idUsuario", u.getIdUsuario());

            switch (u.getRol()) {

                case "propietario":

                    response.sendRedirect(
                            request.getContextPath()
                            + "/homePropietario.jsp"
                    );

                    break;

                case "medico":

                    response.sendRedirect(
                            request.getContextPath()
                            + "/homeMedico.jsp"
                    );

                    break;

                case "estetico":

                    response.sendRedirect(
                            request.getContextPath()
                            + "/homeEstetico.jsp"
                    );

                    break;

                case "admin":

                    response.sendRedirect(
                            request.getContextPath()
                            + "/homeAdmin.jsp"
                    );

                    break;

                default:

                    response.sendRedirect(
                            request.getContextPath()
                            + "/Inicio/iniciodesesion.jsp"
                    );

                    break;
            }

        } else {

            request.setAttribute(
                    "error",
                    "❌ Usuario o contraseña incorrectos"
            );

            request.getRequestDispatcher(
                    "/Inicio/iniciodesesion.jsp"
            ).forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet Inicio de Sesión";
    }
}