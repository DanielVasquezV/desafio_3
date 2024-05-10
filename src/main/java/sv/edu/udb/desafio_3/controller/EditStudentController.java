package sv.edu.udb.desafio_3.controller;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.DBConnection;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "editStudent", value = "/editStudent")
public class EditStudentController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String idEstudiante = request.getParameter("estudianteId");
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        String sqlEstudiante = "UPDATE estudiantes SET nombres = ?, apellidos = ?, direccion = ?, telefono = ? WHERE IdEstudiante = ? ";
        try (PreparedStatement stmtEstudiante = DBConnection.getConnection().prepareStatement(sqlEstudiante)) {
            stmtEstudiante.setString(1, nombres);
            stmtEstudiante.setString(2, apellidos);
            stmtEstudiante.setString(3, direccion);
            stmtEstudiante.setString(4, telefono);
            stmtEstudiante.setString(5, idEstudiante);
            stmtEstudiante.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("students_view.jsp");
    }
}
