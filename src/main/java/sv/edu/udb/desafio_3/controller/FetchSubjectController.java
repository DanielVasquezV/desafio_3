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
import sv.edu.udb.desafio_3.beans.Materia;
import utils.DBConnection;

@WebServlet(name = "fetchSubject", value = "/fetchSubject")
public class FetchSubjectController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Materia> materias = new ArrayList<>();

        try {
            String selectSql = "SELECT idMateria, nombre FROM materias";
            ResultSet subjResultSet = DBConnection.executeQueryWithResultSet(selectSql);
            while (subjResultSet.next()) {
                int idMateria = subjResultSet.getInt("idMateria");
                String nombre = subjResultSet.getString("nombre");
                Materia materia = new Materia(idMateria, nombre);
                materias.add(materia);
            }
            request.setAttribute("materias", materias);
            request.getRequestDispatcher("subjects_view.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
