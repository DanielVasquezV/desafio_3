package sv.edu.udb.desafio_3.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.DBConnection;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "editGrade", value = "/editGrade")
public class EditGradeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String idEstudiante = request.getParameter("estudianteId");
        String idMateria = request.getParameter("materiaId");
        String nombreMateria = request.getParameter("materiaNombre");
        String nuevaNota = request.getParameter("nuevaNota");
        request.setAttribute("nombreMateria", nombreMateria);
        if (nuevaNota == null || nuevaNota.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "La nueva nota no puede ser nula o vacía.");
            return;
        }
        double nuevaNotaDouble = Double.parseDouble(nuevaNota);
        String sqlNota = "UPDATE notas SET nota = ? WHERE IdEstudiante = ? AND IdMateria = ?";
        try (PreparedStatement stmtNota = DBConnection.getConnection().prepareStatement(sqlNota)) {
            stmtNota.setDouble(1, nuevaNotaDouble);
            stmtNota.setString(2, idEstudiante);
            stmtNota.setString(3, idMateria);
            stmtNota.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("subject_details.jsp?idMateria="+idMateria+"&name="+nombreMateria);
    }
}