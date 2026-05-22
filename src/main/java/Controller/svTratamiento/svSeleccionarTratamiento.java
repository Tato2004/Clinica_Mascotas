package Controller.svTratamiento;

import Controller.Gestiones.GestionarTratamientos;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/svSeleccionarTratamiento")
public class svSeleccionarTratamiento extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse res)
            throws ServletException, IOException {

        GestionarTratamientos gt =
                new GestionarTratamientos();

        req.setAttribute(
                "tratamientos",
                gt.listar()
        );

        req.getRequestDispatcher(
                "Tratamiento/seleccionarTratamiento.jsp"
        ).forward(req, res);
    }
}