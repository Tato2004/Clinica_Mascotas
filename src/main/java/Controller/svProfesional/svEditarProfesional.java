/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.svProfesional;

import Controller.Gestiones.GestionarProfesional;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 *
 * @author crist
 */
@WebServlet(name = "svEditarProfesional", urlPatterns = {"/svEditarProfesional"})
public class svEditarProfesional extends HttpServlet {
    
    GestionarProfesional gp = new GestionarProfesional();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svEditarProfesional</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svEditarProfesional at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    int id = Integer.parseInt(request.getParameter("id"));

    GestionarProfesional gp = new GestionarProfesional();

    // buscar profesional
    Controller.Gestiones.Profesional p = gp.obtenerPorId(id);

    // enviar al JSP
    request.setAttribute("profesional", p);

    request.getRequestDispatcher("Profesional/editarProfesional.jsp")
           .forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String cedula = request.getParameter("cedula");
        String tipo = request.getParameter("tipo");
        
        
        boolean actualizado = gp.actualizar(
                id,
                nombre,
                apellido,
                telefono,
                correo,
                cedula,
                tipo
        );

        if (actualizado) {
            response.sendRedirect("svListarProfesional");
        } else {
            request.setAttribute("error", "No se pudo actualizar el profesional");
            request.getRequestDispatcher("Profesional/editarProfesional.jsp").forward(request, response);
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
