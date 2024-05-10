package sv.edu.udb.desafio_3.controller;

import java.io.*;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sv.edu.udb.desafio_3.beans.Materia;

import sv.edu.udb.desafio_3.model.AddSubjectModel;

@WebServlet(name = "AddSubjectControllerServlet", value = "/Add-subject")
public class AddSubjectController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int  IdMateria = 0;
        String nombre = request.getParameter("nombre");


        Materia materia = new Materia(IdMateria,nombre);

        // Instanciar el modelo para agregar un estudiante
        AddSubjectModel addSubjectModel = new AddSubjectModel();

        try {
            // Llamar al método para agregar un estudiante
            addSubjectModel.addSubject(materia);

            System.out.println("succesfully added subject");
            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            response.sendRedirect("error404.jsp");
        }
    }

}