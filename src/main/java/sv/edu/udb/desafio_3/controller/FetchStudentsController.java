package sv.edu.udb.desafio_3.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sv.edu.udb.desafio_3.beans.Student;
import utils.DBConnection;

@WebServlet(name = "fetchStudent", value = "/fetchStudent")
public class FetchStudentsController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> estudiantes = new ArrayList<>();

        try {
            String selectSql = "SELECT * FROM estudiantes";
            ResultSet subjResultSet = DBConnection.executeQueryWithResultSet(selectSql);
            while (subjResultSet.next()) {
                int idEstudiante = subjResultSet.getInt("idEstudiante");
                String nombres = subjResultSet.getString("nombres");
                String apellidos = subjResultSet.getString("apellidos");
                String telefono = subjResultSet.getString("telefono");
                String direccion = subjResultSet.getString("direccion");
                Student estudiante = new Student(idEstudiante, nombres, apellidos, direccion, telefono);
                estudiantes.add(estudiante);
            }
            request.setAttribute("estudiantes", estudiantes);
            request.getRequestDispatcher("students_view.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
