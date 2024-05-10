package sv.edu.udb.desafio_3.model;

import sv.edu.udb.desafio_3.beans.Materia;
import utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddSubjectModel {
    public void addSubject(Materia materia)  throws SQLException {
        Connection conn = null;
        PreparedStatement st;
        int affectedRows = 0;
        ResultSet rs;

        try {

            conn = DBConnection.getConnection();
            String SQLSTUDENT = "INSERT INTO materias (IdMateria, nombre) VALUES ( ?, ?)";
            st = conn.prepareStatement(SQLSTUDENT);
            st.setInt(1, materia.getIdMateria());
            st.setString(2, materia.getMateria());

            affectedRows = st.executeUpdate();

        }catch ( SQLException e ){
            System.out.println(e.getMessage());

        }finally {
            if (conn != null){
                conn.close();
            }
        }
    }
}
