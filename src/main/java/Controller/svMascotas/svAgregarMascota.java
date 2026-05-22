package Controller.svMascotas;

import Controller.Gestiones.GestionarMascota;
import Controller.Gestiones.GestionarTipoMascota;
import Controller.Gestiones.GestionarPropietario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "svAgregarMascota", urlPatterns = {"/svAgregarMascota"})
public class svAgregarMascota extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        GestionarTipoMascota gt = new GestionarTipoMascota();
        GestionarPropietario gp = new GestionarPropietario();

        req.setAttribute("tipos", gt.listar());
        req.setAttribute("propietarios", gp.listar());

        req.getRequestDispatcher("Mascotas/agregarMascota.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String nombre = req.getParameter("nombre");
        String raza = req.getParameter("raza");
        int edad = Integer.parseInt(req.getParameter("edad"));
        String genero = req.getParameter("genero");
        String foto = req.getParameter("foto");
        int idTipo = Integer.parseInt(req.getParameter("idTipoMascota"));
        int idProp = Integer.parseInt(req.getParameter("idPropietario"));

        GestionarMascota gm = new GestionarMascota();

        boolean ok = gm.agregar(nombre, raza, edad, genero, foto, idTipo, idProp);

        req.getSession().setAttribute(
                "resultado",
                ok ? "Mascota agregada correctamente" : "Error al agregar"
        );

        req.setAttribute("mascotas", gm.listar());
        req.getRequestDispatcher("index.jsp").forward(req, res);
    }
}