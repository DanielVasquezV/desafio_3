package sv.edu.udb.desafio_3.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sv.edu.udb.desafio_3.beans.EstudianteNota;
import utils.DBConnection;

@WebServlet(name = "subjectDetails", urlPatterns = "/subjectDetails")
public class SubjectDetailsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String materiaId = request.getParameter("idMateria");
        String nombreMateria = request.getParameter("name");

        if (materiaId == null) {
            response.sendRedirect("subjects_view.jsp");
            return;
        }

        List<EstudianteNota> estudianteNotas = new ArrayList<>();

        try (PreparedStatement statement = DBConnection.getConnection().prepareStatement(
                "SELECT e.nombres, e.apellidos, e.direccion, e.telefono, n.nota, e.IdEstudiante " +
                        "FROM estudiantes e " +
                        "JOIN notas n ON e.IdEstudiante = n.IdEstudiante " +
                        "WHERE n.IdMateria = ?")) {

            statement.setString(1, materiaId);
            ResultSet gradesStudentRs = statement.executeQuery();

            while (gradesStudentRs.next()) {
                EstudianteNota estudianteNota = new EstudianteNota();
                estudianteNota.setId(gradesStudentRs.getInt("IdEstudiante"));
                estudianteNota.setNombre(gradesStudentRs.getString("nombres"));
                estudianteNota.setApellidos(gradesStudentRs.getString("apellidos"));
                estudianteNota.setDireccion(gradesStudentRs.getString("direccion"));
                estudianteNota.setTelefono(gradesStudentRs.getString("telefono"));
                estudianteNota.setNota(gradesStudentRs.getDouble("nota"));
                estudianteNotas.add(estudianteNota);
            }

            request.setAttribute("estudianteNotas", estudianteNotas);
            request.setAttribute("materiaId", materiaId);
            request.setAttribute("nombreMateria", nombreMateria);
            RequestDispatcher dispatcher = request.getRequestDispatcher("subject_details.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error interno del servidor.");
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}