package Controller.svProfesional;

import Controller.Gestiones.GestionarProfesional;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;

@WebServlet("/svAgregarProfesional")
public class svAgregarProfesional extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("Profesional/agregarProfesional.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String nombre   = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String telefono = req.getParameter("telefono");
        String correo   = req.getParameter("correo");
        String cedula   = req.getParameter("cedula");
        String tipo     = req.getParameter("tipo");
        String usuario  = req.getParameter("usuario");
        String clave    = req.getParameter("clave");

        GestionarProfesional gp = new GestionarProfesional();
        boolean ok = gp.agregarConUsuario(nombre, apellido, telefono,
                                          correo, cedula, tipo,
                                          usuario, clave);

        req.setAttribute("resultado", ok ? "✅ Profesional registrado" : "❌ Error al registrar");
        req.setAttribute("listaProfesionales", gp.listar());
        req.getRequestDispatcher("Profesional/listarProfesional.jsp").forward(req, res);
    }
}