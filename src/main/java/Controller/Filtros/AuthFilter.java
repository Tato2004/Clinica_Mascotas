package Controller.Filtros;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    private static final String[] RUTAS_LIBRES = {
        "/svInicioSesion",
        "/svAgregarPropietario",
        "/Inicio/iniciodesesion.jsp",
        "/Propietario/agregarPropietario.jsp",
        "/css/",
        "/img/",
        "/favicon.ico"
    };

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {

        HttpServletRequest  req    = (HttpServletRequest)  request;
        HttpServletResponse res    = (HttpServletResponse) response;
        HttpSession         sesion = req.getSession(false);

        String uri = req.getRequestURI();
        String ctx = req.getContextPath();

        // Permitir rutas libres
        for (String libre : RUTAS_LIBRES) {
            if (uri.contains(libre)) {
                chain.doFilter(request, response);
                return;
            }
        }

        // Sin sesión → al login
        if (sesion == null || sesion.getAttribute("rol") == null) {
            res.sendRedirect(ctx + "/Inicio/iniciodesesion.jsp");
            return;
        }

        String rol = (String) sesion.getAttribute("rol");

        // Proteger rutas de admin
        if (uri.contains("/homeAdmin") && !"admin".equals(rol)) {
            res.sendRedirect(ctx + "/accesoDenegado.jsp");
            return;
        }

        // Proteger rutas de propietario
        if (uri.contains("/homePropietario") && !"propietario".equals(rol)) {
            res.sendRedirect(ctx + "/accesoDenegado.jsp");
            return;
        }

        // Proteger rutas de medico
        if (uri.contains("/homeMedico") && !"medico".equals(rol)) {
            res.sendRedirect(ctx + "/accesoDenegado.jsp");
            return;
        }

        // Proteger rutas de estetico
        if (uri.contains("/homeEstetico") && !"estetico".equals(rol)) {
            res.sendRedirect(ctx + "/accesoDenegado.jsp");
            return;
        }

        chain.doFilter(request, response);
    }
}