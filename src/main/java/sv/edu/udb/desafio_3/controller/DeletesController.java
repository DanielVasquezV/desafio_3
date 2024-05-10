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

@WebServlet(name = "delete", value = "/delete")
public class DeletesController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// Obtener el parámetro "tipo" para decidir qué acción tomar
        String tipo = request.getParameter("tipo");
        String id = request.getParameter("id");
        String sqlDelete;

        // Verificar el tipo de eliminación
        if (tipo != null) {
            if (tipo.equalsIgnoreCase("estudiante")) {
                // Eliminar estudiante
                sqlDelete = "DELETE FROM estudiantes WHERE IdEstudiante = ?";
            } else if (tipo.equalsIgnoreCase("materia")) {
                // Eliminar materia
                sqlDelete = "DELETE FROM materias WHERE IdMateria = ?";
            } else {
                // Tipo de eliminación no válido
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tipo de eliminación no válido.");
                return;
            }

            // Realizar la eliminación
            try (PreparedStatement stmt = DBConnection.getConnection().prepareStatement(sqlDelete)) {
                stmt.setString(1, id); // Establecer el ID a eliminar
                stmt.executeUpdate();

                // Redirigir a la página correspondiente después de la eliminación
                if (tipo.equalsIgnoreCase("estudiante")) {
                    response.sendRedirect("students_view.jsp");
                } else if (tipo.equalsIgnoreCase("materia")) {
                    response.sendRedirect("subjects_view.jsp");
                }
            } catch (SQLException e) {
                // Manejo de errores de SQL
                throw new RuntimeException("Error al eliminar registro: " + e.getMessage(), e);
            }
        } else {
            // Parámetro tipo no especificado
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parámetro 'tipo' no especificado.");
        }
    }
}
