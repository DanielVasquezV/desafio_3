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

@WebServlet(name = "editSubject", value = "/editSubject")
public class EditSubjectController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String materiaId = request.getParameter("id");
        String materiaNombre = request.getParameter("nombre");
        String sqlMateria = "UPDATE materias SET nombre = ? WHERE IdMateria = ? ";
        try (PreparedStatement stmtMateria = DBConnection.getConnection().prepareStatement(sqlMateria)) {
            stmtMateria.setString(1, materiaNombre);
            stmtMateria.setString(2, materiaId);
            stmtMateria.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("subjects_view.jsp");
    }
}
