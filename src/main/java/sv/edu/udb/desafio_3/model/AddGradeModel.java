package sv.edu.udb.desafio_3.model;

import sv.edu.udb.desafio_3.beans.Grade;
import sv.edu.udb.desafio_3.beans.Student;
import utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AddGradeModel {
    public int AddGrade(Grade grade )  throws SQLException {
        Connection conn = null;
        PreparedStatement st;
        int affectedRows = 0;
        ResultSet rs;

        try {

            conn = DBConnection.getConnection();
            String SQLSTUDENT = "INSERT INTO notas (IdEstudiante, IdMateria, nota) VALUES (?, ?, ?)";
            st = conn.prepareStatement(SQLSTUDENT);
            st.setInt(1, grade.getIdEstudiante());
            st.setInt(2, grade.getIdMateria());
            st.setDouble(3, grade.getNota());

            affectedRows = st.executeUpdate();

        }catch ( SQLException e ){
            System.out.println(e.getMessage());

        }finally {
            if (conn != null){
                conn.close();
            }
        }
        return affectedRows;
    }

    public List<Integer> getAvailableSubjects(int studentId) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Integer> availableSubjects = new ArrayList<>();

        try {
            conn = DBConnection.getConnection();

            // Consulta SQL para obtener las materias disponibles para el estudiante
            String sql = "SELECT IdMateria FROM materias WHERE IdMateria NOT IN " +
                    "(SELECT IdMateria FROM notas WHERE IdEstudiante = ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, studentId);
            rs = ps.executeQuery();

            // Procesar el resultado de la consulta
            while (rs.next()) {
                int subjectId = rs.getInt("IdMateria");
                availableSubjects.add(subjectId);
            }
        } finally {
            // Cerrar recursos
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return availableSubjects;
    }
}
