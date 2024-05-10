package sv.edu.udb.desafio_3.model;

import sv.edu.udb.desafio_3.beans.Student;
import utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddStudentModel extends DBConnection {

    public int AddStudent(Student student)  throws SQLException {
        Connection conn = null;
        PreparedStatement st;
        int affectedRows = 0;
        ResultSet rs;

        try {

            conn = DBConnection.getConnection();
            String SQLSTUDENT = "INSERT INTO estudiantes ( nombres, apellidos, direccion, telefono) VALUES (?, ?, ?, ?)";
            st = conn.prepareStatement(SQLSTUDENT);
            st.setString(1, student.getNombres());
            st.setString(2, student.getApellidos());
            st.setString(3, student.getDireccion());
            st.setString(4, student.getTelefono());
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
}
