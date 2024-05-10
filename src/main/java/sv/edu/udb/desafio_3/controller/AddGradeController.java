package sv.edu.udb.desafio_3.controller;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sv.edu.udb.desafio_3.beans.Grade;
import sv.edu.udb.desafio_3.model.AddGradeModel;

@WebServlet(name = "AddGradeControllerServlet", value = "/Add-Grade")
public class AddGradeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int IdEstudiante = Integer.parseInt(request.getParameter("IdEstudiante"));
        int IdMateria = Integer.parseInt(request.getParameter("IdMateria"));
        double Grade = Double.parseDouble(request.getParameter("Nota"));

        Grade grade = new Grade( IdEstudiante, IdMateria, Grade );
        int studentId = Integer.parseInt(request.getParameter("IdEstudiante"));
        int subjectId = Integer.parseInt(request.getParameter("IdMateria"));


        try {

            AddGradeModel addGradeModel = new AddGradeModel();
            List<Integer> availableSubjects = addGradeModel.getAvailableSubjects(studentId);

            if (!availableSubjects.contains(subjectId)) {
                // Si el estudiante ya tiene una nota para esta materia, redirigir a una página de error
                request.setAttribute("errorMessage", "El estudiante ya tiene una nota para esta materia.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("modal.jsp");
                dispatcher.forward(request, response);
            } else {
                addGradeModel.AddGrade(grade);
                response.sendRedirect("add_grade.jsp");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            response.sendRedirect("error404.jsp");
        }
    }
}
