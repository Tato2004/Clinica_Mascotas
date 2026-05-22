package Controller.svInicioSesion;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/svCerrarSesion")
public class svCerrarSesion extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession sesion = req.getSession(false);
        if (sesion != null) sesion.invalidate();
        res.sendRedirect(req.getContextPath() + "/Inicio/iniciodesesion.jsp");
    }
}