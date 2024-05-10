package sv.edu.udb.desafio_3.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sv.edu.udb.desafio_3.beans.Student;
import sv.edu.udb.desafio_3.model.addStudentModel;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddStudentController", value = "/add-student")
public class AddStudentController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int  idEstudiante = 0;
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        Student student = new Student(idEstudiante, nombres, apellidos, direccion, telefono);

        // Instanciar el modelo para agregar un estudiante
        addStudentModel addStudentModel = new addStudentModel();

        try {
            // Llamar al método para agregar un estudiante
            addStudentModel.AddStudent(student);

            System.out.println("succesfully added student");
            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            response.sendRedirect("error404.jsp");
        }
    }

}