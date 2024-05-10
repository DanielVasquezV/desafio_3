package sv.edu.udb.desafio_3.model;

import sv.edu.udb.desafio_3.beans.Materia;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import utils.DBConnection;

public class SelectModel {
    Connection conn;

    public ArrayList<Materia> showSubject(){
        ArrayList<Materia> lista = new ArrayList<>();
        try {
            conn = DBConnection.getConnection();
            String SQLSELECT = "SELECT * FROM materias";
            PreparedStatement ps = conn.prepareStatement(SQLSELECT);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Materia m = new Materia();
                m.setIdMateria(rs.getInt(1));
                m.setMateria(rs.getString(2));

                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Error, no se pudo renderizar");
            System.out.println(e.getMessage());
        }
        return lista;
    }
}
