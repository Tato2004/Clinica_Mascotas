package Controller.svTratamiento;

import Controller.Gestiones.GestionarMascota;
import Controller.Gestiones.GestionarTratamientos;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/svVincularMascota")
public class svVincularMascota extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse res)
            throws ServletException, IOException {

        String idTxParam = req.getParameter("idTx");

        // VALIDAR
        if (idTxParam == null || idTxParam.isEmpty()) {

            res.sendRedirect(
                req.getContextPath() + "/svListarTratamiento"
            );

            return;
        }

        int idTx = Integer.parseInt(idTxParam);

        GestionarTratamientos gt =
                new GestionarTratamientos();

        GestionarMascota gm =
                new GestionarMascota();

        req.setAttribute(
                "tratamiento",
                gt.obtenerPorId(idTx)
        );

        req.setAttribute(
                "todasMascotas",
                gm.listar()
        );

        req.setAttribute(
                "mascotasVinculadas",
                gt.mascotasDeTratamientos(idTx)
        );

        req.getRequestDispatcher(
                "Tratamiento/vincularMascota.jsp"
        ).forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException, IOException {

        int idTx =
                Integer.parseInt(
                        req.getParameter("idTx")
                );

        int idMascota =
                Integer.parseInt(
                        req.getParameter("idMascota")
                );

        String accion =
                req.getParameter("accion");

        GestionarTratamientos gt =
                new GestionarTratamientos();

        boolean ok;

        if ("vincular".equals(accion)) {

            ok = gt.vincularMascota(
                    idTx,
                    idMascota
            );

            req.setAttribute(
                    "resultado",
                    ok
                    ? "✅ Mascota vinculada correctamente"
                    : "❌ Error al vincular mascota"
            );

        } else {

            ok = gt.desvincularMascota(
                    idTx,
                    idMascota
            );

            req.setAttribute(
                    "resultado",
                    ok
                    ? "✅ Mascota desvinculada correctamente"
                    : "❌ Error al desvincular mascota"
            );
        }

        GestionarMascota gm =
                new GestionarMascota();

        req.setAttribute(
                "tratamiento",
                gt.obtenerPorId(idTx)
        );

        req.setAttribute(
                "todasMascotas",
                gm.listar()
        );

        req.setAttribute(
                "mascotasVinculadas",
                gt.mascotasDeTratamientos(idTx)
        );

        req.getRequestDispatcher(
                "Tratamiento/vincularMascota.jsp"
        ).forward(req, res);
    }
}